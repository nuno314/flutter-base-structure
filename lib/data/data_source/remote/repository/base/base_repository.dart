import 'dart:convert';

import 'package:flutter_base_structure/common/util/http_exception.dart';
import 'package:http/http.dart';

part 'base_repository.impl.dart';

abstract class BaseRepository {
  String get baseUrl;
  dynamic get(Response response);
}
