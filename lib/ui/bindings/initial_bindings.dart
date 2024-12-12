import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/home_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<PostRemoteDataSource>(PostRemoteDataSourceImpl());
    Get.put<PostRepository>(
        PostRepositoryImpl(remote: Get.find<PostRemoteDataSource>()));
    Get.lazyPut(
      () => DetailPageController(
        repo: Get.find<PostRepository>(),
      ),
    );
  
  }
}
