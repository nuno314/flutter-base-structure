import 'package:dio/dio.dart';
import 'package:flutter_base_structure/data/data_source/remote/repository/rest_api/rest_api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'client_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group('APIRepository', () {
    late final MockDio dio;
    late final RestApiRepository repository;
    late final String baseUrl;
    setUp(() {
      baseUrl = 'https://sandbox.api.lettutor.com/';
      dio = MockDio();
      repository = RestApiRepository(dio, baseUrl: baseUrl);
    });

    test('throws an exception if the API call fails', () {
      when(dio.get(baseUrl)).thenAnswer(
        (_) async => Future.value(
          Response(
            statusCode: 404,
            requestOptions: RequestOptions(path: baseUrl),
          ),
        ),
      );

      expect(() => repository.authEmailLogin({}), throwsException);
    });
  });
}
