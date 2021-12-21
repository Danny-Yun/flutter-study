import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page_A extends StatefulWidget {
  @override
  _Page_AState createState() => _Page_AState();
}

class _Page_AState extends State<Page_A> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
