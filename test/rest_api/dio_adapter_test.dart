import 'package:dio/dio.dart';
import 'package:flutter_base_structure/data/data_source/remote/repository/rest_api/rest_api_repository.dart';
import 'package:flutter_base_structure/data/model/response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/http.dart';
import 'package:mockito/annotations.dart';

import 'dio_adapter_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late final MockDio dio;
  late final String baseUrl;
  late final RestApiRepository repository;

  setUp(() {
    baseUrl = 'https://sandbox.api.lettutor.com/';
    dio = MockDio();
    repository = RestApiRepository(dio);
  });

  group('DioAdapter', () {
    test('authEmailLogin', () async {
      when(dio.fetch(RequestOptions(
        path: baseUrl,
        method: 'POST',
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      )));

      final res = await repository.authEmailLogin({});
      expect(res, isA<ResponseData>());
    });
  });
}
