import 'package:flutter/material.dart';
import 'package:ttm01_flutter_dependency_injection/ui/app.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

void main() {
  FlavorConfig(
      name: "production",
      variables: {
        "name": "production",
        "version": "1.0.0",
      },
      location: BannerLocation.topStart);
  runApp(const MyApp());
}
