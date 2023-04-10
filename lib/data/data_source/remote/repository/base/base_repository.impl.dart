part of 'base_repository.dart';

class BaseRepositoryImpl extends BaseRepository {
  final String _baseUrl = 'https://sandbox.api.lettutor.com/';

  @override
  dynamic get(Response response) {
    final message = response.body;
    switch (response.statusCode) {
      case 200:
        return json.decode(message);
      case 400:
        throw BadRequestException(message);
      case 401:
      case 403:
        throw UnauthorizedException(message);
      case 500:
      default:
        throw FetchDataException(response.statusCode.toString());
    }
  }

  @override
  String get baseUrl => _baseUrl;
}
