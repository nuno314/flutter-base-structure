part of 'api_service.dart';

enum ErrorType {
  noInternet,
  httpException,
  timeout,

  /// occurred when refresh token with invalid token or user not found `or`
  /// status code is 401
  unauthorized,
  unknown,
}

class ErrorData {
  ErrorType? type;
  String? message;
  int? statusCode;
  String? errorCode;

  ErrorData({
    this.type,
    this.statusCode,
    this.message,
  });

  ErrorData.fromDio(DioError error) {
    type = ErrorType.unknown;
    message = error.message;

    switch (error.type) {
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.connectionTimeout:
      case DioErrorType.connectionError:
        type = ErrorType.timeout;
        break;
      case DioErrorType.badResponse:
        statusCode = error.response?.statusCode;
        final errorCode = error.response?.data is Map<dynamic, dynamic>
            ? error.response?.data['code']?.toString()
            : null;
        this.errorCode = errorCode;

        type = ErrorType.httpException;
        if (error.response?.data is Map<dynamic, dynamic>) {
          message = getErrorMessage(error.response?.data);
        }
        break;
      case DioErrorType.cancel:
      case DioErrorType.badCertificate:
      case DioErrorType.unknown:
        type = ErrorType.unknown;
        break;
    }
  }

  String getErrorMessage(Map<String, dynamic> dataRes) {
    try {
      if (dataRes.containsKey('message') && dataRes['message'] != null) {
        return dataRes['message'].toString();
      }
      if (dataRes.containsKey('error') && dataRes['error'] != null) {
        return dataRes['error'].toString();
      }
      if (dataRes.containsKey('errors') && dataRes['errors'] != null) {
        return dataRes['errors'].toString();
      }
    } catch (e) {
      /* ignore */
    }
    return dataRes.toString();
  }
}
