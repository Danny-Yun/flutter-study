import 'package:flutter/material.dart';
import 'package:my_pood/model/ListModel.dart';
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
    List<BaseModel> modelList = [];

    var headerModel = HeaderModel(Container(
      // double.infinity -
      width: double.infinity,
      height: 300,
      color: Colors.pink,
    ));

    var dividerModel = DividerModel();

    var subTitleModel = SubTitleModel(Text('서브타이틀'));

    var itemModel = ItemModel(Container(
      width: double.infinity,
      height: 300,
      color: Colors.blue,
    ));

    modelList.add(headerModel);
    modelList.add(dividerModel);
    modelList.add(subTitleModel);
    modelList.add(itemModel);

    for (var model in modelList) {
      print("model - ${model.type}");
    }

    return Scaffold(
      body: _body(modelList),
    );
  }

  // Widget _body(List<Pair<String, String>> pairList) {}
  Widget _body(List<BaseModel> modelList) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        var model;
        switch (modelList[index].type) {
          case TYPE.header:
            return (modelList[index] as HeaderModel).widget;
          case TYPE.divider:
            return (modelList[index] as DividerModel).widget;
          case TYPE.subTitle:
            return (modelList[index] as SubTitleModel).widget;
          case TYPE.item:
            return (modelList[index] as ItemModel).widget;
        }
        return Container();
      },
      separatorBuilder: (_, __) {
        return SizedBox(height: 0);
      },
      itemCount: modelList.length,
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
