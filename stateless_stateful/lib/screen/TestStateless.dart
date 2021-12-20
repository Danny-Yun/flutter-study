import 'package:flutter/material.dart';

class TestStateless extends StatelessWidget {
  
  int countValue = 0;
  
  TestStateless(this.countValue);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("숫자 : $countValue"),
      ],
    );
  }
}
