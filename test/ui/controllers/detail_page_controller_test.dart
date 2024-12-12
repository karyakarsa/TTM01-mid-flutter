import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';

import 'home_controller_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PostRepository>()])
void main() {
  late DetailPageController controller;
  late MockPostRepository mockRepo;

  setUp(() {
    mockRepo = MockPostRepository();
    when(mockRepo.getdetailPost(1)).thenAnswer((_) async => Future.value(
        const Right(Post(id: 1, title: "title", body: "body", userId: 1))));
    when(mockRepo.getAll()).thenAnswer((_) async => const Right(<Post>[]));
    controller = DetailPageController(repo: mockRepo);
    Get.put(controller);
  });

  tearDown(() {
    Get.reset();
  });

  test('test_loading_state_changes', () async {
    when(mockRepo.getAll()).thenAnswer((_) async => const Right(<Post>[]));

    expect(controller.isLoading.value, false);
    await controller.fetchDetailPage(1);
    expect(controller.isLoading.value, false);
  });

  test('test_auto_fetch_on_init', () async {
    when(mockRepo.getAll()).thenAnswer((_) async => Right(<Post>[]));
    await Future.microtask(controller.onInit);
  });

  test('test_fetch_success', () async {
    final posts = Post(id: 1, title: 'Test Post', body: 'Test Body', userId: 1);

    await controller.fetchDetailPage(1);

    expect(controller.post.value, equals(posts));
  });
}
