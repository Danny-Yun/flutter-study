import 'package:flutter/material.dart';
import 'package:pood_home/model/TodayModel.dart';

class TodayScreen extends StatelessWidget {
  TodayScreen({required this.todayList, Key? key}) : super(key: key);
  List<TodayModel> todayList;

  @override
  Widget build(BuildContext context) {
    for (var data in todayList) {
      print(data.toString());
    }

    return Container(
      child: Center(
        child: Text('투데이'),
      ),
    );
  }
}
