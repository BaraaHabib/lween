


import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/screens/order_wizard/payment_mixin.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/repo/transportation_entities_repository.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';



class OrderWizardController extends Controller with PaymentMixin {
  TextEditingController dateController = TextEditingController();



  OrderWizardController({
    this.travelEntity,
    this.selectedCompanyEntity,
  });

  TravelEntity? travelEntity;


  DropdownItemDataModel? selectedFromCity;
  DropdownItemDataModel? selectedToCity;
  DropdownItemDataModel? selectedCompany;
  LiteCompanyEntity? selectedCompanyEntity;
  DateTime? selectedDate;


  final citiesNotifier = ValueNotifier<List<DropdownItemDataModel>>(sl<AppStateModel>()
      .cities().map((e) =>
      DropdownItemDataModel(
        name: e.name ?? '',
        id: e.id!,
      ),)
      .toList());

  List<DropdownItemDataModel> get cities => citiesNotifier.value;

  final companiesNotifier = ValueNotifier<List<DropdownItemDataModel>>([]);
  List<DropdownItemDataModel> get companies => companiesNotifier.value;

  set companies(List<DropdownItemDataModel> c) {
    companiesNotifier.value = c;
  }


  @override
  void init() {
    super.init();
    baseController = this;
    // fillCompanies(CompaniesRepository.companies);

    selectedFromCity =
        cities.firstWhereOrNull((c) => c.id == travelEntity?.fromCity?.id,);
    selectedToCity =
        cities.firstWhereOrNull((c) => c.id == travelEntity?.toCity?.id,);
    // selectedCompany =
    //     companies.firstWhereOrNull((c) => c.id == companyEntity?.id,);

    if (travelEntity != null) {
      orderBodyNotifier.value = orderBodyNotifier.value.copyWith(
        travelId: travelEntity?.id,
      );
      selectedCompanyEntity = travelEntity!.transportationEntity;
        selectedCompany = DropdownItemDataModel(
          name: selectedCompanyEntity!.name ?? '',
          id: selectedCompanyEntity!.id ?? 0,
        );
        companies = companies.toList()..add(selectedCompany!);
        companyDropDownKey?.currentState?.setValue(
          selectedCompany,
        );
    }
  }


  //#region from-to screen
  final fromToFormKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderFieldState>? companyDropDownKey = GlobalKey<FormBuilderFieldState>();
  final GlobalKey<FormBuilderFieldState>? dateFieldKey = GlobalKey<FormBuilderFieldState>();

  void listener(BuildContext context, OrdersState state) {
    if (state is CompanyFilteredTravelsError) {
      AppToast(state.message ?? '').show();
    }
    else if (state is CompanyFilteredTravelsLoaded) {
      if (state.travelsResult.travels?.isEmpty ?? true) {
        isTravelSelectedAndDateIsValid = false;
        fillCompanies([]);
        AppToast(S
            .of(context)
            .noTripsAvailableForThisDate).show();
      }
      else {
        /// get travels companies
        Set<LiteCompanyEntity> companies = {};
        for (var t in state.travelsResult.travels ?? []) {
          companies.add(t.transportationEntity!);
        }

        /// fill travels companies
        fillCompanies(companies.toList());
        // companyDropDownKey?.currentState?.didChangeDependencies();
        if (companies.none((c) => c.id == selectedCompany?.id)) {
          selectedCompany = null;
        }
        else if (companies.isNotEmpty && selectedCompany == null) {
          final c = companies.firstOrNull;
          selectedCompany =
              DropdownItemDataModel(id: c?.id ?? 0, name: c?.name ?? '');
          selectedCompanyEntity = companies.firstWhereOrNull((e) => e.id == selectedCompany?.id);
        }

        /// if i already selected a trip before starting the wizard
        /// check if the trip exists in the selected date
        if(isTravelAlreadySelected){
          if(state.travelsResult.travels?.any((t) => t.id == travelEntity!.id,) ?? false){
            isTravelSelectedAndDateIsValid = true;
            travelEntity = state.travelsResult.travels?.firstWhereOrNull((e) => e.id == travelEntity?.id);
          }
          else{
            isTravelSelectedAndDateIsValid = false;
            AppToast(S.current.noTripsAvailableForThisDate).show();
          }
        }
      }
    }
  }

  bool buildWhen(OrdersState previous, OrdersState current) =>
      current is CompanyFilteredTravelsState;

  bool listenWhen(OrdersState previous, OrdersState current) =>
      current is CompanyFilteredTravelsState;

  fillCompanies(List<LiteCompanyEntity> companies) {
    this.companies = this.companies.toList()..clear();
    this.companies = companies.map((e) =>
        DropdownItemDataModel(
          name: e.name ?? '',
          id: e.id!,
        ),)
        .toList();
  }

