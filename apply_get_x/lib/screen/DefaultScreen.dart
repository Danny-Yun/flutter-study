import 'package:apply_get_x/route/RoutePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultScreen extends StatefulWidget {
  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Page move to A"),
          onPressed: () {
            print('페이지 이동 - A');
            Get.toNamed(RoutePage.PAGE_A);
          },
        ),
      ),
    );
  }
}
