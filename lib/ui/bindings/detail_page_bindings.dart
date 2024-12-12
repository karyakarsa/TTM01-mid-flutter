import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';

class DetailPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailPageController(
        repo: Get.find<PostRepository>(),
      ),
    );
  }
}
