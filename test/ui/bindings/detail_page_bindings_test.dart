import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/detail_page_bindings.dart';

import 'detail_page_bindings_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PostRepository>()])
void main() {
  test('DetailPageBindings sets up dependencies correctly', () {
    final mockPostRepository = MockPostRepository();

    
    when(mockPostRepository.getdetailPost(1)).thenAnswer((_) async =>
        Future.value(
            const Right(Post(id: 1, title: "title", body: "body", userId: 1))));

    Get.put<PostRepository>(mockPostRepository);

    DetailPageBindings().dependencies();

    final controller = Get.find<DetailPageController>();
    expect(controller, isA<DetailPageController>());
    expect(controller.repo, equals(mockPostRepository));
  });
}
