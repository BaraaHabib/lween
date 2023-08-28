part of 'appstate.dart';

mixin _DeviceInfoMixin {

  PackageInfo? _packageInfo;
  String get deviceVersion{
    return _packageInfo!.version;
  }

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
    _packageInfo = await PackageInfo.fromPlatform();
  }

  int get deviceType {
    if(Platform.isAndroid){
      return 1;
    }
    if(Platform.isIOS){
      return 2;
    }
    return 1;
  }
  String? get deviceId {
    if (Platform.isAndroid) {
      return '${androidInfo.model}/${androidInfo.id}';
    } else if (Platform.isIOS) {
      return '${iosInfo.utsname.machine}/${iosInfo.identifierForVendor}';
    }
    return null;
  }
//#endregion

}
