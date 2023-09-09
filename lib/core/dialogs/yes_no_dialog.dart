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
      width: 0.8.sw,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: Styles.borderRadius30px,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            5.vSpace,
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            20.vSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                // const Spacer(),
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
            5.vSpace,
          ],
        ),
      ),
    );
  }
}
