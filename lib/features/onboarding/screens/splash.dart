import 'package:auto_route/auto_route.dart';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lween/core/dialogs/app_dialogs.dart';
import 'package:lween/core/routing/app_router.dart';

import '../../../../../../core/configurations/assets.dart';
import '../../../core/configurations/styles/styles.dart';
import '../../../../../../core/navigation/navigation_service.dart';
import '../../../../../../injection_container.dart';
import '../bloc/splash_bloc.dart';

@RoutePage()
class SplashScreen extends HookWidget {
  SplashScreen({Key? key})
      : super(
          key: key,
        ) {
    // sl<SplashBloc>().add(SplashInitEvent());
  }
  final completedSteps = [];
  final bloc = sl<SplashBloc>();
  @override
  Widget build(BuildContext context) {
    // sl<SplashBloc>().add(SplashInitEvent());
    useEffect(() {

      sl<SplashBloc>().add(SplashInitEvent(
        context,
      ));
      return null;
    }, const []);
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => Future.value(false),
        child: BlocListener<SplashBloc, SplashState>(
          bloc: bloc,
          listener: (context, state) {
            if (state is SplashLoaded) {
              completedSteps.add(state);
              _handleLoaded(
                context,
                state: state,
              );
            } else if (state is SplashError) {
              _handleError(context, state);
            }
          },
          child:  Image.asset(
            Assets.splashScreen,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  void _handleLoaded(
    BuildContext context, {
    SplashState? state,
  }) {
    if (completedSteps.length >= 1) {
      var splashLoaded =
          completedSteps.firstWhereOrNull((element) => element is SplashLoaded);
      if (splashLoaded != null &&
          (splashLoaded as SplashLoaded).initResult.isAuthenticated) {
        // NavigationService.of(context).replace(
        //   const InboxScreenRoute(),
        // );
        NavigationService.of(context).clearAllAndPushNamed(
          const SignInScreenRoute(),
        );
        return;
      }
      NavigationService.of(context).clearAllAndPushNamed(
        const SignInScreenRoute(),
      );
    }
  }

  void _handleError(BuildContext context, SplashError state) {
    AppDialogs.showRetryDialog(
      context: context,
      content: state.message,
      retryCallBack: () {
        sl<SplashBloc>().add(SplashInitEvent(
          context,
        ));
      },
    );
  }

}
