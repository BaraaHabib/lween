abstract class BaseConfig {
  BaseConfig({required this.index});

  String get baseUrl;
  String get yoloBaseUrl;
  String get baseIdentityUrl;
  String get googleApiKey;
  double get maxProfileSizeMB;

  final int index;
}

class DevConfig extends BaseConfig {

  @override
  String get baseUrl => 'https://dev-yolo-app.azurewebsites.net/api/';

  @override
  String get baseIdentityUrl => 'https://dev-yolo-app.azurewebsites.net/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';

  @override
  String get yoloBaseUrl => 'https://dev-yolo-api.azurewebsites.net/api/';

  @override
  double get maxProfileSizeMB => 5;

  DevConfig() : super(index: 1);
}

class TestConfig extends BaseConfig {
  @override
  String get baseUrl => 'https://test-yolo-api.azurewebsites.net/api/';

  @override
  String get baseIdentityUrl =>
      'https://test-yolo-identity.azurewebsites.net/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';

  @override
  String get yoloBaseUrl => 'https://dev-yolo-api.azurewebsites.net/api/';
  @override
  double get maxProfileSizeMB => 5;


  TestConfig() : super(index: 2);

}

class CertConfig extends BaseConfig {
  @override
  String get baseUrl => 'https://cert-yolo-api.azurewebsites.net/api/';

  @override
  String get baseIdentityUrl =>
      'https://cert-yolo-identity.azurewebsites.net/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';

  @override
  String get yoloBaseUrl => 'https://dev-yolo-api.azurewebsites.net/api/';

  @override
  double get maxProfileSizeMB => 5;

  CertConfig() : super(index: 3);
}

class DemoConfig extends BaseConfig {
  @override
  String get baseUrl => 'https://demo-yolo-api.azurewebsites.net/api/';

  @override
  String get baseIdentityUrl =>
      'https://demo-yolo-identity.azurewebsites.net/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';

  @override
  String get yoloBaseUrl => 'https://dev-yolo-api.azurewebsites.net/api/';

  @override
  double get maxProfileSizeMB => 5;

  DemoConfig() : super(index: 4);

}
