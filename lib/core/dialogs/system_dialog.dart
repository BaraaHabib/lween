part of 'app_dialogs.dart';

class SystemDialog extends StatelessWidget {
  const SystemDialog({
    super.key,
    this.retry,
    required this.content,
    this.title = 'Error',
  });

  final Function? retry;
  final Widget content;
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
            content,
            20.vSpace,
            // CommonSizes.v10,
          ],
        ),
      ),
    );
  }
}
