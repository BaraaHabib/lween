
part of '../screens/order_from_to_screen.dart';

class LabelWithField extends StatelessWidget {
  const LabelWithField({
    super.key,
    this.prefix,
    this.labelColor,
    this.labelPadding,
    required this.label,
    required this.child,
  });

  final String? prefix;
  final String label;
  final Color? labelColor;
  final Widget child;
  final EdgeInsetsGeometry? labelPadding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: labelPadding,
          child: Row(
            children: [
              if(prefix != null)
                AppTextWidget(prefix!,style: TextStyle(color: labelColor),),
              AppTextWidget(
                label,
                style: context.textTheme.headlineLarge?.copyWith(color: labelColor),
              ),
            ],
          ),
        ),
        3.vSpace,
        child,
      ],
    );
  }
}
