import 'package:apply_get_x/route/RoutePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultScreen extends StatefulWidget {
  @override
  _DefaultScreenState createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  // late - 나중에 초기화하겠다는 의미
  int age = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('나이: $age'),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              child: Text("Page move to A"),
              onPressed: () async {
                print('페이지 이동 - A');
                // RoutePage.movePage(RoutePage.PAGE_A);
                // Get.toNamed(RoutePage.PAGE_A);

                // 다트에서는 map의 타입을 따로 지정하지 않아도 됨
                Map argument = {"age": age};

                // dynamic result =
                //     Get.toNamed(RoutePage.PAGE_A, arguments: argument);
                dynamic result = await RoutePage.movePageWithArgummentResult(
                    RoutePage.PAGE_A, argument);
                setState(() {
                  this.age = int.parse(result.toString());
                });
                print('result: $result');
              },
            ),
            ElevatedButton(
              onPressed: () {
                RoutePage.movePage(RoutePage.LIST_VIEW_SCREEN);
              },
              child: Text('List View Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
