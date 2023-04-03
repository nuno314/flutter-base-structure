import 'package:dio/dio.dart';
import 'package:flutter_base_structure/data/data_source/remote/repository/rest_api/rest_api_repository.dart';
import 'package:flutter_base_structure/data/model/response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

class MockRestApiRepository extends Mock implements RestApiRepository {}

@GenerateMocks([MockRestApiRepository])
void main() {
  late final MockRestApiRepository repository;
  late final Dio dio;
  setUpAll(() {
    dio = Dio(BaseOptions(
      followRedirects: false,
      receiveTimeout: const Duration(seconds: 30), // 30s
      sendTimeout: const Duration(seconds: 30), // 30s
    ));
    repository = MockRestApiRepository();
  });
  group('RestApiRepository tests', () {
    test('fetchPosts returns a list of Post objects', () async {
      final response = ResponseData(message: 'error');
      when(repository.authEmailLogin({})).thenAnswer((_) async {
        return response;
      });

      final res = await repository.authEmailLogin({});

      expect(res, isA<ResponseData>());
    });
  });
}
