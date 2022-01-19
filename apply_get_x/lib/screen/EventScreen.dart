import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprintf/sprintf.dart';
import 'package:http/http.dart' as http;

class EventScreen extends StatelessWidget {
  String baseUrl = 'https://poodone.com/api/pood/main/home/%d';
  static const DOG = 1;
  static const CAT = 2;

  RxList<EventData> eventList = <EventData>[].obs; // 이벤트
  RxList<EventData> promotionList = <EventData>[].obs; // 기획전

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('기획전/이벤트')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _getData(pcIdx: DOG);
              },
              child: Text('강아지'),
            ),
            ElevatedButton(
              onPressed: () {
                _getData(pcIdx: CAT);
              },
              child: Text('고양이'),
            ),
            SizedBox(height: 50),
            // Obx(() => Text("이벤트: ${eventList}")),
            // Obx(() => Text("프로모션: ${promotionList}")),
          ],
        ),
      ),
    );
  }

  Future _getData({required int pcIdx}) async {
    // sprintf 적용
    String url = sprintf(baseUrl, [pcIdx]);
    var response = await http.get(Uri.parse(url));
    // print("response: ${response.body}");

    var data = jsonDecode(response.body);
    // print("data: $data");

    data.map((e) {
      var eventData = EventData(int.parse(e["idx"].toString()), e['url'],
          e['displayType'], e['type']);
      if (eventData.checkEvent) {
        eventList.add(eventData);
      } else {
        promotionList.add(eventData);
      }
    }).toList();

    print("eventList : ${eventList.length}");
    print("promotionList : ${promotionList.length}");
  }
}

class EventData {
  int idx;
  String url;
  String displayType;
  String type;

  EventData(this.idx, this.url, this.displayType, this.type);

  @override
  String toString() {
    return "EventData(idx: $idx, url: $url, displayType: $displayType, type: $type";
  }

  bool get checkEvent => this.type == 'E';
}
