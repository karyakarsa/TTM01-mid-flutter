import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ttm01_flutter_dependency_injection/ui/bindings/initial_bindings.dart';
import 'package:ttm01_flutter_dependency_injection/ui/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        ),
      ],
      initialBinding: InitialBindings(),
    );
  }
}
