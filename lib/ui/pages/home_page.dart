import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/home_controller.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/detail_page.dart';
import 'package:ttm01_flutter_dependency_injection/ui/widgets/post_list_item.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Obx(
          () => ListView.builder(
              itemBuilder: (_, index) => InkWell(
                  onTap: () {
                    Get.to(
                      const DetailPage(),
                      arguments: controller.posts[index].id,
                    );
                  },
                  child: PostListItem(post: controller.posts[index])),
              itemCount: controller.posts.length),
        ));
  }
}