  getTravels() {
    if (selectedFromCity != null &&
        selectedToCity != null && selectedDate != null) {
      OrdersBloc.instance.add(GetFilteredTravelsEvent(
        date: selectedDate!,
        fromCity: selectedFromCity!.id,
        toCity: selectedToCity!.id,
        // companyId: selectedCompany!.id,
        ),
      );
    }
  }

  goToSeats(BuildContext context) {
    if(fromToFormKey.currentState?.validate() ?? false){
      if(isTravelAlreadySelected){
        if(isTravelSelectedAndDateIsValid){
            AutoRouter
                .of(context)
                .root
                .push(
              const OrderSeatsScreenRoute(),
            );
        }else{
          AppToast(S.current.noTripsAvailableForThisDate).show();
        }
      }else{

      }
    }
  }

  bool get isTravelAlreadySelected => travelEntity != null;

  bool isTravelSelectedAndDateIsValid = false;

  //#endregion from-to screen

  //#region seats screen
  double get seatDimension => 1.sw / (maximumSeatsInRow + 0.7);

  int get maximumSeatsInRow {
    var ms = 0;
    for (List sr in travelEntity?.seats ?? []) {
      ms = max(ms, sr.length ?? 0);
    }
    return ms;
  }

  bool isSeatReserved(int number) =>
      travelEntity?.seats?.any((sr) =>
          sr.any((s) => s.number == number && !s.isAvailable!)) ?? false;

  bool isSeatSelected(int number) =>
      orderBody.seats?.any((seat) => seat.seatNumber == number,) ?? false;

  unSelectSeat(number) {
    final seats = orderBody.seats?.toList();
    seats?.removeWhere((seat) => seat.seatNumber == number,);
    updateOrder(seats: seats,);
  }

  selectSeat(number) {
    final seats = orderBody.seats?.toList();
    seats?.add(SeatParam(
      seatNumber: number,
    ),
    );
    updateOrder(seats: seats,);
  }

  bool seatPressed(int number) {
    if (isSeatSelected(number)) {
      unSelectSeat(number);
      sortSeats();
      return false;
    }
    else {
      selectSeat(number);
      sortSeats();
      return true;
    }
  }

  sortSeats() {
    orderBody.seats?.sort((s1, s2) =>
    s1.seatNumber?.compareTo(s2.seatNumber ?? 0) ?? 0);
  }
  //#endregion

  //#region passengers names screens

  Map<int?,TextEditingController> passengerNamesMap = {};

  GlobalKey<FormBuilderState> passengersInfoFormKey = GlobalKey<FormBuilderState>();

  goToPassengerNames(BuildContext context) {
    if (orderBody.seats?.isNotEmpty ?? false) {
      NavigationService.of(context).navigateTo(
        const OrderPersonInfoScreenRoute(),
      );
    }
  }

  void onVoucherChanged(String? p1) {
  }


  void initPassengersNames() {
    for (SeatParam seat in orderBody.seats ?? []) {
      passengerNamesMap.update(
        seat.seatNumber, (value) {
          // value.text = seat.personName ?? '';
          return value;
        },
        ifAbsent: () => TextEditingController(),);
    }
  }

  goToPayment(BuildContext context) {
    if (passengersInfoFormKey.currentState?.saveAndValidate() ?? false) {
      for (SeatParam e in orderBody.seats ?? []) {
        final SeatParam newSeat = SeatParam(
          seatNumber: e.seatNumber,
          personName: passengerNamesMap[e.seatNumber]?.text.trim(),
        );
        orderBody.seats?.removeWhere((s) =>
        s.seatNumber == newSeat.seatNumber,);
        orderBody.seats?.add(newSeat);
      }
      NavigationService.of(context).navigateTo(
          const OrderPaymentMethodScreenRoute(),
      );
    }
  }

  //#endregion passengers names

  //#region order body
  CreateOrderBodyParams get orderBody => orderBodyNotifier.value;

  set orderBody(CreateOrderBodyParams value) {
    orderBodyNotifier.value = value;
  }

  final orderBodyNotifier = ValueNotifier<CreateOrderBodyParams>(
      CreateOrderBodyParams(seats: []));

  updateOrder({String? orderCreationTimestamp,
    String? travelId,
    String? executionDate,
    List<SeatParam>? seats,
    int? paymentMethod,
  }) {
    orderBody = orderBody.copyWith(
      travelId: travelId,
      seats: seats,
      price: totalPrice,
      paymentMethod: paymentMethod,
      orderCreationTimestamp: orderCreationTimestamp,
      executionDate: executionDate,
    );
  }



  double get totalPrice =>
      (orderBody.seats?.length ?? 0) * (travelEntity?.price?.toDouble() ?? 0);




//endregion

}
