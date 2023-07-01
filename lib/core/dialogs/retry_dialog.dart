part of 'app_dialogs.dart';

class RetryDialog extends StatelessWidget {
  const RetryDialog({
    super.key,
    this.retry,
    required this.message,
    this.title = 'Error',
  });

  final Function? retry;
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
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: Styles.borderRadius30px,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            20.vSpace,
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            20.vSpace,
            AppButton(
              onTap: () async {
                await NavigationService.of(context).pop();
                retry?.call();
              },
              content: Text(S.of(context).retry),
            ),
            // CommonSizes.v10,
          ],
        ),
      ),
    );
  }
}
