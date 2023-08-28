import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:lween/core/resources/constants.dart';

@immutable
abstract class ParamsModel<T extends BaseBodyModel>
    extends Equatable {
  final T body;

  /// set this to override base url
  final String? baseUrl;

  /// add additional headers to request here
  final Map<String, String> additionalHeaders = {};
  // Map<String, String> get additionalHeaders => _additionalHeaders;

  /// type of request : [RequestType.POST] or [RequestType.GET]
  RequestType? get requestType;

  bool get isFormData => false;

  /// [url] to api endpoint (without base url)
  /// not url is without page number or length
  /// you should fill base_url property in base provider
  String? get url;

  /// query parameters to be included in url
  Map<String, dynamic> get urlParams;

  /// all API requests are authorized
  bool get authorized => true;

  bool get paginated => false;

  final int? page ;
  final int? pageLength;

  ParamsModel({
    required this.body,
    this.baseUrl,
    this.page = 0,
    this.pageLength = 10,
  });

  bool get hasFile {
    final jsonBody = body.toJson();
    for (MapEntry<String, dynamic> v in jsonBody.entries.toList()) {
      if (v.key == ('file')) {
        return true;
      }
    }
    return false;
  }
}

abstract class BaseBodyModel {
  Map<String, dynamic> toJson();
}
