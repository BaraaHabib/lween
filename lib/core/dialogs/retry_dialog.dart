part of 'app_dialogs.dart';

class RetryDialog extends StatelessWidget {
  const RetryDialog({
    super.key,
    this.retry,
    required this.message,
  });

  final Function? retry;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.7.sw,
      constraints: BoxConstraints(
        // minHeight: 0.25.sh,
        maxHeight: 0.7.sh,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: Styles.borderRadius30px,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         padding: const EdgeInsets.symmetric(vertical: 5,),
          //         decoration: BoxDecoration(
          //           color: Styles.darkCardColor,
          //           borderRadius: BorderRadius.only(
          //             topLeft: Styles.circularBorderRadius20px,
          //             topRight: Styles.circularBorderRadius20px,
          //           ),
          //         ),
          //         child: Text(
          //             title ?? S.current.retry,
          //             textAlign: TextAlign.center,
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .titleMedium
          //                 ?.copyWith(
          //               color: Colors.white,
          //             )
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // Text(
          //   title ?? S.current.retry,
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 15.hx,
              horizontal: 20.wx,
            ),
            child: Column(
              children: [
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
              ],
            ),
          ),
          // CommonSizes.v10,
        ],
      ),
    );
  }
}
