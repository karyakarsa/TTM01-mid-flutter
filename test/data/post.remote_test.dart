import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/connect.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/common/logger.dart';
import 'package:ttm01_flutter_dependency_injection/data/models/post.model.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';

import '../common/logger_test.dart';
import 'post.remote_test.mocks.dart';

@GenerateMocks([PostRemoteDataSource])
@GenerateMocks([GetConnect])
@GenerateNiceMocks([MockSpec<PostRemoteDataSourceImpl>()])
void main() {
  late PostRemoteDataSourceImpl dataSource;
  late MockLogger mockLogger;
  late MockGetConnect mockGetConnect;
  late MockPostRemoteDataSourceImpl mockDataSource;

  setUp(() {
    mockLogger = MockLogger();
    logger = mockLogger;
    mockGetConnect = MockGetConnect();
    dataSource = PostRemoteDataSourceImpl();
    mockDataSource = MockPostRemoteDataSourceImpl();
  });

  tearDown(() {
    logger = Logger();
  });

  test('fetchAll success', () async {
    final mockResponse = Response(
      statusCode: 200,
      body: [
        {'userId': 1, 'id': 1, 'title': 'Test Title', 'body': 'Test Body'},
        {'userId': 1, 'id': 2, 'title': 'Test Title 2', 'body': 'Test Body 2'},
      ],
    );
    final mockPostData = [
      PostModel(userId: 1, id: 1, title: "title", body: "body")
    ];

    when(mockGetConnect.get('/posts')).thenAnswer((_) async => mockResponse);
    await dataSource.fetchAll();
    when(mockDataSource.fetchAll()).thenAnswer((_) async => mockPostData);
    final posts = await mockDataSource.fetchAll();
    expect(posts.length, 1);
  });

  test('detailPosts success', () async {
    final mockResponse = Response(
      statusCode: 200,
      body: {'userId': 1, 'id': 1, 'title': 'Test Title', 'body': 'Test Body'},
    );
    final mockPostData =
        PostModel(userId: 1, id: 1, title: "title", body: "body");

    when(mockGetConnect.get('/posts/1')).thenAnswer((_) async => mockResponse);
    await dataSource.detailPosts(1);
    when(mockDataSource.detailPosts(1)).thenAnswer((_) async => mockPostData);
    final posts = await mockDataSource.detailPosts(1);
    expect(posts.title, "title");
  });
}
