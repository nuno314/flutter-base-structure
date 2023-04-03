import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../common/client_info.dart';
import '../../../common/config.dart';
import '../../../common/constant/http_constant.dart';
import 'interceptor/error_interceptor.dart';
import 'repository/rest_api/rest_api_repository.dart';

part 'api_service_error.dart';

@Injectable()
class AppApiService {
  late Dio dio;
  late RestApiRepository client;
  ApiServiceDelegate? apiServiceDelegate;

  AppApiService() {
    _config();
  }

  void _config() {
    _setupDioClient();

    _createRestClient();
  }

  Map<String, String> _getDefaultHeader() {
    final defaultHeader = <String, String>{
      HttpConstants.contentType: 'application/json',
      HttpConstants.language: ClientInfo.languageCode,
      HttpConstants.platform: Config.instance.appConfig.app,
      HttpConstants.device: Platform.operatingSystem,
      HttpConstants.model: ClientInfo.model,
      HttpConstants.appVersion: ClientInfo.appVersionName,
      HttpConstants.appVersionFull: ClientInfo.appVersion,
      HttpConstants.osversion: ClientInfo.osversion,
    };

    if (!kIsWeb) {
      defaultHeader[HttpConstants.osplatform] = Platform.operatingSystem;
    }
    return defaultHeader;
  }

  void _setupDioClient() {
    dio = Dio(
      BaseOptions(
        followRedirects: false,
        receiveTimeout: const Duration(seconds: 30000),
        sendTimeout: const Duration(seconds: 30000),
      ),
    );

    dio.options.headers.clear();

    dio.options.headers = _getDefaultHeader();

    dio.interceptors.add(
      ErrorInterceptor(
        onRequestError: (error) => apiServiceDelegate?.onError(
          ErrorData.fromDio(error),
        ),
      ),
    );
  }

  void _createRestClient() {
    client = RestApiRepository(
      dio,
      baseUrl: Config.instance.appConfig.baseApiLayer,
    );
  }
}

mixin ApiServiceDelegate {
  void onError(ErrorData onError);
}
