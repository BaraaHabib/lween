// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/features/account/models/profile_entity.dart';


part 'boxes.dart';

class AppStorage with HiveBoxes {
  //#region profile

  //#endregion

  ProfileEntity? profile;


  Future<void> init() async {
    try {
      try {
        await Hive.initFlutter();
        registerAdapters();
        await openBoxes();
      } on Exception catch (e) {
        AppLogger.log(
          e,
          LoggingType.error,
        );
      }
    } on Exception catch (e) {
      AppLogger.log(
        e,
        LoggingType.error,
      );
    }
  }

  registerAdapters() {
    // if (!Hive.isAdapterRegistered(
    //   ProfileEntityAdapter().typeId,
    // )) {
    //   Hive.registerAdapter(
    //     ProfileEntityAdapter(),
    //     override: true,
    //   );
    // }
  }

  Future openBoxes() async {
    // _profileBox = await Hive.openBox<ProfileEntity>(HiveBoxes.profile);
  }

  Future clearAll() async {
    // await clearProfile();
  }

  Future reset() async {
    await clearAll();
  }

}
