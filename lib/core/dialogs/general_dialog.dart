
part of 'app_dialogs.dart';

class GeneralDialog extends StatelessWidget {
  const GeneralDialog({
    super.key,
    required this.content,
    this.type,
    this.retry,
    this.icon,
    this.title = 'Error',
    this.actions = const [],
    this.titleStyle
  });

  final DialogType? type;
  final Function? retry;
  final Widget content;
  final String title;
  final TextStyle? titleStyle;
  final List<DialogAction>? actions;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      vertical: 10.hx,
      horizontal: 18.wx,
    );
    return Dialog(
      surfaceTintColor: Colors.transparent,
      insetPadding: padding,
      backgroundColor:  Styles.dialogBackgroundColor(context),
      child: IntrinsicHeight(
        child: Stack(
          children: [
            Positioned.fill(
              child: AppImage(
                path: Assets.backgroundImage(context),
                fit: BoxFit.cover,
                type: ImageType.asset,
                borderRadius: BorderRadius.all(Styles.circularBorderRadius20px,),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8,),
                        decoration: BoxDecoration(
                          color: Styles.darkCardColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Styles.circularBorderRadius20px,
                            topRight: Styles.circularBorderRadius20px,
                          ),
                        ),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style:titleStyle?? Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                            color: Colors.white,
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: padding,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 8.vSpace,
                        Expanded(child: content),
                        if(actions != null && actions!.length > 1)...[
                          ...[
                            15.vSpace,
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for(DialogAction action in actions ?? [])
                                AppGradientTextButton(
                                  onTap: () {
                                    action.callback.call();
                                  },
                                  content: action.text,
                                  // content: S.of(context).send,
                                ),
                              // AppButton(
                              //   onTap: () async {
                              //     // await NavigationService.of(context).pop();
                              //     action.callback.call();
                              //   },
                              //   borderColor: action.borderColor,
                              //   color: action.color,
                              //   content: AppTextWidget(action.text,),
                              //   fixedSize: action.fixedSize,
                              // ),
                            ],
                          ),]
                        ],
                        if(actions != null && actions!.length == 1)...[
                          Padding(
                            padding: EdgeInsetsDirectional.only(start: 50.wx,end: 50.wx,top: 15.hx,),
                            child: AppGradientTextButton(
                              onTap: () async {
                                await NavigationService.of(context).pop();
                                actions![0].callback.call();
                              },
                              borderColor: actions![0].borderColor,
                              color: actions![0].color,
                              content: actions![0].text,
                            ),
                          )
                        ],
                        if(actions != null)
                          20.vSpace,
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
