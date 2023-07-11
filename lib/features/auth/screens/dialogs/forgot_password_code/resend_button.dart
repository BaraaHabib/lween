part of 'forgot_password_code.dart';


class ResendButton extends HookWidget {
  const ResendButton({super.key,required this.state, });

  final AccountState state;
  @override
  Widget build(BuildContext context) {
    final ForgotPasswordCodeDialogController controller = Controller.get();
    final height = 30.hx;
    return SizedBox(
      height: height,
      child: Builder(
        builder: (context) {
          if(state is ResendCodeLoading){
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Transform.scale(
                    scale: 0.6,
                    child: const WaitingWidget(),
                ),
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const Spacer(),
              SvgPicture.asset(
                Assets.refreshIcon,
              ),
              4.hSpace,
              AppTextButton(
                onPressed: controller.resendCode,
                child: Text(
                  S
                      .of(context)
                      .resendCode,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                      color: Styles.textButtonColor
                  ),
                ),
              ),
              const Spacer(),
            ],
          );
        }
      ),
    );
  }
}

