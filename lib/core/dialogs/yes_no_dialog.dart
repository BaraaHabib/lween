part of 'app_dialogs.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({
    super.key,
    this.yesCallback,
    required this.message,
    this.title = '',
    this.noCallBack,
  });

  final Function? yesCallback;
  final Function? noCallBack;
  final String message;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15.hx,
          horizontal: 20.wx,
        ),
        constraints: BoxConstraints(
          // minHeight: 0.25.sh,
          maxHeight: 0.7.sh,
        ),
        width: 0.7.sw,
        decoration: BoxDecoration(
          color: Lween.theme.scaffoldBackgroundColor,
          borderRadius: Styles.borderRadius30px,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Lween.theme.textTheme.titleMedium,
            ),
            20.vSpace,
            Text(
              message,
              style: Lween.theme.textTheme.bodyMedium,
            ),
            20.vSpace,
            Row(
              children: [
                AppButton(
                  onTap: () async {
                    await NavigationService.of(context).pop();
                    yesCallback?.call();
                  },
                  content: Text(
                    S.of(context).yes,
                  ),
                ),
                const Spacer(),
                AppButton(
                  onTap: () async {
                    await NavigationService.of(context).pop();
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
      ),
    );
  }
}
