part of 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<ResponseData> authLoginEmail() {
    return Future.value(ResponseData(message: 'awd'));
  }
}
