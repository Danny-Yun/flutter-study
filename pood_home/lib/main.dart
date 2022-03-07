import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pood_home/binding/PoodHomeControllerBinding.dart';
import 'package:pood_home/controller/PoodHomeController.dart';

import 'PoodHomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      initialBinding: PoodHomeControllerBinding(),
    );
  }
}
