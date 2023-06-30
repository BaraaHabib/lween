// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/services/files/file_manager.dart';
import 'package:lween/core/storage/shared_preferences/shared_preferences_items.dart';
import 'package:lween/features/auth/bloc/account_bloc.dart';
import 'package:lween/features/auth/params/refresh_token_params.dart';
import 'package:lween/main.dart';
import '../../../injection_container.dart';
part 'app_components.dart';


class AppStateModel extends ChangeNotifier with AppComponents {
  bool _authenticated = false;
  bool _rememberMe = false;
  String? _userToken;
  String? _firebaseToken;
  String? _idToken;
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

  String? get idToken => _idToken;

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

  Future<void> logOut() async {
    _authenticated = false;
    _userToken = null;
    _firebaseToken = null;
    _idToken = null;
    _refreshToken = null;
    // _expires = null;
    _expiresAt = null;
    await prefs.clear();
    final currentLocale = Lween.locale.locale;
    await prefs.setString(
      SharedPreferencesKeys.LanguageCode,
      currentLocale.languageCode,
    );

    // reset all registered instances
    // await lween.storage.reset();
    await resetInjection();
    await Lween.storage.init();
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

    // _firebaseToken = await sl<FirebaseService>().initAndGetToken();
    if (_firebaseToken != null) {
      AppLogger.log(_firebaseToken);
      await prefs.setString(
        SharedPreferencesKeys.FB_TOKEN,
        _firebaseToken!,
      );
    }

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
    fbToken,
  }) async {
    _userToken = token;
    _firebaseToken = fbToken;
    _refreshToken = refreshToken;
    _expiresAt = DateTime.now().add(Duration(seconds: expires ?? 86400));
    _authenticated = true;

    if (fbToken != null) {
      await prefs.setString(SharedPreferencesKeys.FB_TOKEN, fbToken);
    }
    await prefs.setString(SharedPreferencesKeys.TOKEN, token);
    await prefs.setString(SharedPreferencesKeys.RefreshTOKEN, refreshToken);
    await prefs.setString(
        SharedPreferencesKeys.ExpiresAt, _expiresAt.toString());

    notifyListeners();
  }

  //#region timezone
  String get timeZone => ''; // TODO set time zone
//#endregion

//#region device info

  static AndroidDeviceInfo? _androidInfo;

  static AndroidDeviceInfo get androidInfo {
    if (_androidInfo == null) {
      throw Exception("can't request ios device info from android device");
    } else {
      return _androidInfo!;
    }
  }

  static IosDeviceInfo? _iosInfo;

  static IosDeviceInfo get iosInfo {
    if (_iosInfo == null) {
      throw Exception("can't request android device info from ios device");
    } else {
      return _iosInfo!;
    }
  }

  static Future initDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      _androidInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      _iosInfo = await deviceInfo.iosInfo;
    }
    // final webBrowserInfo = await deviceInfo.webBrowserInfo;
  }

  String? get deviceId {
    if (Platform.isAndroid) {
      return _androidInfo?.id;
    } else if (Platform.isIOS) {
      return _iosInfo?.identifierForVendor;
    }
    return null;
  }
//#endregion
}
