import 'package:flutter_base_structure/data/data_source/remote/repository/rest_api/rest_api_repository.dart';
import 'package:flutter_base_structure/data/model/response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'rest_api_repository_test.mocks.dart';

@GenerateMocks([RestApiRepository])
void main() {
  late final MockRestApiRepository repository;
  setUpAll(() {
    repository = MockRestApiRepository();
  });
  group('RestApiRepository tests', () {
    test('authEmailLogin', () async {
      final response = ResponseData(message: 'error');
      when(repository.authEmailLogin({})).thenAnswer((_) async {
        return response;
      });

      final res = await repository.authEmailLogin({});
      expect(res, isA<ResponseData>());
    });

    test('throws an exception if the API call fails', () async {
      when(repository.authEmailLogin({})).thenThrow((_) async {
        return ResponseData(message: 'Not Found');
      });

      expect(() => repository.authEmailLogin({}), throwsException);
    });
  });
}
