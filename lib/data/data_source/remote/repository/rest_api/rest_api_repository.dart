import 'package:dio/dio.dart';
import 'package:flutter_base_structure/data/model/response.dart';
import 'package:retrofit/retrofit.dart';
import 'api_contract.dart';

part 'rest_api_repository.g.dart';

///////////////////////////////////////////////////////////////////////
//                https://pub.dev/packages/retrofit                 //
// flutter pub run build_runner build --delete-conflicting-outputs //
////////////////////////////////////////////////////////////////////

@RestApi()
abstract class RestApiRepository {
  factory RestApiRepository(Dio dio, {String baseUrl}) = _RestApiRepository;

  @POST(ApiContract.authEmailLogin)
  Future<ResponseData> authEmailLogin(@Body() Map<String, dynamic> body);
}
