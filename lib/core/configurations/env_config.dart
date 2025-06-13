abstract class BaseConfig {
  BaseConfig({required this.index});

  String get baseUrl;
  String get googleApiKey;

  final int index;
}

class DevConfig extends BaseConfig {

  @override
  String get baseUrl => 'API_URL';

  @override
  String get googleApiKey => '';

  DevConfig() : super(index: 1);
}

class TestConfig extends BaseConfig {
  @override
  String get baseUrl => '';

  @override
  String get googleApiKey => '';


  TestConfig() : super(index: 2);

}

class CertConfig extends BaseConfig {
  @override
  String get baseUrl => '';

  @override
  String get googleApiKey => '';

  CertConfig() : super(index: 3);
}

class DemoConfig extends BaseConfig {
  @override
  String get baseUrl => '';

  @override
  String get googleApiKey => '';

  DemoConfig() : super(index: 4);

}
