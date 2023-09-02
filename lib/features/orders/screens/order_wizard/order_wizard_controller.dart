


import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/messages/toast.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/routing/app_router.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/params/create_order_params.dart';
import 'package:lween/features/orders/screens/order_wizard/payment_mixin.dart';
import 'package:lween/features/orders/screens/order_wizard/phone_payment_controller.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/features/transportation_entities/repo/transportation_entities_repository.dart';
import 'package:lween/generated/l10n.dart';
import 'package:lween/injection_container.dart';

class OrderWizardController extends Controller with PaymentMixin {
  TextEditingController dateController = TextEditingController();

  OrderWizardController({
    this.travelEntity,
    // this.selectedCompanyEntity,
  });

  TravelEntity? travelEntity;
  TravelEntity? selectedTravelEntity;


  DropdownItemDataModel? selectedFromCity;
  DropdownItemDataModel? selectedToCity;
  DropdownItemDataModel? selectedCompany;
  CompanyEntity? get selectedCompanyEntity => CompaniesRepository.companies.firstWhereOrNull((c) => c.id == selectedCompany?.id);
  DateTime? selectedDate;
  String? get selectedDateFormatted =>
      selectedDate == null ? null :
      AppConfigurations.appDisplayDateFormat.format(selectedDate!);


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

  List<LiteCompanyEntity> companiesEntities = [];

  @override
  void init() {
    super.init();
    baseController = this;
    // fillCompanies(CompaniesRepository.companies);

    selectedFromCity =
        cities.firstWhereOrNull((c) => c.id == travelEntity?.fromCity?.id,);
    selectedToCity =
        cities.firstWhereOrNull((c) => c.id == travelEntity?.toCity?.id,);

    if (travelEntity != null) {
      // orderBodyNotifier.value = orderBodyNotifier.value.copyWith(
      //   travelId: travelEntity?.id,
      // );
      selectedCompany = DropdownItemDataModel(
        name: travelEntity?.transportationEntity?.name ?? '',
        id: travelEntity?.transportationEntity?.id ?? 0,
      );
      companies = companies.toList()
        ..add(selectedCompany!);
      companyDropDownKey?.currentState?.setValue(
        selectedCompany,
      );
    }
  }


  //#region from-to screen
  final fromToFormKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderFieldState>? fromCityKey = GlobalKey<FormBuilderFieldState>();
  final GlobalKey<FormBuilderFieldState>? toCityKey = GlobalKey<FormBuilderFieldState>();
  final GlobalKey<FormBuilderFieldState>? dateFieldKey = GlobalKey<FormBuilderFieldState>();
  final GlobalKey<FormBuilderFieldState>? companyDropDownKey = GlobalKey<FormBuilderFieldState>();

  String get fromToTitle =>
      '${S.current.bookATrip}'
          '${isTravelAlreadySelected ? ' (${travelEntity!.transportationEntity?.name})' : ''}';

  void listener(BuildContext context, OrdersState state) {
    /// clear selected travel on error
    if (state is CompanyFilteredTravelsError) {
      clearSelectedTravel();
      AppToast(state.message ?? '').show();
    }
    else if (state is CompanyFilteredTravelsLoaded) {
      fillTravels(state.travelsResult.travels ?? []);

      /// clear selected travel and companies when no trips available
      if (state.travelsResult.travels?.isEmpty ?? true) {
        clearSelectedTravel();
        fillCompanies([]);
      }
      else {
        /// ---- extract companies from travels and fill them in dropdown
        Set<LiteCompanyEntity> companies = {};
        companies.addAll(state.travelsResult.travels!.map((e) => e.transportationEntity!).toList());
        /// when travel is selected, ensure travel company is present in companies
        if(isTravelAlreadySelected) {
          companies.add(travelEntity!.transportationEntity!);
        }
        fillCompanies(companies.toList());
        /// ----

        /// if extracted companies does not contain previously selected company, clear selection
        if (companies.none((c) => c.id == selectedCompany?.id)) {
          clearSelectedCompany();
        }
        /// select first retrieved company
        else if (companies.isNotEmpty && selectedCompany == null) {
         setSelectedCompany(companies.first);
        }

        /// if we already selected travel, set it as selected, and select its company
        if(isTravelAlreadySelected){
          setSelectedCompany(travelEntity?.transportationEntity);
          var sTravel = state
              .travelsResult
              .travels
              ?.firstWhereOrNull((e) => e.id == travelEntity?.id && e.transportationEntity?.id == selectedCompany?.id);
          selectTravel(sTravel);
        }

        // /// if i already selected a trip before starting the wizard
        // /// check if the trip exists in the selected date
        // if(isTravelAlreadySelected){
        //   final sTravel = state.travelsResult.travels?.firstWhereOrNull((e) => e.id == travelEntity?.id);
        //   if(sTravel != null){
        //     selectTravel(sTravel);
        //   }
        // }
      }
    }
  }

