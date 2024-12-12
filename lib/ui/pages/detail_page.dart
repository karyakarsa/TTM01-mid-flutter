import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/ui/controllers/detail_page_controller.dart';

class DetailPage extends GetView<DetailPageController> {
  const DetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(DetailPageController(repo: Get.find()));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "userId : ${controller.post.value?.userId.toString()} ",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "id : ${controller.post.value?.id} ",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "title : ${controller.post.value?.title} ",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 34),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "body : ${controller.post.value?.body} ",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 34),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
