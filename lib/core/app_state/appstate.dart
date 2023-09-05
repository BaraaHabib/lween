// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:collection/collection.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:lween/core/configurations/styles/styles.dart';
import 'package:lween/core/configurations/styles/themes.dart';
import 'package:lween/core/features/entities/shared/city.dart';
import 'package:lween/core/features/entities/shared/country.dart';
import 'package:lween/core/navigation/navigation_service.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/features/account/models/init_app_entity.dart';
import 'package:lween/features/account/models/profile_entity.dart';
import 'package:lween/features/account/params/update_token_params.dart';
import 'package:lween/features/account/repo/account_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/services/files/file_manager.dart';
import 'package:lween/core/storage/shared_preferences/shared_preferences_items.dart';
import 'package:lween/features/account/bloc/account_bloc.dart';
import 'package:lween/features/account/params/refresh_token_params.dart';
import 'package:lween/main.dart';
import '../../../injection_container.dart';
import 'package:package_info_plus/package_info_plus.dart';
part 'device_info_mixin.dart';
part 'theme_manager.dart';
part 'app_data.dart';

abstract class AppStateComponent extends ChangeNotifier{

}

class AppStateModel extends AppStateComponent with _DeviceInfoMixin, ThemeManager, AppData {
  bool _authenticated = false;
  bool _rememberMe = false;
  String? _userToken;
  String? _firebaseToken;
  String? _refreshToken;
  String? _email;
  DateTime? _expiresAt;

  static AppLifecycleState appLifecycleState = AppLifecycleState.resumed;
  static bool get isResumed => appLifecycleState == AppLifecycleState.resumed;
  static bool get isPaused => appLifecycleState == AppLifecycleState.paused;

  bool get isTokenExpired {
    if (_userToken == null) {
      return true;
    }
    // if (_expiresAt == null && _userToken != null)
    //   return true;
    final remaining = _expiresAt!.difference(DateTime.now());
    if (remaining.inSeconds < 200) {
      return true;
    } //86390 for testing
    return false;
  }

  bool get authenticated => _authenticated;

  String? get userToken => _userToken;

  String? get firebaseToken => _firebaseToken;

  String? get refreshToken => _refreshToken;

  String? get email => _email;

  DateTime? get expiresAt => _expiresAt;

  static bool isRestartingApp = false;

  bool get stayLoggedIn => _rememberMe;


  set stayLoggedIn(bool value) {
    _rememberMe = value;
    prefs.setBool(SharedPreferencesKeys.IS_STAY_LOGGED, value);
  }

  Future<void> refresh(
    String token,
    refreshToken,
    int expires, {
    String? fbToken,
  }) async {
    _userToken = token;
    _firebaseToken = fbToken;
    _refreshToken = refreshToken;
    _expiresAt = DateTime.now().add(Duration(seconds: expires));
    prefs.remove(SharedPreferencesKeys.TOKEN);
    prefs.remove(SharedPreferencesKeys.RefreshTOKEN);
    prefs.remove(SharedPreferencesKeys.ExpiresAt);
    await prefs.setString(SharedPreferencesKeys.TOKEN, token);
    await prefs.setString(SharedPreferencesKeys.RefreshTOKEN, refreshToken);
    await prefs.setString(
        SharedPreferencesKeys.ExpiresAt, _expiresAt.toString());
    // prefs.remove(SharedPreferencesKeys.USER_INFO);

    notifyListeners();
  }

  /// when [localOnly] is true, only local cash is removed
  Future<void> logOut({bool localOnly = false,}) async {
    _authenticated = false;
    _userToken = null;
    if(!localOnly){
      /// delete fcm token
      FirebaseMessaging.instance.unsubscribeFromTopic(generalFCMTopic);
      FirebaseMessaging.instance.deleteToken();

      sl<AccountRepository>().updateToken(
        UpdateTokenParams(
          body: UpdateTokenParamsBody(
            oldToken: sl<AppStateModel>().firebaseToken,
            isLogingOut: true,
          ),
        ),
      );
    }

    _firebaseToken = null;
    ///

    _refreshToken = null;
    // _expires = null;
    _expiresAt = null;
    await prefs.clear();
    final currentLocale = Lween.locale.locale;
    await prefs.setString(
      SharedPreferencesKeys.LanguageCode,
      currentLocale.languageCode,
    );

    await resetInjection();
    await Lween.storage.init();
    NavigationService.of(Lween.navigatorKey.currentContext!,).restart();
    //
  }

  //
  late SharedPreferences prefs;

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    _userToken = prefs.getString(
      SharedPreferencesKeys.TOKEN,
    );
    AppLogger.log('jwt token :: $_userToken');
    _refreshToken = prefs.getString(
      SharedPreferencesKeys.RefreshTOKEN,
    );
    _expiresAt = DateTime.tryParse(
      prefs.getString(SharedPreferencesKeys.ExpiresAt) ?? '',
    );
    _rememberMe = prefs.getBool(
          SharedPreferencesKeys.IS_STAY_LOGGED,
        ) ??
        true;

    _firebaseToken = prefs.getString(SharedPreferencesKeys.FB_TOKEN,);
    if (_userToken == null) {
      _authenticated = false;
    } else if (isTokenExpired) {
      try {
        final params = RefreshTokenParams(
          body: RefreshTokenParamsBody(
            refreshToken: refreshToken ?? '',
            deviceToken: _firebaseToken ?? '',
          ),
        );
        final response = await AccountBloc.refreshSession(params, params.body);
        if (response.isEmpty) {
          _authenticated = false;
          return;
        } else {
          AppLogger.log(response);
        }
        final token = response['result']['accessToken'];
        final nRefreshToken = response['result']['refreshToken'];
        final int expiresIn = response['result']['expiresIn'];
        refresh(token, nRefreshToken, expiresIn);
        _authenticated = true;
      } on Exception catch (e) {
        AppLogger.log(
          e,
          LoggingType.error,
        );
        _authenticated = false;
      }
    } else {
      _authenticated = true;
    }

    // init device info
    await initDeviceInfo();
    // init file manager
    sl<FileManager>().init();
  }

  Future<void> logIn({
    required String token,
    expires,
    refreshToken,
    // fbToken,
  }) async {
    _userToken = token;
    // _firebaseToken = fbToken;
    _refreshToken = refreshToken;
    _expiresAt = DateTime.now().add(Duration(seconds: expires ?? 86400));
    _authenticated = true;

    // if (fbToken != null) {
    //   await prefs.setString(SharedPreferencesKeys.FB_TOKEN, fbToken);
    // }
    await prefs.setString(SharedPreferencesKeys.TOKEN, token);
    await prefs.setString(SharedPreferencesKeys.RefreshTOKEN, refreshToken);
    await prefs.setString(
        SharedPreferencesKeys.ExpiresAt, _expiresAt.toString());

    notifyListeners();
  }

  static AppStateModel of(BuildContext context) => Provider.of<AppStateModel>(context,listen: false,);

  Future<void> updateFcmToken(String? fcmToken) async {
    if(fcmToken != null) {
      await prefs.setString(SharedPreferencesKeys.FB_TOKEN,fcmToken,);
    }
  }



}
