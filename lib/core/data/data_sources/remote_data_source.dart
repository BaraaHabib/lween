 import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:lween/core/app_state/appstate.dart';
import 'package:lween/core/configurations/app_configuration.dart';
import 'package:lween/core/exceptions/app_exceptions.dart';
import 'package:lween/core/extended/get_utils/get_utils.dart';
import 'package:lween/core/extended/item_creator.dart';
import 'package:lween/core/extended/map_ext.dart';
import 'package:lween/core/features/entities/entity.dart';
import 'package:lween/core/features/params/params_model.dart';
import 'package:lween/core/locale/locale_provider.dart';
import 'package:lween/core/navigation/logger.dart';
import 'package:lween/core/resources/constants.dart';
import 'package:lween/injection_container.dart';
import 'package:lween/main.dart';

class RemoteDataSource  {
  // Client client = Client();
  final baseUrl = AppConfigurations.env.baseUrl;
  final dio = Dio(BaseOptions(
    connectTimeout:20000.seconds,
  ));
  String? token;
  Map<String, String> headers = {};

  RemoteDataSource() {
    /// add base headers
    headers.putAllIfAbsent(AppConfigurations.BaseHeaders);
  }


  checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      throw NoInternetException();
    }
  }

  authorizeRequest() {
    headers.update(
      "Authorization",
          (V) => "Bearer ${Lween.appState.userToken}",
      ifAbsent: () => "Bearer ${Lween.appState.userToken}",
    );
  }

  unAuthorizeRequest() {
    headers.remove(
      "Authorization",
    );
  }

  preRequest(ParamsModel model) async {
    if (model.authorized) {
      authorizeRequest();
    } else {
      headers.remove('Authorization');  // remove preserved token if present
    }
    headers.putIfAbsent('deviceType', () => sl<AppStateModel>().deviceType.toString());
    headers.putIfAbsent('DeviceId', () => sl<AppStateModel>().deviceId!);
    headers.update(
        'Accept-Language',
        (value) => sl<LocaleProvider>().selectedLanguageHeader,
        ifAbsent:  () => sl<LocaleProvider>().selectedLanguageHeader);
    await checkConnectivity();
  }

   Future<Map<String, dynamic>?> performRequest(ParamsModel model) async {
     await preRequest(model);
     Map<String, dynamic>? response;
     AppLogger.log('api url::: ${model.url}');
     try {
       switch (model.requestType) {
         case RequestType.GET:
           response = await get(model);
           break;
         case RequestType.POST:
           response = await post(model);
           break;
         case RequestType.DELETE:
           response = await delete(model);
           break;
         case RequestType.PUT:
           throw NotImplementedException(message: "Request type: PUT");
         default:
           throw NotImplementedException();
       }
       return (response);
     }
     on DioError catch (e) {
       if(kDebugMode){
        debugPrint('api params::: ${model.body.toJson()}');
      }
      if (e.response == null) {
         AppLogger.log(e,LoggingType.error);
         throw NoInternetException();
       } else {
         AppLogger.log(e.response);
         return _returnResponse(e.response!);
       }
     }
     on Exception catch (e) {
       AppLogger.log(e.toString(),LoggingType.error);
       rethrow;
     }
     finally {}
   }
  // T? performLocalRequest<T>(LocalDataParams model) {
  //   return _localDataSource.getData<T>(model);
  // }

  Future<Map<String,dynamic>> getRemoteData(ParamsModel model,) async {
      var result = await performRequest(model) ?? {};
      return result;
  }

  // Future<Entity<T>> getData<T extends ContentModel>(ParamsModel model,ItemCreator<T>? s) async {
  //   try {
  //     var result = await performRequest(model) ?? {};
  //     Entity<T> data = Entity<T>.fromJson(result,creator:s,);
  //     return data;
  //   }
  //   on NoInternetException catch (e){
  //     return Entity<T>(success: false, message: e.toString(),isApiError: false);
  //   }
  //   on BadRequestException catch ( e) {
  //     return Entity<T>(success: false, message: e.toString(),isApiError: true,status: e.code);
  //   }
  //   on Exception catch ( e) {
  //     return Entity<T>(success: false, message: e.toString(),isApiError: false);
  //   }
  // }


  Future<Map<String, dynamic>?> get(ParamsModel model) async {
    Map<String, dynamic> responseJson;

    final url = model.baseUrl ?? baseUrl;
    var urlParams = model.urlParams;
    if(model.paginated) {
      if (model.pageLength != null) {
        urlParams.putIfAbsent('PageLength', () => model.pageLength.toString(),);
      }
      if (model.page != null) {
        urlParams.putIfAbsent('Page', () => model.page.toString(),);
      }
    }
    final Response response = await dio.get(
        url + model.url.toString(),
        // headers: headers,
        queryParameters: urlParams,
      options: Options(
          headers: headers,
          responseType: ResponseType.plain,
      ),
    );

    responseJson = _returnResponse(response);
    AppLogger.log('get request url:${response.realUri}');
    AppLogger.log('get response: $responseJson');
    return responseJson;
  }

  Future<Map<String, dynamic>?> post(ParamsModel model) async {
    Response response;
    Map<String, dynamic> responseJson;
    final url = model.baseUrl ?? baseUrl;
    response = await dio.post(
      url + model.url.toString(),
      data: model.body.toJson(),
      queryParameters: model.urlParams,
      options: Options(headers: headers, responseType: ResponseType.plain),
    );

    responseJson = _returnResponse(response);

    AppLogger.log('post request url :${url + model.url.toString()}');
    // print text data (with out images)
    var dataToPrint = model.body.toJson()..removeWhere((key, value) => value is List<MultipartFile> || value is MultipartFile);
    AppLogger.log('post request body :${json.encode(dataToPrint)}');
    AppLogger.log('post response: $responseJson');

    return responseJson;
  }

  Future<Map<String, dynamic>?> delete(ParamsModel model) async {
    Response response;
    Map<String, dynamic> responseJson;
    final url = model.baseUrl ?? baseUrl;
    response = await dio.delete(
      url + model.url.toString(),
      data: FormData.fromMap(model.body.toJson(),ListFormat.multiCompatible),
      queryParameters: model.urlParams,
      options: Options(headers: headers, responseType: ResponseType.plain),
    );

    responseJson = _returnResponse(response);

    AppLogger.log('delete request url :${url + model.url.toString()}');
    // print text data (with out images)
    var dataToPrint = model.body.toJson()..removeWhere((key, value) => value is List<MultipartFile>);
    AppLogger.log('delete request body :${json.encode(dataToPrint)}');
    AppLogger.log('delete response: $responseJson');

    return responseJson;
  }

  Map<String, dynamic> _returnResponse(Response response) {
    var responseJson = response.data
        .toString()
        .isEmpty
        ? null
        : json.decode(response.data.toString());
    var statusCode = response.statusCode ?? -1;

    if (statusCode >= 500) {
      throw ServerErrorException(data: responseJson);
    }
    else if (statusCode == 403) {
      String message = 'Bad request';
      if(responseJson['message'] is String){
        message = responseJson['message'];
      }else{
        var messages = responseJson['message'] is List ? responseJson['message']  : [];
        if (messages.length == 1) {
          message = messages[0];
        } else if (messages.length > 1) {
          message = messages.reduce((value, element) => value + ' ' + element);
        }
      }

      throw BadRequestException(
          message: message,
          code: statusCode,
      );
    }
    else if([401,].contains(statusCode) ){
      String message = '';
      if(responseJson['message'] is String){
        message = responseJson['message'];
      }else{
        var messages = responseJson['message'] is List ? responseJson['message']  : [];
        if (messages.length == 1) {
          message = messages[0];
        } else if (messages.length > 1) {
          message = messages.reduce((value, element) => value + ' ' + element);
        }
      }
      sl<AppStateModel>().logOut();
      throw UnauthorisedException(message: message);
    }
    else if (statusCode >= 400) {
      String message = 'BAD_REQUEST';
      if(responseJson == null){
        throw BadRequestException(message: message, code: statusCode);
      }
      if(responseJson['message'] is String){
        message = responseJson['message'];
      }else{
        var messages = responseJson['message'] is List ? responseJson['message']  : [];
        if (messages.length == 1) {
          message = messages[0];
        } else if (messages.length > 1) {
          message = messages.reduce((value, element) => value + ' ' + element);
        }
      }

      throw BadRequestException(message: message, code: statusCode);
    }
    else if (statusCode >= 200) {
      return responseJson;
    }
    else if (statusCode == -1) {
      throw NoInternetException();
    }
    else {
      throw FetchDataException(
          message: AppConfigurations.stagingOrDevelopment
              ? 'Unknown Error'
              : response.data.toString());
    }
  }

}
