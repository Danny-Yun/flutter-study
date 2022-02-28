import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pood_home/model/TodayModel.dart';

class TodayScreen extends StatelessWidget {
  TodayScreen({required this.todayList, Key? key}) : super(key: key);
  List<TodayModel> todayList;

  @override
  Widget build(BuildContext context) {
    // for (var data in todayList) {
    //   print(data.toString());
    // }

    return _listView();
  }

  Widget _listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              // 이미지
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fitWidth,
                  fadeInDuration: Duration(seconds: 1),
                  fadeOutDuration: Duration(seconds: 1),
                  imageUrl: todayList[index].mainImage.toString(),
                ),
              ),
              SizedBox(height: 5),
              // 상품명
              Text(
                todayList[index].goodsName.toString(),
              ),
              SizedBox(height: 6),
              // 할인율, 할인 가격
              Row(
                children: [
                  Text(
                    todayList[index].discountRate.toString(),
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 7),
                  Text(
                    todayList[index].discountPrice.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: todayList.length,
    );
  }
}
