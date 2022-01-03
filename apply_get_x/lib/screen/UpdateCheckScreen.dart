import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateCheckScreen extends StatefulWidget {
  const UpdateCheckScreen({Key? key}) : super(key: key);

  @override
  _UpdateCheckScreenState createState() => _UpdateCheckScreenState();
}

class _UpdateCheckScreenState extends State<UpdateCheckScreen> {
  String url = "https://poodone.com/update.json";
  String isUpdate = '';
  String androidAppVersion = '';
  String iosAppVersion = '';
  bool loading = false;
  RxBool rxLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('업데이트 체크'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            body(),
            Text("업데이트: $isUpdate"),
            Text("안드로이드: $androidAppVersion"),
            Text("iOS: $iosAppVersion"),
            // loading이 트루일때만 로딩중 띄우기
            if (loading) CircularProgressIndicator(),

            // setState를 사용하는 다른 방식 - build 다시 그리지않고 Obx에 해당하는 부분만 재실행할 수 있다.
            Obx(() {
              if (rxLoading.value) {
                return CircularProgressIndicator();
              } else {
                return SizedBox();
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return ElevatedButton(
      onPressed: () async {
        await getUpdateData();
      },
      child: Text('데이터 호출'),
    );
  }

  Future getUpdateData() async {
    // 데이터 호출 전에
    rxLoading.value = true;
    // setState(() {
    //   loading = true;
    // });

    // 고정값으로 딜레이시간 지정
    await Future.delayed(Duration(seconds: 2));
    var response = await http.get(Uri.parse(url));
    print(response.body);

    print(json.decode(response.body));
    var data = json.decode(response.body);

    print(data["androidAppVersion"]);

    // setState(() {
    isUpdate = data["isUpdate"].toString();
    androidAppVersion = data["androidAppVersion"];
    iosAppVersion = data["iosAppVersion"];
    loading = false;
    // });
    // setState 없이 사용가능
    rxLoading.value = false;
  }
}
