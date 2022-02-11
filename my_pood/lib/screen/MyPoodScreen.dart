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
  ];

  List<Pair<String, String>> pairList2 = [
    Pair(first: 'pood_icon_point.png', second: '고객센터'),
    Pair(first: 'pood_icon_point.png', second: '친구초대'),
    Pair(first: 'pood_icon_point.png', second: '이벤트 신청 내역'),
  ];

  @override
  Widget build(BuildContext context) {
    List<BaseModel> modelList = _initDataset();

    return Scaffold(
      body: _body(modelList),
    );
  }

  List<BaseModel> _initDataset() {
    List<BaseModel> modelList = [];

    modelList.add(HeaderModel(_header()));
    modelList.add(BannerModel(_banner()));
    modelList.add(DividerModel());

    modelList.add(SubTitleModel(_subTitle(subTitle: '빠른관리')));
    for (var pair in pairList) {
      modelList.add(ItemModel(_listItem(pair, (title) {
        print('title - $title');
      })));
    }
    modelList.add(DividerModel());

    modelList.add(SubTitleModel(_subTitle(subTitle: '고객 서비스')));
    for (var pair in pairList2) {
      modelList.add(ItemModel(_listItem(pair, (title) {
        print('title - $title');
      })));
    }

    for (var model in modelList) {
      print("model - ${model.type}");
    }
    return modelList;
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("윤지우"),
                const Text("Welcome 등급"),
              ],
            ),
          ),
          _arrow(),
        ],
      ),
    );
  }

  Widget _banner() {
    return Image.asset("assets/mypood_banner_aftersignin.png");
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
          case TYPE.banner:
            return (modelList[index] as BannerModel).widget;
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

  Widget _subTitle({required String subTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        subTitle,
      ),
    );
  }

  Widget _listItem(Pair<String, String> pair, Function(String) onTap) {
    return InkWell(
      onTap: () => onTap(pair.second),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              constraints: BoxConstraints(maxHeight: 24, maxWidth: 24),
              child: Image.asset("assets/${pair.first}"),
            ),
            SizedBox(width: 8),
            Text(pair.second),
            // 공간을 최대한 벌려줌
            Spacer(),
            _arrow(),
          ],
        ),
      ),
    );
  }

  Widget _arrow() {
    return Container(
      child: Image.asset('assets/icon_arrow_right_grey.png'),
      // constraints - 이미지 크기 제한
      constraints: BoxConstraints(maxHeight: 12, maxWidth: 8),
    );
  }
}
