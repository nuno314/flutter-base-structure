part of 'auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<User> authLoginEmail() async {
    User user;
    var url = Uri.parse('$baseUrl/users');

    try {
      var response = await http.post(url);
      var responseJson = get(response);
      user = User.fromJson(responseJson);
    } on SocketException {
      throw NoInternetException('No internet connection');
    }
    return user;
  }
}
