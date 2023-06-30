// ignore_for_file: constant_identifier_names

import 'env_config.dart';

class Environment {
  factory Environment() => _singleton;
  Environment._internal();

  late BaseConfig config;

  bool get devOrTest => config is DevConfig || config is TestConfig;

  static final Environment _singleton = Environment._internal();

  static const String DEV = 'DEV';
  static const String TEST = 'TEST';
  static const String CERT = 'CERT';
  static const String DEMO = 'DEMO';

  /// change this to (DEV, TEST, CERT, DEMO) to
  /// set the current environment when you build or run
  static const currentConfig = DEV;

  String pipelineConfig = '#{DEPLOY_ENV}#';

  void initConfig() {
    if (pipelineConfig.startsWith('#')) {
      config = _getConfig(currentConfig);
    } else {
      config = _getConfig(pipelineConfig);
    }
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.DEV:
        return DevConfig();
      case Environment.TEST:
        return TestConfig();
      case Environment.CERT:
        return CertConfig();
      case Environment.DEMO:
        return DemoConfig();
      default:
        return DevConfig();
    }
  }
}
