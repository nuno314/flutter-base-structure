enum HttpExceptionEnum {
  fetchData,
  badRequest,
  unauthorized,
  noInternet,
  timeOut,
  invalidInput,
  unknown;
}

class CustomApiException implements Exception {
  final dynamic message;
  final dynamic prefix;
  final HttpExceptionEnum type;

  CustomApiException({
    required this.message,
    required this.prefix,
    required this.type,
  });
}

class FetchDataException extends CustomApiException {
  FetchDataException(String message)
      : super(
          message: message,
          prefix: 'Failed to get data:\n',
          type: HttpExceptionEnum.fetchData,
        );
}

class BadRequestException extends CustomApiException {
  BadRequestException(
    String message,
  ) : super(
          message: message,
          prefix: 'Invalid request:\n',
          type: HttpExceptionEnum.badRequest,
        );
}

class UnauthorizedException extends CustomApiException {
  UnauthorizedException(
    String message,
  ) : super(
          message: message,
          prefix: 'Unauthorized:\n',
          type: HttpExceptionEnum.unauthorized,
        );
}

class TimeOutException extends CustomApiException {
  TimeOutException(
    String message,
  ) : super(
          message: message,
          prefix: 'Time out connection:\n',
          type: HttpExceptionEnum.timeOut,
        );
}

class InvalidInputException extends CustomApiException {
  InvalidInputException(
    String message,
  ) : super(
          message: message,
          prefix: 'Invalid input:\n',
          type: HttpExceptionEnum.invalidInput,
        );
}

class NoInternetException extends CustomApiException {
  NoInternetException(
    String message,
  ) : super(
          message: message,
          prefix: 'No Internet:\n',
          type: HttpExceptionEnum.noInternet,
        );
}
