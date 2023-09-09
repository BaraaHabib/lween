

import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/injection_container.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionService {

  static Future<bool> get checkPhotosPermission async {
    final androidInfo = sl<AppStateModel>().androidInfo;
    var isGranted = false;
    if (androidInfo.version.sdkInt >= 33) {
      isGranted = (await Permission.photos.status).isGranted;
      if (!isGranted) {
        isGranted = (await Permission.photos.request()).isGranted;
      }
    } else {
      isGranted = (await Permission.storage.status).isGranted;
      if (!isGranted) {
        isGranted = (await Permission.storage.request()).isGranted;
      }
    }
    return isGranted;
  }

  static Future<bool> get checkNotificationPermission async {
    bool isGranted = await Permission.notification.isGranted;
    if(!isGranted) {
      await Permission.notification.request();
    }
    return isGranted;
  }
}