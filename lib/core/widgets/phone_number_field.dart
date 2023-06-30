// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/widgets/common_widgets.dart';
import 'package:lween/core/widgets/text_field.dart';
import 'package:lween/main.dart';

import '../../../generated/l10n.dart';

class PhoneNumberField extends StatefulHookWidget {
  PhoneNumberField({
    required this.name,
    this.validator,
    Key? key,
    this.validationKey,
    this.onChanged,
    this.focusNode,
  }) : super(key: key);

  final String name;
  final GlobalKey<FormFieldState>? validationKey;
  final ValidationBuilder? validator;
  final Function(String? completePhone, Country selectedCountry, String phone)?
      onChanged;
  final FocusNode? focusNode;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  // @override
  late TextEditingController? countryController;

  late TextEditingController? phoneController;
  FocusNode? focusNode;
  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    countryController = useTextEditingController();
    phoneController = useTextEditingController();

    useEffect(() {
      focusNode = widget.focusNode ?? FocusNode();
      return () {};
    }, const []);

    return FormBuilderField(
      key: widget.validationKey,
      name: widget.name,
      validator: defaultPhoneValidator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (st) =>
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 11,
                    child: GestureDetector(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        showCountryPicker(
                          context: context,
                          showPhoneCode: true,
                          // optional. Shows phone code before the country name.
                          onSelect: (Country country) {
                            countryController!.text =
                            '${country.countryCode}+${country.phoneCode}';
                            selectedCountry = country;
                            final completePhoneNumber =
                                '+${selectedCountry?.phoneCode ??
                                ''}${phoneController!.text}';
                            widget.onChanged?.call(completePhoneNumber,
                                selectedCountry!, phoneController!.text);
                            st.setValue(completePhoneNumber);
                            if (widget.validationKey != null) {
                              final isValid = (widget
                                  .validationKey as GlobalKey<
                                  FormFieldState>)
                                  .currentState
                                  ?.validate();
                              if (isValid != null && !isValid) {
                                FocusManager.instance.primaryFocus
                                    ?.requestFocus(
                                    widget.focusNode);
                              }
                            }
                          },
                        );
                      },
                      child: AppTextField(
                        // suffixIcon: Padding(
                        //   padding: EdgeInsetsDirectional.only(
                        //     end: 15.wx,
                        //   ),
                        //   child: CommonWidgets.arrowDownWithColor(
                        //     Styles.FontColorLiteBlack5,
                        //   ),
                        // ),
                        controller: countryController!,
                        enabled: false,
                        hint: S.of(context).country,
                        hintFontColor: Styles.liteGrayColor,
                        fontSize: 14.spx,
                        inputFontColor: Styles.liteGrayColor,
                        // errorText: st.errorText
                        errorText: st.errorText != null ? '' : null,
                        errorStyle: const TextStyle(height: 0),
                      ),
                    ),
                  ),
                  13.hSpace,
                  Expanded(
                    flex: 15,
                    child: AppTextField(
                      controller: phoneController!,
                      keyboardType: TextInputType.number,
                      errorText: st.errorText != null ? '' : null,
                      errorStyle: const TextStyle(height: 0),
                      hint: S.of(context).phoneNumber,
                      onChanged: (val) {
                        if (selectedCountry != null) {
                          final completePhoneNumber =
                              '+${selectedCountry?.phoneCode ??
                              ''}${phoneController!.text}';

                          widget.onChanged?.call(
                            completePhoneNumber,
                            selectedCountry!,
                            phoneController!.text,
                          );
                          st.setValue(completePhoneNumber);
                          // st.didChange(completePhoneNumber);
                          if (widget.validationKey != null) {
                            final isValid = (widget.validationKey as GlobalKey<
                                FormFieldState>)
                                .currentState
                                ?.validate();
                            if (isValid != null && !isValid) {
                              FocusManager.instance.primaryFocus?.requestFocus(
                                  widget.focusNode);
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
              if (st.hasError) ...[
                7.vSpace,
                Row(
                  children: [
                    SizedBox(
                      width: 22.wx,
                    ),
                    Text(
                      st.errorText!,
                      style: Lween.theme.inputDecorationTheme.errorStyle,
                    ),
                  ],
                ),
              ]
            ],
          ),
    );
  }

  StringValidationCallback get defaultPhoneValidator =>
      ValidationBuilder()
          .required()
          .phone(S
          .of(context)
          .invalidphonenumber,)
          .add((value) {
        return ValidationBuilder().minLength(9).test(
            value?.replaceAll('+', ''));
      }).add((value) {
        return ValidationBuilder().maxLength(15).test(
            value?.replaceAll('+', ''));
      })
          .add((val) {
        return widget.validator?.test(val);
      })
          .build();
}
