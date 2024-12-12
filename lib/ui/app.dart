import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/detail_page_bindings.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/home_bindings.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/initial_bindings.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/detail_page.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String env = FlavorConfig.instance.name ?? "production";
    if (env == "staging") {
      return const FlavorBanner(
        location: BannerLocation.topEnd,
        child: MainMaterialApp(),
      );
    }

    // Return the app directly for other environments
    return const MainMaterialApp();
  }
}

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
          bindings: [
            HomeBindings(),
          ],
        ),
        GetPage(
          name: '/detail_page',
          page: () => const DetailPage(),
          bindings: [
            DetailPageBindings(),
          ],
          
        ),
      ],
      initialBinding: InitialBindings(),
    );
  }
}
