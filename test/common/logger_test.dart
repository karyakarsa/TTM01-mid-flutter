import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:logger/logger.dart';
import 'package:ttm01_flutter_dependency_injection/common/logger.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  late MockLogger mockLogger;

  setUp(() {
    mockLogger = MockLogger();
    logger = mockLogger;
  });

  test('log_messages', () {
    logger.i('Info message');
    verify(mockLogger.i('Info message')).called(1);

    logger.w('Warning message');
    verify(mockLogger.w('Warning message')).called(1);
  });

  tearDown(() {
    logger = Logger();
  });
}
