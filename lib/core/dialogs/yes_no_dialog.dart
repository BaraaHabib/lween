part of 'app_dialogs.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({
    super.key,
    this.yesCallback,
    required this.message,
    this.noCallBack,
  });

  final Function? yesCallback;
  final Function? noCallBack;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   vertical: 15.hx,
      //   horizontal: 20.wx,
      // ),
      constraints: BoxConstraints(
        // minHeight: 0.25.sh,
        maxHeight: 0.7.sh,
      ),
      width: 0.7.sw,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: Styles.borderRadius30px,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(
          //   title,
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          20.vSpace,
          Text(
            message,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          20.vSpace,
          Row(
            children: [
              AppButton(
                onTap: () async {
                  await NavigationService.of(context).pop(true,);
                  yesCallback?.call();
                },
                content: Text(
                  S.of(context).yes,
                ),
              ),
              const Spacer(),
              AppButton(
                onTap: () async {
                  await NavigationService.of(context).pop(false,);
                  noCallBack?.call();
                },
                color: Colors.transparent,
                borderColor: Styles.colorSecondary,
                content: Text(
                  S.of(context).no,
                ),
              ),
            ],
          ),
          // CommonSizes.v10,
        ],
      ),
    );
  }
}
