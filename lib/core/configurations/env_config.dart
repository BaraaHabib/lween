abstract class BaseConfig {
  BaseConfig({required this.index});

  String get baseUrl;
  String get googleApiKey;

  final int index;
}

class DevConfig extends BaseConfig {

  @override
  String get baseUrl => 'https://api.zanqa.app/lween/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';

  DevConfig() : super(index: 1);
}

class TestConfig extends BaseConfig {
  @override
  String get baseUrl => 'https://test-yolo-api.azurewebsites.net/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';


  TestConfig() : super(index: 2);

}

class CertConfig extends BaseConfig {
  @override
  String get baseUrl => 'https://cert-yolo-api.azurewebsites.net/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';

  CertConfig() : super(index: 3);
}

class DemoConfig extends BaseConfig {
  @override
  String get baseUrl => 'https://demo-yolo-api.azurewebsites.net/api/';

  @override
  String get googleApiKey => 'AIzaSyBz4HDgENtCtYB0lz7j3u1-1v7Rj497U9c';

  DemoConfig() : super(index: 4);

}
