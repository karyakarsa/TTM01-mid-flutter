import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';

void main() {
  group('ServerException', () {
    test('test_server_exception_initialization', () {
      final exception = ServerException('Error occurred',
          statusCode: 404, details: {'info': 'Not Found'});
      expect(exception.message, 'Error occurred');
      expect(exception.statusCode, 404);
      expect(exception.details, {'info': 'Not Found'});
    });

    test('test_server_exception_default_status_code', () {
      final exception = ServerException('Error occurred');
      expect(exception.statusCode, 500);
    });

    test('test_server_exception_null_details', () {
      final exception = ServerException('Error occurred', details: null);
      expect(exception.details, isNull);
    });
  });
}
