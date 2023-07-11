import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:intl/intl.dart';
import 'package:intl/message_format.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/numbers_ext.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/widgets/animated/animated_toggle.dart';
import 'package:provider/provider.dart';


enum AppTextFieldType {
  text,
  password,
}

class AppTextField extends HookWidget {
  const AppTextField(
      {this.name = '',
      this.focusNode,
      this.textAlignVertical,
      this.textAlign,
      this.controller,
      this.fillColor,
      this.onSubmitted,
      this.hint = '',
      this.type = AppTextFieldType.text,
      this.suffixIcon,
      this.hintFontColor,
      this.inputFontColor,
      this.fontSize,
      this.onChanged,
      this.validator,
      this.errorText,
      this.textCapitalization,
      this.enabled = true,
      this.keyboardType,
      this.prefixIcon,
      this.errorStyle,
      super.key,
      this.validationKey,
      this.constraints,
      this.maxLines = 1,
      this.maxLength = 120,
      this.enabledBorder,
      this.disabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.contentPadding,
      this.formatters = const [],
      this.autofocus,
      this.label,
        this.readOnly,
        this.onTap
      });
  final BoxConstraints? constraints;
  final AppTextFieldType type;
  final TextCapitalization? textCapitalization;
  final String name;
  final String hint;
  final String? errorText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool enabled;
  final Color? hintFontColor;
  final Color? inputFontColor;
  final Color? fillColor;
  final TextAlignVertical? textAlignVertical;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final double? fontSize;
  final TextStyle? errorStyle;
  final String? Function(String? value)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final int? maxLines;
  final int? maxLength;
  final List<TextInputFormatter> formatters;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final Key? validationKey;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? readOnly;
  final VoidCallback? onTap;
  final String? label;
  @override
  Widget build(BuildContext context) {
    ///
    final obscureTextState = useState(type == AppTextFieldType.password);
    useEffect(() {
      obscureTextState.value = type == AppTextFieldType.password;
      return;
    }, [type]);

    ///
    return Column(
      children: [
        ClipRRect(
          borderRadius: Styles.textFieldBorderRadius,
          child: AnimatedSize(
            duration: 300.milliseconds,
            child: Container(
              decoration:  BoxDecoration(
                color: Styles.textFieldColor,
                border: Border.all(color: Styles.textFieldColor,)
              ),
              child: Row(
                children: [
                  if(prefixIcon != null)
                    SizedBox(
                      width: 46.wx,
                      child: prefixIcon!,
                    ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10,bottom: 2),
                      child: FormBuilderTextField(
                        key: validationKey,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(maxLength),
                          ...formatters
                        ],
                        name: name,
                        style: fontSize != null || inputFontColor != null
                            ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: fontSize,
                          color: inputFontColor,
                        )
                            : null,
                        focusNode: focusNode ?? FocusNode(),
                        textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
                        textAlign: textAlign ?? TextAlign.start,
                        maxLines: maxLines,
                        textCapitalization: textCapitalization ?? TextCapitalization.none,
                        controller: controller,
                        obscureText: obscureTextState.value,
                        enabled: enabled,
                        keyboardType: keyboardType,
                        validator: validator,
                        decoration: InputDecoration(
                            fillColor: fillColor ?? Colors.white,
                            hintText: hint,
                            hintTextDirection: hint.preferredDirection,
                            constraints: constraints,
                            enabledBorder: enabledBorder,
                            focusedBorder: focusedBorder,
                            errorBorder: errorBorder,
                            contentPadding: contentPadding ??
                                const EdgeInsetsDirectional.only(start: 5
                                    // top: 0.wx,
                                    // bottom: 0.wx,
                                ),
                            disabledBorder: disabledBorder,
                            alignLabelWithHint: true,
                            suffixIcon: _suffixIcon(obscureTextState),
                            suffixIconConstraints: BoxConstraints(
                              minWidth: 20.wx,
                              maxWidth: 100.wx,
                              // minHeight: 48,
                            ),
                            // prefixIcon: prefixIcon,
                            // prefixIconConstraints: BoxConstraints(
                            //   minWidth: 46.wx,
                            //   maxWidth: 100.wx,
                            // ),
                            hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(
                              color: hintFontColor,
                            ),
                            errorText: null,
                            errorStyle: errorStyle,
                            labelText: label,
                            border: enabledBorder,
                            focusedErrorBorder: errorBorder,
                        ),
                        onChanged: (String? value) {
                          if (validationKey is GlobalKey<FormFieldState>) {
                            (validationKey as GlobalKey<FormFieldState>)
                                .currentState
                                ?.validate();
                          }
                          onChanged?.call(value);
                          // focusNode?.requestFocus();
                        },
                        onSubmitted: onSubmitted,
                        readOnly:readOnly ?? false,
                        autofocus: autofocus ?? false,
                        onTap: onTap,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // if(errorText.value != null)
        //   Row(
        //     children: [
        //       Text(errorText.value!,style: Theme.of(context).inputDecorationTheme.errorStyle,),
        //     ],
        //   )
      ],
    );
  }

  Widget? _suffixIcon(ValueNotifier<bool> obscureText) {
    switch (type) {
      case AppTextFieldType.text:
        return suffixIcon;
      case AppTextFieldType.password:
        return GestureDetector(
          onTap: () => obscureText.value = !obscureText.value,
          child: AnimatedToggle(
            value: obscureText.value,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                end: 15.wx,
              ),
              child: Icon(
                Icons.remove_red_eye_rounded,
                color: obscureText.value
                    ? Styles.colorSecondary2
                    : Theme.of(useContext()).primaryColor,
              ),
            ),
          ),
        );
    }
  }
}
