part of 'appstate.dart';

mixin _DeviceInfoMixin {

  //#region device info
  AndroidDeviceInfo? _androidInfo;

  AndroidDeviceInfo get androidInfo {
    if (_androidInfo == null) {
      throw Exception("can't request ios device info from android device");
    } else {
      return _androidInfo!;
    }
  }

  IosDeviceInfo? _iosInfo;

  IosDeviceInfo get iosInfo {
    if (_iosInfo == null) {
      throw Exception("can't request android device info from ios device");
    } else {
      return _iosInfo!;
    }
  }

  Future initDeviceInfo() async {
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
      return androidInfo.id;
    } else if (Platform.isIOS) {
      return iosInfo.identifierForVendor;
    }
    return null;
  }
//#endregion

}