  bool buildWhen(OrdersState previous, OrdersState current) =>
      current is CompanyFilteredTravelsState;

  bool listenWhen(OrdersState previous, OrdersState current) =>
      current is CompanyFilteredTravelsState;

  fillCompanies(List<LiteCompanyEntity> companies) {
    this.companies = this.companies.toList()
      ..clear();
    this.companies = companies.map((e) =>
        DropdownItemDataModel(
          name: e.name ?? '',
          id: e.id!,
        ),)
        .toList();
    companiesEntities.clear();
    companiesEntities.addAll(companies);
  }

  getTravels() {
    if (selectedFromCity != null &&
        selectedToCity != null && selectedDate != null) {
      OrdersBloc.instance.add(GetFilteredTravelsEvent(
        date: selectedDate!,
        fromCity: selectedFromCity!.id,
        toCity: selectedToCity!.id,
        // ids: isTravelAlreadySelected ? [travelEntity?.id ?? ''] : [],
        companyId: isTravelAlreadySelected ? travelEntity!.transportationEntity?.id : null,
        ),
      );
    }
  }

  goToSeats(BuildContext context) {
    if (fromToFormKey.currentState?.validate() ?? false) {
      if (travelsResult?.isEmpty ?? true) {
        AppToast(S.current.noTripsAvailableForThisDate).show();
        return;
      }

      if (isTravelAlreadySelected) {
        var travel = travelsResult?.firstWhereOrNull((e) =>
        e.fromCity?.id == selectedFromCity?.id &&
            e.toCity?.id == selectedToCity?.id &&
            e.transportationEntity?.id == selectedCompany?.id &&
            e.id == travelEntity?.id
        );
        if(travel == null){
          AppToast(S.current.noTripsAvailableForThisDate).show();
          return;
        }
        selectTravel(travel,);
        NavigationService
            .of(context)
            .navigateTo(
           OrderSeatsScreenRoute(),
        );
      }
      else {
        NavigationService
            .of(context)
            .navigateTo(
          const OrderTravelsScreenRoute(),
        );
      }
    }
  }

  bool get isTravelAlreadySelected => travelEntity != null;
  bool get isTravelValid => selectedTravelEntity != null;
  List<TravelEntity>? travelsResult;

  
  clearSelectedTravel(){
    selectedTravelEntity = null;
  }
  clearSelectedCompany(){
    selectedCompany = null;
    // selectedCompanyEntity = null;
  }

  fillTravels(List<TravelEntity> t){
    travelsResult = t;
  }

  void setSelectedCompany(LiteCompanyEntity? first) {
    if(first == null){
      selectedCompany = null;
      return;
    }
    selectedCompany =
        DropdownItemDataModel(id: first.id ?? 0,
            name: first.name ?? '');

  }

  changeCompany(DropdownItemDataModel? v) {
    selectedCompany = v;
    final s = travelsResult
        ?.firstWhereOrNull((element) => element.transportationEntity?.id == v?.id)
        ?.transportationEntity;
    setSelectedCompany(s);
    var companyTravels = travelsResult?.where((t) => t.transportationEntity?.id == v?.id).toList() ?? [];
    if(isTravelAlreadySelected){
      final sTravel = companyTravels.toList().firstWhereOrNull((t) => t.id == travelEntity?.id);
      selectTravel(sTravel);
    }
    // companyDropDownKey?.currentState?.setValue(selectedCompany);
    // fromToFormKey.currentState?.fields['company']?.setValue(selectedCompany);
    // fromToFormKey.currentState?.fields['company']?.didChange(selectedCompany);
  }

  void selectTravel(TravelEntity? sTravel) {
    selectedTravelEntity = sTravel;
    orderBodyNotifier.value = CreateOrderBodyParams(seats: []);
  }

  //#endregion from-to screen

  //#region seats screen
  double get seatDimension => 1.sw / (maximumSeatsInRow + 0.7);

  int get maximumSeatsInRow {
    var ms = 0;
    for (List sr in selectedTravelEntity?.seats ?? []) {
      ms = max(ms, sr.length ?? 0);
    }
    return ms;
  }

