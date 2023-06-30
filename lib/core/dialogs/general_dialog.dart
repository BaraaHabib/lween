
part of 'app_dialogs.dart';

class GeneralDialog extends StatelessWidget {
  const GeneralDialog({
    super.key,
    required this.content,
    required this.type,
    this.retry,
    this.icon,
    this.title = 'Error',
    this.actions = const [],
    this.titleStyle
  });

  final DialogType type;
  final Function? retry;
  final Widget content;
  final String title;
  final TextStyle? titleStyle;
  final List<DialogAction>? actions;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      vertical: 25.hx,
      horizontal: 18.wx,
    );
    return Dialog(
      surfaceTintColor: Colors.transparent,
      insetPadding: padding,
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Container(
              padding: padding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if(icon != null)
                    ...[
                      SizedBox(
                        height: 70.rx,
                        width: 70.rx,
                        child: icon!,
                      ),
                      5.vSpace,
                    ],
                  Text(
                    title,
                    style:titleStyle?? Lween
                        .theme
                        .textTheme
                        .displayLarge
                        ?.copyWith(
                      fontSize: 25.spx,
                    ),
                  ),
                  20.vSpace,
                  content,
                  20.vSpace,
                  if(actions != null && actions!.length > 1)...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for(DialogAction action in actions ?? [])
                        AppButton(
                          onTap: () async {
                            // await NavigationService.of(context).pop();
                            action.callback.call();
                          },
                          borderColor: action.borderColor,
                          color: action.color,
                          content: AppTextWidget(action.text,),
                          fixedSize: action.fixedSize,
                        ),
                    ],
                  )
                  ],
                  if(actions != null && actions!.length == 1)...[
                    Padding(
                      padding:   EdgeInsetsDirectional.symmetric(horizontal: 25.wx,),
                      child: ExpandedAppButton(
                        onTap: () async {
                          // await NavigationService.of(context).pop();
                          actions![0].callback.call();
                        },
                        borderColor: actions![0].borderColor,
                        color: actions![0].color,
                        content: AppTextWidget(actions![0].text,),
                      ),
                    )
                  ]
                  // CommonSizes.v10,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
