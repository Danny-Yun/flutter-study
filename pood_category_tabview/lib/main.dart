import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pood_category_tabview/binding/CategoryDetailControllerBinding.dart';

import 'screen/CategoryDetailScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoryDetailScreen(),
      initialBinding: CategoryDetailControllerBinding(),
    );
  }
}
