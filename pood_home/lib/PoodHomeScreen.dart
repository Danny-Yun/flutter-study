import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pood_home/screen/CustomScreen.dart';
import 'package:pood_home/screen/EventScreen.dart';
import 'package:pood_home/screen/MegazineScreen.dart';
import 'package:pood_home/screen/TodayScreen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<String> tabLabel = ['탭1', '탭2', '탭3', '탭4'];
  int pcIdx = 1;

  @override
  void initState() {
    _controller = TabController(length: tabLabel.length, vsync: this);
    // _controller.animation!.addListener(() {
    //   // print(_controller.animation!.value);
    // });
    _getEventData(url: "https://poodone.com/api/pood/main/home/$pcIdx");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() {
    return DefaultTabController(
      length: tabLabel.length,
      child: Column(children: [
        _tabBar(tabLabel: tabLabel),
        Expanded(child: _tabBarView()),
      ]),
    );
  }

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

  Widget _tabBarView() {
    return TabBarView(
      controller: _controller,
      children: [
        EventScreen(),
        TodayScreen(),
        CustomScreen(),
        MegazineScreen(),
      ],
    );
  }

  Future _getEventData({required String url}) async {
    var response = await Dio().get(url);
    print('response - $response');
  }
}
