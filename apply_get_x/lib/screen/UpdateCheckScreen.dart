import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateCheckScreen extends StatefulWidget {
  const UpdateCheckScreen({Key? key}) : super(key: key);

  @override
  _UpdateCheckScreenState createState() => _UpdateCheckScreenState();
}

class _UpdateCheckScreenState extends State<UpdateCheckScreen> {
  String url = "https://poodone.com/update.json";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('업데이트 체크'),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          body(),
        ],
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
    var response = await http.get(Uri.parse(url));
    print(response.body);

    print(json.decode(response.body));
    var data = json.decode(response.body);
    print(data["androidAppVersion"]);
  }
}
