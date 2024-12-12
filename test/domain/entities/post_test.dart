import 'package:flutter_test/flutter_test.dart';

import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

void main() {
  group('Post', () {
    test('bodyText removes newlines', () {
      final post = Post(
        userId: 1,
        id: 1,
        title: 'Test Post',
        body: 'Line 1\nLine 2\nLine 3',
      );

      expect(post.bodyText, equals('Line 1 Line 2 Line 3'));
    });

    test('bodyText with null body', () {
      final post = Post(
        userId: 1,
        id: 1,
        title: 'Test Post',
        body: null,
      );

      expect(post.bodyText, isNull);
    });

    test('post equality with same values', () {
      final post1 = Post(
        userId: 1,
        id: 1,
        title: 'Test Post',
        body: 'Test Body',
      );

      final post2 = Post(
        userId: 1,
        id: 1,
        title: 'Test Post',
        body: 'Test Body',
      );

      expect(post1, equals(post2));
    });
  });
}
