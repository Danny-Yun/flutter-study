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
  String updateUrl = "https://poodone.com/update.json";
  static const HOLIDAY =
      "https://poodone.com/api/pood/main/holiyday-list"; //공휴일 데이터 호출
  static const POOD_POLICY =
      "https://poodone.com/api/pood/main/pood-policy"; //기타 메타데이터 호출

  String isUpdate = '';
  String androidAppVersion = '';
  String iosAppVersion = '';
  bool loading = false;
  RxBool rxLoading = false.obs;
  Map<String, dynamic> metaData = {};

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
            SizedBox(height: 10),
            Text("policy: $metaData"),
            // loading이 트루일때만 로딩중 띄우기
            // if (loading) CircularProgressIndicator(),

            // setState를 사용하는 다른 방식 - build 다시 그리지않고 Obx에 해당하는 부분만 재실행할 수 있다.
            Obx(() {
              if (rxLoading.value) {
                return CircularProgressIndicator();
              } else {
                if (isUpdate == '') {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        '데이터를 호출해보세요',
                        style: TextStyle(color: Colors.pink),
                      )
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        '로딩 완료',
                        style: TextStyle(color: Colors.green),
                      )
                    ],
                  );
                }
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
        await getHolidayData();
        await getMetaData();
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
    await Future.delayed(Duration(seconds: 1));
    var response = await http.get(Uri.parse(updateUrl));
    print(response.body);

    var data = json.decode(response.body);
    print(json.decode(response.body));

    print(data["androidAppVersion"]);

    setState(() {
      isUpdate = data["isUpdate"].toString();
      androidAppVersion = data["androidAppVersion"];
      iosAppVersion = data["iosAppVersion"];
      // loading = false;
    });
    // setState 없이 사용가능
    rxLoading.value = false;
  }

  Future getHolidayData() async {
    var response = await http.get(Uri.parse(HOLIDAY));
    dynamic data =
        // json.decode로 따옴표 제거, json 형태를 제거
        json.decode(response.body);
    // 자주 쓰임
    List<String> holidayData = data.map<String>((e) => (e as String)).toList();
    print(data);
    print(holidayData);
  }

  Future getMetaData() async {
    rxLoading.value = true;
    await Future.delayed(Duration(seconds: 1));

    var response = await http.get(Uri.parse(POOD_POLICY));
    dynamic data = json.decode(response.body);
    print(data);

    setState(() {
      metaData = data;
    });
    print(metaData);

    rxLoading.value = false;
  }
}
