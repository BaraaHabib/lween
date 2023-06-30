// ignore_for_file: lines_longer_than_80_chars, no_default_cases

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
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
      if (true){//(!appState.authenticated) {
        await Future.delayed(const Duration(seconds: 3));
        emit(
          SplashLoaded(
            InitResult(
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
            InitResult(
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
    final storage = Lween.storage; // sl<AppStorage>();
    final locale = Provider.of<LocaleProvider>(
      context,
      listen: false,
    );
    await storage.init();
    await locale.init();
    await sl<FileManager>().init();

  }
}

class InitResult {
  InitResult({
    required this.isAuthenticated,
    required this.isStayLoggedIn,
  });

  bool isAuthenticated = false;
  bool isStayLoggedIn = false;
}
