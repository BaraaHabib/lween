import 'dart:async';
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:lween/core/data/data_sources/remote_data_source.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/entities/error_entity.dart';
import 'package:lween/core/services/files/upload_file/params.dart';
import 'package:lween/core/services/files/upload_file/response.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/extended/get_utils/src/extensions/export.dart';
import 'package:lween/core/messages/toast.dart';
import '../../../injection_container.dart';

enum UploadFileType {
  profile(apiValue: 3,);

  final int apiValue;

  const UploadFileType({required this.apiValue});

}

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class FileManager {
  late String _localPath;
  final dio = Dio();
  static bool isInitialized = false;

  FileManager();

  Future<void> init() async {
    if (isInitialized) {
      return;
    }
    _appTempDirectory = await getTemporaryDirectory();
    // await FlutterDownloader.registerCallback(downloadCallback);
    await _prepareSaveDir();
    isInitialized = false;
  }

  Directory? _appExternalDirectory;
  Directory? _appTempDirectory;

  Future<Directory?> get appTempDirectory async {
    if (_appTempDirectory == null) {
      try {
        _appTempDirectory = await getTemporaryDirectory();
      } on Exception {
        rethrow;
      }
    }
    return Future.value(_appTempDirectory);
  }

  Future<Directory> get appExternalDirectory async {
    if (_appExternalDirectory == null) {
      try {
        final folder = await createFolder(AppConfigurations.ApplicationName);
        _appExternalDirectory = folder;
      } on Exception {
        rethrow;
      }
    }
    return Future.value(_appTempDirectory);
  }

  Future<Directory> createFolder(String name) async {
    final dir = Directory(
      '${(Platform.isAndroid ? await getExternalStorageDirectory() //FOR ANDROID
          : await getApplicationSupportDirectory() //FOR IOS
      )!.path}/$name',
    );

    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if (await dir.exists()) {} else {
      dir.create();
    }
    return dir;
  }

  bool existsSync(String url) {
    if (url.isURL) {
      return false;
    }
    return File(url).existsSync();
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;
    final savedDir = Directory(_localPath);
    final hasExisted = savedDir.existsSync();
    if (!hasExisted) {
      await savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    String? externalStorageDirPath;
    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } on Exception {
        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  Future<String?> downloadIOS({
    required String url,
    required String fileName,
    bool? withAuth,
  }) async {
    // requests permission for downloading the file
    final hasPermission = await _requestWritePermission();
    if (!hasPermission) return null;

    // gets the directory where we will download the file.
    final dir = await getApplicationDocumentsDirectory();

    // get ext
    final ext = url
        .split('.')
        .lastOrNull;
    final fullName = '$fileName${ext == null ? '' : '.$ext'}';

    // downloads the file
    final options = Options()
      ..headers?.addAll(
          {'Authorization': 'Bearer ${sl<AppStateModel>().userToken}'});
    await dio.download(
      url,
      '${dir.path}/$fullName',
      options: withAuth ?? false ? options : null,
    );
    Share.shareXFiles(
      [XFile('${dir.path}/$fullName')],
    );
    return '${dir.path}/$fullName';
  }

  // requests storage permission
  Future<bool> _requestWritePermission() async {
    final res = await Permission.storage.request();
    return res.isGranted;
  }


  Future<Either<ErrorEntity, FileUploadEntity>> uploadFile(String filePath, int fileType,) async {
    try {
      var res = await sl<RemoteDataSource>().getRemoteData(UploadFileParams(
        fileType,
        body: UploadFileParamsBody(
          filePath: filePath,
        ),
      ),);
      Entity<FileUploadEntity> data = Entity<FileUploadEntity>.fromJson(
        res, parser: FileUploadEntity.fromJson,);
      return Right(data.content!);
    } on AppException catch (e) {
      return Left(ErrorEntity.fromAppException(e));
    }
  }
}
