import '../envs.dart';

class Config {
  static final Config instance = Config._();

  Config._();

  AppConfig get appConfig => _appConfig;
  late AppConfig _appConfig;

  void setup(Map<String, dynamic> env) {
    _appConfig = AppConfig.from(env);
  }
}

class AppConfig {
  String appName;
  String baseApiLayer;
  String app;

  AppConfig(
    this.appName,
    this.baseApiLayer,
    this.app,
  );

  AppConfig.from(Map<String, dynamic> env)
      : appName = env[Env.appName],
        baseApiLayer = env[Env.baseApiLayer],
        app = 'platform';
}
