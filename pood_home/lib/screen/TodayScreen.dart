import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pood_home/model/TodayModel.dart';

class TodayScreen extends StatelessWidget {
  TodayScreen({required this.todayList, Key? key}) : super(key: key);
  List<TodayModel> todayList;
  var format = NumberFormat("###,###,###,###");

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
      itemCount: todayList.length,
      itemBuilder: (context, index) => _listItem(
        todayModel: todayList[index],
        size: MediaQuery.of(context).size.width,
      ),
    );
  }

  Widget _listItem({required TodayModel todayModel, required double size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          // 이미지
          _image(todayModel: todayModel, size: size),
          SizedBox(height: 10),
          // 상품명
          Text(
            todayModel.goodsName.toString(),
          ),
          SizedBox(height: 6),
          // 할인율, 할인 가격
          _discount(todayModel: todayModel),
          SizedBox(height: 6),
          // 리뷰 평균 점수, 리뷰 수
          _review(todayModel: todayModel),
        ],
      ),
    );
  }

  // 이미지
  Widget _image({required TodayModel todayModel, required double size}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        width: size,
        height: 280,
        fadeInDuration: Duration(milliseconds: 500),
        fadeOutDuration: Duration(milliseconds: 500),
        imageUrl: todayModel.mainImage.toString(),
      ),
    );
  }

  // 할인율, 할인 가격
  Widget _discount({required TodayModel todayModel}) {
    String price = format.format(todayModel.goodsPrice);

    return Row(
      children: [
        if (todayModel.discountRate != null) ...[
          Text(
            "${todayModel.discountRate.toString()}%",
            style: TextStyle(
                color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
        SizedBox(width: 7),
        Text(
          price,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 리뷰 평균 점수, 리뷰 수
  Widget _review({required TodayModel todayModel}) {
    if (todayModel.reviewCnt != null && todayModel.reviewCnt! > 0) {
      return Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.blue,
          ),
          Text(
            todayModel.averageRating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "리뷰 ${todayModel.reviewCnt.toString()}",
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
