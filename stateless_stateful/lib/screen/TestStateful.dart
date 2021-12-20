import 'package:flutter/material.dart';

class TestStateful extends StatefulWidget {
  int countValue = 0;
  TestStateful(this.countValue);
  @override
  _TestStatefulState createState() => _TestStatefulState();
}

class _TestStatefulState extends State<TestStateful> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("두번째 숫자 : ${widget.countValue}"),
    );
  }
}
