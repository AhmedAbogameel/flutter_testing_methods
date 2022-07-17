import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_methods/core/data_source.dart';
import 'package:mocktail/mocktail.dart';

class MockedDio extends Mock implements Dio {}

main() {
  group('Datasource Test', () {

    test('Validate Null Inputs', () async {
      final response = await DataSource.login(null, null);
      expect(response['success'], false);
    });

    test('Wrong credentials', () async {
      final response = await DataSource.login('jemi@dev.com', '123');
      expect(response['success'], false);
    });

    test('Right credentials', () async {
      final response = await DataSource.login('jemi@dev.com', '123123');
      expect(response['success'], true);
      expect(response['token'] != null, true);
    });

  });

  group('Dio Testing', () {
    MockedDio dio = MockedDio();
    final baseURL = 'https://www.localhost:8888/';

    test('should get error 404 when url does not exists', () async {
      // Stub
      when(() => dio.get(baseURL + 'settings')).thenAnswer((_) async => Response(
        statusCode: 404,
        data: {},
        requestOptions: RequestOptions(path: baseURL + 'settings'),
      ));

      final response = await dio.get(baseURL + 'settings');
      expect(response.statusCode, 404);
    });

    test('should get data 200 when url is valid', () async {
      // Stub
      when(() => dio.get(baseURL + 'profile')).thenAnswer((_) async => Response(
        statusCode: 200,
        data: {
          'success': true,
          'name': "Jemi"
        },
        requestOptions: RequestOptions(path: baseURL + 'profile'),
      ));

      final response = await dio.get(baseURL + 'profile');
      expect(response.statusCode, 200);
      expect(response.data['name'], 'Jemi');
    });
  });
}