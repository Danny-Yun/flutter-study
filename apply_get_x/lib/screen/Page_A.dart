import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page_A extends StatefulWidget {
  @override
  _Page_AState createState() => _Page_AState();
}

class _Page_AState extends State<Page_A> {
  int age = 0;

  // 플러터 생명주기
  // initState - 최초 한번 호출
  @override
  void initState() {
    // print("ffff ${Get.arguments}");
    age = Get.arguments["age"];
    super.initState();
  }

  // build - 보통 setState 호출될때마다 진입
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("페이지A"),
              SizedBox(
                height: 30,
              ),
              Text("나이: $age"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    age++;
                  });
                },
                child: Text("나이 증가"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // dispose - 마지막에 없어질 때 한번 호출
  @override
  void dispose() {
    super.dispose();
  }
}
