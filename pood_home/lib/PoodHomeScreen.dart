import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pood_home/model/MagazineModel.dart';
import 'package:pood_home/model/TodayModel.dart';
import 'package:pood_home/screen/CustomScreen.dart';
import 'package:pood_home/screen/EventScreen.dart';
import 'package:pood_home/screen/MegazineScreen.dart';
import 'package:pood_home/screen/TodayScreen.dart';

import 'model/EventModel.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<String> tabLabel = ['푸드홈', '오늘만 할인', '맞춤 스토어', '매거진'];
  int pcIdx = 1;
  bool loading = true;

  List<EventModel> eventList = [];
  List<TodayModel> todayList = [];
  List<MagazineModel> magazineList = [];

  @override
  void initState() {
    _controller = TabController(length: tabLabel.length, vsync: this);
    _init();
    super.initState();
  }

  Future _init() async {
    await _getEventData(url: "https://poodone.com/api/pood/main/home/$pcIdx");
    await _getTodayData(url: "https://poodone.com/api/pood/hot-time/$pcIdx");
    await _getMagazineData(
        url: "https://poodone.com/api/pood/main/temp/magagin");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
              loading ? Center(child: CircularProgressIndicator()) : _body()),
    );
  }

  // 바디 메서드
  Widget _body() {
    return DefaultTabController(
      length: tabLabel.length,
      child: Column(children: [
        _tabBar(tabLabel: tabLabel),
        Expanded(child: _tabBarView()),
      ]),
    );
  }

  // 탭바 메뉴
  Widget _tabBar({required List<String> tabLabel}) {
    return TabBar(
      controller: _controller,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade400,
      // 탭바 아래 막대바
      indicatorColor: Colors.black,
      tabs: List.generate(
        tabLabel.length,
        (index) => Tab(
          text: tabLabel[index],
        ),
      ),
    );
  }

  // 탭바 뷰
  Widget _tabBarView() {
    return TabBarView(
      controller: _controller,
      children: [
        EventScreen(eventList: eventList, key: PageStorageKey(UniqueKey())),
        TodayScreen(todayList: todayList),
        CustomScreen(),
        MegazineScreen(magazineList: magazineList),
      ],
    );
  }

  // 이벤트 데이터 파싱
  Future _getEventData({required String url}) async {
    var response = await Dio().get(url);
    eventList = response.data.map<EventModel>((e) {
      // print('e - ${e.toString()}');
      return EventModel.fromJson(e);
    }).toList();

    // print('event - $response');
    // print('data - ${response.data}');
    // print('eventList - ${eventList}');
  }

  // 오늘만 할인 데이터 파싱
  Future _getTodayData({required String url}) async {
    var response = await Dio().get(url);
    todayList = response.data.map<TodayModel>((e) {
      return TodayModel.fromJson(e);
    }).toList();

    // for (var data in todayList) {
    //   print(data.toString());
    // }

    // print('today - $response');
    // print('todayList - $todayList');
  }

  // 매거진 데이터 파싱
  Future _getMagazineData({required String url}) async {
    var response = await Dio().get(url);
    magazineList = response.data.map<MagazineModel>((e) {
      return MagazineModel.fromJson(e);
    }).toList();

    // print('magazine - $response');
  }
}
