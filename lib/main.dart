import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_flutter/main_binding.dart';
import 'package:news_flutter/presentation/feature/home/binding/home_binding.dart';
import 'package:news_flutter/presentation/feature/home/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News',
      initialBinding: MainBinding(),
      getPages: [
        GetPage(
            name: '/home',
            page: () => const HomePage(),
            binding: HomeBinding()),
      ],
      initialRoute: '/home',
    );
  }
}
