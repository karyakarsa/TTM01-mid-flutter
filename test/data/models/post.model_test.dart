import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';

void main() {
  group('PostModel', () {
    test('test_post_model_from_json', () {
      final json = {
        'userId': 1,
        'id': 101,
        'title': 'Test Title',
        'body': 'Test Body',
      };

      final postModel = PostModel.fromJson(json);

      expect(postModel.userId, 1);
      expect(postModel.id, 101);
      expect(postModel.title, 'Test Title');
      expect(postModel.body, 'Test Body');
    });

    test('test_post_model_to_json', () {
      final postModel = PostModel(
        userId: 1,
        id: 101,
        title: 'Test Title',
        body: 'Test Body',
      );

      final json = postModel.toJson();

      expect(json['userId'], 1);
      expect(json['id'], 101);
      expect(json['title'], 'Test Title');
      expect(json['body'], 'Test Body');
    });

    test('test_post_model_to_entity', () {
      final postModel = PostModel(
        userId: 1,
        id: 101,
        title: 'Test Title',
        body: 'Test Body',
      );

      final postEntity = postModel.toEntity();

      expect(postEntity.userId, 1);
      expect(postEntity.id, 101);
      expect(postEntity.title, 'Test Title');
      expect(postEntity.body, 'Test Body');
    });
  });
}
