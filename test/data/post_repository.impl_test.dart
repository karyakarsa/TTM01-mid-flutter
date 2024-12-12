// import 'dart:async';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:dartz/dartz.dart';
// import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';
// import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
// import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
// import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
// import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';

// import 'post_repository.impl_test.mocks.dart';

// @GenerateMocks([PostRemoteDataSource])
// void main() {
//   late PostRepositoryImpl repository;
//   late MockPostRemoteDataSource mockRemote;

//   setUp(() {
//     mockRemote = MockPostRemoteDataSource();

//     repository = PostRepositoryImpl(remote: mockRemote);
//   });

//   test('test_post_repository_initialization', () {
//     expect(repository, isA<PostRepositoryImpl>());
//   });

//   test('test_get_all_posts_success', () async {
//     final remotePosts = [
//       PostModel(id: 1, title: 'Test', body: 'Test body', userId: 1),
//       PostModel(id: 2, title: 'Test 2', body: 'Test body 2', userId: 2)
//     ];

//     when(mockRemote.fetchAll())
//         .thenAnswer((_) async => Future.value(remotePosts));

//     final result = await repository.getAll();

//     expect(result.isRight(), true);
//     result.fold((l) => fail('Should not return left'), (posts) {
//       expect(posts.length, 2);
//       expect(posts[0], isA<Post>());
//       expect(posts[1], isA<Post>());
//     });
//     verify(mockRemote.fetchAll()).called(1);
//   });

//   test('test_get_all_posts_server_exception', () async {
// when(mockRemote.fetchAll()).thenAnswer((_) => Future.error(
//     ServerException('Server error', details: "", statusCode: 500)));

//     final result = await repository.getAll();

//     expect(result.isLeft(), true);
//     result.fold((error) => expect(error, 'Server error'),
//         (r) => fail('Should not return right'));
//     verify(mockRemote.fetchAll()).called(1);
//   });
// }

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/common/exceptions.dart';

import 'post_repository.impl_test.mocks.dart';

@GenerateMocks([PostRemoteDataSource])
void main() {
  late PostRepositoryImpl repository;
  late MockPostRemoteDataSource mockRemote;

  setUp(() {
    mockRemote = MockPostRemoteDataSource();
    repository = PostRepositoryImpl(remote: mockRemote);
  });

  test('test_post_repository_initialization', () {
    expect(repository, isA<PostRepositoryImpl>());
  });

  test('test_get_all_posts_success', () async {
    final remotePosts = [
      PostModel(id: 1, title: 'Test', body: 'Test body', userId: 1),
      PostModel(id: 2, title: 'Test 2', body: 'Test body 2', userId: 2)
    ];

    when(mockRemote.fetchAll())
        .thenAnswer((_) async => Future.value(remotePosts));

    final result = await repository.getAll();

    expect(result.isRight(), true);
    result.fold((l) => fail('Should not return left'), (posts) {
      expect(posts.length, 2);
      expect(posts[0], isA<Post>());
      expect(posts[1], isA<Post>());
    });
    verify(mockRemote.fetchAll()).called(1);
  });

  test('test_get_all_posts_server_exception', () async {
    when(mockRemote.fetchAll()).thenAnswer((_) => Future.error(
        ServerException('Server error', details: "", statusCode: 500)));

    final result = await repository.getAll();

    expect(result.isLeft(), true);
    result.fold((error) => expect(error, 'Server error'),
        (r) => fail('Should not return right'));
    verify(mockRemote.fetchAll()).called(1);
  });

  test('test_get_all_posts_empty', () async {
    when(mockRemote.fetchAll()).thenAnswer((_) async => Future.value([]));

    final result = await repository.getAll();

    expect(result.isRight(), true);
    result.fold((l) => fail('Should not return left'), (posts) {
      expect(posts, isEmpty);
    });
    verify(mockRemote.fetchAll()).called(1);
  });

  test('test_get_all_posts_network_exception', () async {
    when(mockRemote.fetchAll()).thenAnswer((_) => Future.error(
        ServerException('Server error', details: "", statusCode: 500)));

    final result = await repository.getAll();

    expect(result.isLeft(), true);
    result.fold((error) => expect(error, 'Server error'),
        (r) => fail('Should not return right'));
    verify(mockRemote.fetchAll()).called(1);
  });

  test('test_data_conversion', () async {
    final remotePosts = [
      PostModel(id: 1, title: 'Test', body: 'Test body', userId: 1)
    ];

    when(mockRemote.fetchAll())
        .thenAnswer((_) async => Future.value(remotePosts));

    final result = await repository.getAll();

    expect(result.isRight(), true);
    result.fold((l) => fail('Should not return left'), (posts) {
      expect(posts[0].id, remotePosts[0].id);
      expect(posts[0].title, remotePosts[0].title);
      expect(posts[0].body, remotePosts[0].body);
      expect(posts[0].userId, remotePosts[0].userId);
    });
    verify(mockRemote.fetchAll()).called(1);
  });

  test('test_detail_posts_success', () async {
    const remotePosts =
        PostModel(id: 1, title: 'Test', body: 'Test body', userId: 1);

    when(mockRemote.detailPosts(1))
        .thenAnswer((_) async => Future.value(remotePosts));

    final result = await repository.getdetailPost(1);

    expect(result.isRight(), true);
    result.fold((l) => fail('Should not return left'), (posts) {
      expect(posts, isA<Post>());
    });
  });

  test('test_get_detail_posts_server_exception', () async {
    when(mockRemote.detailPosts(1)).thenAnswer((_) => Future.error(
        ServerException('Server error', details: "", statusCode: 500)));

    final result = await repository.getdetailPost(1);

    expect(result.isLeft(), true);
    result.fold((error) => expect(error, 'Server error'),
        (r) => fail('Should not return right'));
  });
}
