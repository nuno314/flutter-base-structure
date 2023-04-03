import 'package:flutter/foundation.dart';

class Env {
  static const appName = 'appname';
  static const baseApiLayer = 'baseApiLayer';
  static const developmentMode = 'developmentMode';

  static const devEnvName = 'Development';

  static final Map<String, dynamic> dev = {
    developmentMode: kDebugMode,
    appName: 'FBS',
    baseApiLayer: 'https://sandbox.api.lettutor.com/',
  };
}
