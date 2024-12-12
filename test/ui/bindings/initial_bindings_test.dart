import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/initial_bindings.dart';

void main() {
  setUp(() {
    Get.reset();
  });

  test('InitialBindings sets up dependencies correctly', () {
    InitialBindings().dependencies();

    final remoteDataSource = Get.find<PostRemoteDataSource>();
    expect(remoteDataSource, isA<PostRemoteDataSourceImpl>());

    final repository = Get.find<PostRepository>();
    expect(repository, isA<PostRepositoryImpl>());

    final controller = Get.find<DetailPageController>();
    expect(controller, isA<DetailPageController>());
    expect(controller.repo, equals(repository));
  });
}
