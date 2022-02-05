import 'package:flutter/material.dart';
import 'package:my_pood/model/Pair.dart';

class MyPood extends StatelessWidget {
  MyPood({Key? key}) : super(key: key);

  List<Pair<String, String>> pairList = [
    Pair(first: 'pood_icon_orderlist.png', second: '주문목록'),
    Pair(first: 'pood_icon_point.png', second: '포인트'),
    Pair(first: 'pood_icon_reward.png', second: '나의 쿠폰'),
    Pair(first: 'pood_icon_review.png', second: '나의 리뷰'),
    Pair(first: 'pood_icon_favorite.png', second: '나의 찜'),
    Pair(first: 'pood_icon_my_ticket.png', second: '배송지관리'),
    Pair(first: 'pood_icon_point.png', second: '고객센터'),
    Pair(first: 'pood_icon_point.png', second: '친구초대'),
    Pair(first: 'pood_icon_point.png', second: '이벤트 신청 내역'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(pairList),
    );
  }

  Widget _body(List<Pair<String, String>> pairList) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return _listViewItem(pairList[index]);
      },
      separatorBuilder: (_, __) {
        return SizedBox();
      },
      itemCount: pairList.length,
    );
  }

  // _parseData() {}
  Widget _listViewItem(Pair<String, String> pair) {
    return ListTile(
      leading: Image.asset("assets/${pair.first}"),
      title: Text(pair.second),
      onTap: () {},
    );
  }
}
