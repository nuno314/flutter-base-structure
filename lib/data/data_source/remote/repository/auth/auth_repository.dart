import 'dart:io';

import 'package:flutter_base_structure/common/util/http_exception.dart';
import 'package:flutter_base_structure/data/data_source/remote/repository/base/base_repository.dart';
import 'package:flutter_base_structure/data/model/user.dart';
import 'package:http/http.dart' as http;

part 'auth_repository.impl.dart';

abstract class AuthRepository extends BaseRepositoryImpl {
  Future<User> authLoginEmail();
}
