import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/data/post.remote.dart';
import 'package:ttm01_flutter_dependency_injection/data/post_repository.impl.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<PostRemoteDataSource>(PostRemoteDataSourceImpl());
    Get.put<PostRepository>(
        PostRepositoryImpl(remote: Get.find<PostRemoteDataSource>()));
  }
}
