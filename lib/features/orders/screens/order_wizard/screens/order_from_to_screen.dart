

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/configurations/assets.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/controller/base_controller.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/lween/widgets/app_scaffold.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:lween/core/widgets/app_button.dart';
import 'package:lween/core/widgets/app_date_field.dart';
import 'package:lween/core/widgets/app_drop_down.dart';
import 'package:lween/core/widgets/app_image.dart';
import 'package:lween/core/widgets/app_text_widget.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/features/orders/bloc/orders_bloc.dart';
import 'package:lween/features/orders/models/daily_travels.dart';
import 'package:lween/features/orders/screens/order_wizard/order_wizard_controller.dart';
import 'package:lween/features/transportation_entities/models/transportation_entities.dart';
import 'package:lween/generated/l10n.dart';
part '../widgets/label_with_field.dart';

@RoutePage()
class OrderFromToScreen extends HookWidget {
  const OrderFromToScreen({
    this.travelEntity,
    this.companyEntity,
    super.key,
  });

  final TravelEntity? travelEntity;
  final CompanyEntity? companyEntity;

  @override
  Widget build(BuildContext context) {
    final OrderWizardController controller = Controller.getInstance(instance: OrderWizardController(
        travelEntity: travelEntity,
        // selectedCompanyEntity: companyEntity?.toLite,
      ),
    );
    return BlocConsumer<OrdersBloc,OrdersState>(
      bloc: OrdersBloc.instance,
      listener: controller.listener,
      buildWhen: controller.buildWhen,
      listenWhen: controller.listenWhen,
      builder: (context,state) {
        return IgnorePointer(
          ignoring: state is CompanyFilteredTravelsLoading,
          child: AppScaffold(
            title: S
                .of(context)
                .bookATrip,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: FormBuilder(
                    key: controller.fromToFormKey,
                    child: Column(
                      children: [
                        10.vSpace,
                        AppImage(
                          path: Assets.bookMapLocation(context),
                          type: ImageType.asset,
                          width: 310.wx,
                          height: 180.hx,
                        ),
                        SizedBox(
                          height: 5.hx,
                          child: AnimatedCrossFade(
                            firstChild: const LinearProgressIndicator(),
                            secondChild: const SizedBox.shrink(),
                            crossFadeState: state is CompanyFilteredTravelsLoading
                                ? CrossFadeState.showFirst
                                : CrossFadeState.showSecond,
                            duration: 300.milliseconds,
                          ),
                        ),
                        6.vSpace,
                        LabelWithField(
                          label: S
                              .of(context)
                              .source,
                          child: ValueListenableBuilder(
                            valueListenable: controller.citiesNotifier,
                            builder: (ctx, cities, child) =>
                                AppDropDownField(
                                  dropDownKey: controller.fromCityKey,
                                  onChange: (v) {
                                    controller.selectedFromCity = v;
                                    controller.getTravels();
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  hintText: S
                                      .of(context)
                                      .pleaseSelectCity,
                                  name: 'from',
                                  data: cities.toList()
                                    ..remove(controller.selectedToCity),
                                  // validator: controller.validateDropDownCity,
                                  initValue: controller.selectedFromCity,
                                  validator: FormBuilderValidators.required(),
                                ),
                          ),
                        ),
                        6.vSpace,
                        LabelWithField(
                          label: S
                              .of(context)
                              .destination,
                          child: ValueListenableBuilder(
                            valueListenable: controller.citiesNotifier,
                            builder: (ctx, cities, child) =>
                                AppDropDownField(
                                  dropDownKey: controller.toCityKey,
                                  onChange: (v) {
                                    controller.selectedToCity = v;
                                    controller.getTravels();
                                  },
                                  contentPadding: EdgeInsets.zero,
                                  hintText: S
                                      .of(context)
                                      .pleaseSelectCity,
                                  name: 'to',
                                  data: cities.toList()
                                    ..remove(controller.selectedFromCity),
                                  validator: FormBuilderValidators.required(),
                                  initValue: controller.selectedToCity,
                                ),
                          ),
                        ),
                        6.vSpace,
                        LabelWithField(
                          label: S
                              .of(context)
                              .travelDate,
                          child: GestureDetector(
                            onTap: () async {
                              var res = await DatePicker.showCustomDatePicker(
                                context,
                                controller.selectedDate ?? DateTime.now(),
                                // controller.selectedCompanyEntity?.futureAllowedSchedulingDays
                              );
                              if (res != null) {
                                controller.selectedDate = res;
                                controller.dateController.text =
                                    AppConfigurations.appDisplayDateFormat
                                        .format(res,);
                                controller.getTravels();
                                controller.dateFieldKey?.currentState
                                    ?.validate();
                              }
                            },
                            child: AppTextField(
                              enabled: false,
                              validationKey: controller.dateFieldKey,
                              controller: controller.dateController,
                              textAlign: TextAlign.center,
                              name: 'date',
                              hint: '-- / -- / ----',
                              inputFontColor: context.textTheme.titleMedium
                                  ?.color,
                              contentPadding: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              validator: FormBuilderValidators.required(),
                            ),
                          ),
                        ),
                        6.vSpace,
                        SizedBox(
                          height: 100.hx,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if(controller.travelsResult?.isEmpty ?? false)
                                AppTextWidget(
                                  S.current.noTripsAvailableForThisDate,
                                  style: context
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                    color: Styles.colorOrange,
                                  ),
                                )
                              else
                                if(!controller.isTravelAlreadySelected)
                                  ...[
                                    LabelWithField(
                                      label: S
                                          .of(context)
                                          .companyName,
                                      child: ValueListenableBuilder(
                                        valueListenable: controller
                                            .companiesNotifier,
                                        builder: (ctx, value, child) =>
                                            AppDropDownField(
                                              onChange: controller
                                                  .changeCompany,
                                              dropDownKey: controller
                                                  .companyDropDownKey,
                                              contentPadding: EdgeInsets.zero,
                                              hintText: S
                                                  .of(context)
                                                  .companyName,
                                              name: 'company',
                                              data: value,
                                              initValue: controller
                                                  .selectedCompany,
                                              validator: FormBuilderValidators
                                                  .required(),
                                            ),
                                      ),
                                    ),
                                    6.vSpace,
                                  ]
                                else
                                  const SizedBox.shrink(),
                            ],
                          ),
                        ),
                        // Spacer(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30.hx,
                  child: Hero(
                    tag: 'order-next',
                    child: AppGradientTextButton(
                      onTap: () {
                        controller.goToSeats(context);
                      },
                      gradientType: AppTextButtonGradientType.secondary,
                      content: S.current.next,
                    ),
                  ),)
              ],
            ),
          ),
        );
      }
    );
  }
}
