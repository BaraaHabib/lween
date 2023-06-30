import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/widgets/app_text_button.dart';
import 'package:lween/core/widgets/app_text_widget.dart';


class AppCheckBoxWidget extends HookWidget {
  const AppCheckBoxWidget({
    required this.onChanged,
    required this.text,
    Key? key}) : super(key: key);
  final void Function(bool?) onChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
    final value = useState(false);
    return AppTextButton(
      onPressed: () {
        value.value = !value.value;
      },
      child: Row(
        children: [
          Checkbox(
            value: value.value, onChanged: onChanged,
          ),
          AppTextWidget(text),
        ],
      ),
    );
  }
}
