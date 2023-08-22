// ignore_for_file: lines_longer_than_80_chars, no_default_cases

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/core/services/notification_service.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/models/init_app_entity.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:lween/features/account/params/init_app_params.dart';
import 'package:lween/features/account/params/update_token_params.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:lween/features/home/bloc/home_bloc.dart';
import 'package:lween/features/home/repo/account_repository.dart';
import 'package:lween/features/home/screens/home/home_screen_controller.dart';
import 'package:lween/features/notifications/screens/widgets/notification_item.dart';
import 'package:lween/features/transportation_entities/bloc/transportation_entities_bloc.dart';
import 'package:lween/features/transportation_entities/params/transportation_entities_params.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/services/files/file_manager.dart';
import 'package:lween/injection_container.dart';
import 'package:lween/main.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashInitEvent>(_initApp);
  }
  static FutureOr<void> _initApp(SplashInitEvent event, emit) async {
    emit(SplashLoading());
    final appState = sl<AppStateModel>();
    try {
      await appState.init();

      /// get app data
      final initAppFuture = sl<AccountRepository>().initApp(InitAppParams(
          deviceType: 1,
          deviceVersion: appState.deviceVersion,
        ),
      );
      final getAppFuture = sl<AccountRepository>().getProfile();
      final res = await Future.wait([initAppFuture, getAppFuture]);

      for (var e in res) {
        e.fold((l) => throw AppException(l.errorMessage,), (r) {
          if (r is InitAppEntity) {
            appState.initAppEntity = r;
          } else if (r is ProfileEntity) {

          }
        });
      }

      if (!appState.authenticated) {
        emit(
          SplashLoaded(
            SplashInitResult(
              isAuthenticated: appState.authenticated,
              isStayLoggedIn: appState.stayLoggedIn,
            ),
          ),
        );
        return;
      } else {
        await initApp(event.context);
        emit(
          SplashLoaded(
            SplashInitResult(
              isAuthenticated: appState.authenticated,
              isStayLoggedIn: appState.stayLoggedIn,
            ),
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        SplashError(
          message: e.toString(),
        ),
      );
    } finally {}
  }



  static Future initApp(
    context,
  ) async {
    HomeScreenController.intiHomeScreen();
    CompanyBloc.instance.add(GetCompaniesEvent(params: GetCompaniesParams()));
    AccountBloc.instance.add(const GetProfileEvent());
    final storage = Lween.storage; // sl<AppStorage>();
    final locale = Provider.of<LocaleProvider>(
      context,
      listen: false,
    );
    await storage.init();
    await locale.init();
    await sl<FileManager>().init();

    sl<NotificationService>().initFcmNotifications();
  }
}

class SplashInitResult {
  SplashInitResult({
    required this.isAuthenticated,
    required this.isStayLoggedIn,
  });

  bool isAuthenticated = false;
  bool isStayLoggedIn = false;
}
