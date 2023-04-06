import 'package:dio/dio.dart';
import 'package:flutter_base_structure/data/data_source/remote/repository/rest_api/rest_api_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'dio_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late final MockDio dio;
  late final String baseUrl;
  late final RestApiRepository repository;

  setUp(() {
    baseUrl = 'https://sandbox.api.lettutor.com/';
    dio = MockDio();
    repository = RestApiRepository(dio, baseUrl: baseUrl);
  });

  group('RestApiRepository', () {
    test('authEmailLogin throws DioError', () async {
      when(dio.fetch(any)).thenThrow(DioError(requestOptions: RequestOptions()));
      when(dio.options).thenReturn(BaseOptions(
        baseUrl: baseUrl,
        headers: {'Authorization': 'Bearer mytoken'},
      ));

      try {
        final res = await repository.authEmailLogin({});
        fail('Expected a DioError to be thrown.');
      } catch (error) {
        expect(error, isA<DioError>());
      }
    });
  });
}