  bool isSeatReserved(int number) =>
      travelEntity?.seats?.any((sr) =>
          sr.any((s) => s.number == number && !s.isAvailable!)) ?? false;

  bool isSeatSelected(int number) =>
      orderBody.seats?.any((seat) => seat.seatNumber == number,) ?? false;

  unSelectSeat(int number) {
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

  bool get userExceededAllowedSeatsWithoutPayment => selectedSeatsCount >
      selectedTravelEntity!.transportationEntity!
          .userAvailableSeatsWithoutPayment!;
  
  bool isSeatsDialogShown = false;
  int get selectedSeatsCount => orderBody.seats?.length ?? 0;

  /// toggle seat and return if seat is pressed or not
  bool seatPressed(int number, BuildContext context) {
    if (isSeatSelected(number)) {
      unSelectSeat(number);
    }
    else {
      selectSeat(number);
    }
    sortSeats();
    if (!isSeatsDialogShown && userExceededAllowedSeatsWithoutPayment) {
      AppDialogs.showGeneralDialog(
          context: context,
          title: S.of(context).importantWarning,
          content: AppTextWidget(
            S.of(context).exceededSeatsCountDialogMessage(selectedTravelEntity!.transportationEntity!
                .userAvailableSeatsWithoutPayment!),
            style: context.textTheme.titleMedium,
            maxLines: 4,
            textAlign: TextAlign.justify,
          ),
          actions: [
            DialogAction(text: S.current.ok, callback: (){}),
          ]
      );
      isSeatsDialogShown = true;
    }
    return isSeatSelected(number);
  }

  sortSeats() {
    orderBody.seats?.sort((s1, s2) =>
    s1.seatNumber?.compareTo(s2.seatNumber ?? 0) ?? 0);
  }

  goToPassengerNames(BuildContext context) {
    if (orderBody.seats?.isNotEmpty ?? false) {
      NavigationService.of(context).navigateTo(
        const OrderPersonInfoScreenRoute(),
      );
    }
  }

  //#endregion

  //#region passengers names screens

  Map<int?,TextEditingController> passengerNamesMap = {};

  GlobalKey<FormBuilderState> passengersInfoFormKey = GlobalKey<FormBuilderState>();


  void onCouponChanged(String? p1) {
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
      FocusManager.instance.primaryFocus?.unfocus();
      final newSeats = <SeatParam>[];
      for (SeatParam e in orderBody.seats ?? []) {
        final SeatParam newSeat = SeatParam(
          seatNumber: e.seatNumber,
          personName: passengerNamesMap[e.seatNumber]?.text.trim(),
        );
        newSeats.add(newSeat);
      }
      orderBody.seats = newSeats;
      /// update price
      baseController?.updateOrder(
        price: baseController?.totalPrice,
      );
      checkPaymentMethodValidity();
      NavigationService.of(context).navigateTo(
          const OrderPaymentMethodScreenRoute(),
      );
    }
  }

  checkPaymentMethodValidity(){

    /// if user exceeded allowed number of seats without payment
    if(selectedPaymentMethod.value?.isPayInCenter ?? false){
      if(userExceededAllowedSeatsWithoutPayment ) {
        selectedPaymentMethod.value = null;
      }
    }
    /// if user can't pay from wallet
    if(selectedPaymentMethod.value?.isFromWallet ?? false) {
      if (!sl<AppStateModel>().profile.canPayFromWallet(
          baseController?.orderBody.price)) {
        selectedPaymentMethod.value = null;
      }
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
    num? price,
    String? coupon,
  }) {
    orderBody = orderBody.copyWith(
      travelId: travelId,
      seats: seats,
      price: price?.toDouble(),
      paymentMethod: paymentMethod,
      orderCreationTimestamp: orderCreationTimestamp,
      executionDate: executionDate,
      coupon: coupon,
    );
  }

  double get totalPrice =>
      (orderBody.seats?.length ?? 0) * (selectedTravelEntity?.price?.toDouble() ?? 0);



//endregion

//#region travels screen
  List<VehicleType> get availableVehiclesTypes =>
      travelsResult?.fold(<VehicleType>{}, (previousValue, element) => previousValue..add(element.travelMethodEnum)).toList() ?? [];
  List<TravelEntity> travelsResultByVehicleType([VehicleType? type]) =>
      travelsResult?.where((e) => e.travelMethodEnum == type || type == null).toList() ?? [];

  selectTripAndGoToSeats(BuildContext context,TravelEntity item) {
    selectTravel(item);
    NavigationService
        .of(context)
        .navigateTo( OrderSeatsScreenRoute());
  }



//#endregion travels screen


}
