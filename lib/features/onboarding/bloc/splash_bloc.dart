// ignore_for_file: lines_longer_than_80_chars, no_default_cases

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clarity/flutter_clarity.dart';
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

      final initFutures = <Future>[];
      /// get app data
      final initAppFuture = sl<AccountRepository>().initApp(InitAppParams(
          deviceType: 1,
          deviceVersion: appState.deviceVersion,
        ),
      );
      initFutures.add(initAppFuture);
      if(appState.authenticated){
        final getAppFuture = sl<AccountRepository>().getProfile();
        initFutures.add(getAppFuture);
      }

      final initFutureResults = await Future.wait(initFutures,);
      for (var e in initFutureResults) {
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
    // AccountBloc.instance.add(const GetProfileEvent());
    await sl<AccountRepository>().getProfile();
    HomeScreenController.intiHomeScreen();
    CompanyBloc.instance.add(GetCompaniesEvent(params: GetCompaniesParams()));
    final storage = Lween.storage; // sl<AppStorage>();
    final locale = Provider.of<LocaleProvider>(
      context,
      listen: false,
    );
    locale.init();
    await Future.wait([storage.init(), sl<FileManager>().init()]);
    // await storage.init();
    // await locale.init();
    // await sl<FileManager>().init();

    sl<NotificationService>().initFcmNotifications();
    _initClarity();
  }

  static _initClarity() {
    // Initialize Clarity.
    FlutterClarityPlugin().initialize(projectId: "ikxovf1t2y");

    final profile = sl<AppStateModel>().profile;
    // Set custom user id.
    if (Lween.appState.authenticated && profile.id != null) {
      FlutterClarityPlugin().setCustomUserId(
        profile.id!.toString(),);
    } else {
      if (Lween.appState.deviceId != null) {
        FlutterClarityPlugin().setCustomUserId(
            Lween.appState.deviceId.toString());
      }
    }
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
