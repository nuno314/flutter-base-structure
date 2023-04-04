import 'package:flutter_base_structure/data/model/response.dart';

part 'auth_repository.impl.dart';

abstract class AuthRepository {
  Future<ResponseData> authLoginEmail();
}