import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/domain/entities/post.dart';
import 'package:ttm01_flutter_dependency_injection/domain/post_repository.dart';

class DetailPageController extends GetxController {
  final PostRepository repo;
  final post = Rxn<Post>();
  final isLoading = false.obs;

  DetailPageController({required this.repo});

  @override
  void onInit() {
    super.onInit();
    final int id = Get.arguments ?? 1;

    fetchDetailPage(id);
  }

  Future<void> fetchDetailPage(int id) async {
    isLoading.value = true;
    final result = await repo.getdetailPost(id);
    result.fold(
      (error) => Get.snackbar('Error', error),
      (postDetail) => post.value = postDetail,
    );
    isLoading.value = false;
  }
}
