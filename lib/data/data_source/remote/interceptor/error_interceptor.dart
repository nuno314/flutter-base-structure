import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  final Function(DioError)? onRequestError;

  ErrorInterceptor({this.onRequestError});

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    onRequestError?.call(err);
    super.onError(err, handler);
  }
}
