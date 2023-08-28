part of 'change_phone.dart';


class ResendButton extends HookWidget {
  const ResendButton({super.key, });

  @override
  Widget build(BuildContext context) {
    final ChangePhoneDialogController controller = Controller.getInstance();
    final height = 24.hx;
    return BlocBuilder<AccountBloc, AccountState>(
      bloc: AccountBloc.instance,
      buildWhen: (ps, cs) => cs is ResendCodeState,
      builder: (context, state) {
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
    );
  }
}

