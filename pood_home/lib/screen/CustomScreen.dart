import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pood_home/controller/PoodHomeController.dart';
import 'package:pood_home/model/CustomModel.dart';
import 'package:pood_home/resource/Urls.dart';

class CustomScreen extends StatefulWidget {
  CustomScreen({Key? key}) : super(key: key);

  @override
  State<CustomScreen> createState() => _CustomScreenState();
}

class _CustomScreenState extends State<CustomScreen> {
  var format = NumberFormat("###,###,###,###");
  List<CustomModel> feedList = [];
  List<CustomModel> snackList = [];
  List<CustomModel> nutrientsList = [];
  List<CustomModel> suppliesList = [];

  double _imageWidth = 170;
  int pcIdx = PoodHomeController.to.pcIdx.value;
  bool loading = true;

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future _init() async {
    feedList = await _getCustomData(url: Urls.CUSTOM_PRODUCT_FEED + "/$pcIdx");
    snackList =
        await _getCustomData(url: Urls.CUSTOM_PRODUCT_SNACK + "/$pcIdx");
    nutrientsList =
        await _getCustomData(url: Urls.CUSTOM_PRODUCT_NUTRIENTS + "/$pcIdx");
    suppliesList =
        await _getCustomData(url: Urls.CUSTOM_PRODUCT_SUPPLIES + "/$pcIdx");
    // print('feedList - $feedList');
    // print('snackList - $snackList');
    // print('nutrientsList - $nutrientsList');
    // print('suppliesList - $suppliesList');
    if (this.mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  // 맞춤 스토어 데이터 파싱
  Future<List<CustomModel>> _getCustomData({required String url}) async {
    print("커스텀 호출 : $url");
    var response = await Dio().get(url);
    return response.data.map<CustomModel>((e) {
      return CustomModel.fromJson(e);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              children: [
                noPetHeader(),
                storeCustomizedList(),
              ],
            ),
          );
  }

  Widget noPetHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '마이 펫 등록이',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '필요합니다',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          checkMeritRegisterPet('AI가 추천해주는 맞춤 스토어 오픈'),
          const SizedBox(height: 10),
          checkMeritRegisterPet('건강관리 기능 오픈'),
          const SizedBox(height: 10),
          checkMeritRegisterPet('사료, 간식, 영양제 별 맞춤 급여량 계산'),
          const SizedBox(height: 10),
          checkMeritRegisterPet('수의사 채팅 상담 기능'),
        ],
      ),
    );
  }

  Widget checkMeritRegisterPet(String text) {
    return Row(
      children: [
        Icon(
          Icons.check_circle,
          color: Colors.blue,
        ),
        SizedBox(width: 7),
        Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }

  // 맞춤 스토어 리스트
  Widget storeCustomizedList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _title('추천 사료'),
        _listView(feedList),
        _divider(),
        _title('추천 간식'),
        _listView(snackList),
        _divider(),
        _title('추천 영양제'),
        _listView(nutrientsList),
        _divider(),
        _title('추천 용품'),
        _listView(suppliesList),
      ],
    );
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 30,
      thickness: 1,
      color: Colors.grey.shade200,
    );
  }

  Widget _listView(List<CustomModel> dataList) {
    return Container(
      height: 270,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: dataList.length,
        itemBuilder: (_, index) => _listItem(customModel: dataList[index]),
        separatorBuilder: (_, index) => SizedBox(width: 12),
      ),
    );
  }

  Widget _listItem({required CustomModel customModel}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _image(customModel: customModel),
        SizedBox(height: 8),
        _goodsName(customModel: customModel),
        SizedBox(height: 4),
        _discount(customModel: customModel),
        SizedBox(height: 4),
        _review(customModel: customModel),
      ],
    );
  }

  // 이미지
  Widget _image({required CustomModel customModel}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        width: _imageWidth,
        height: 160,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        fadeInDuration: Duration(milliseconds: 500),
        fadeOutDuration: Duration(milliseconds: 500),
        imageUrl: customModel.mainImage.toString(),
      ),
    );
  }

  // 상품명
  Widget _goodsName({required CustomModel customModel}) {
    return Container(
      width: _imageWidth - 10,
      child: Text(
        customModel.goodsName.toString(),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  // 할인율, 할인 가격
  Widget _discount({required CustomModel customModel}) {
    String price = format.format(customModel.goodsPrice);

    return Row(
      children: [
        if (customModel.discountRate != null) ...[
          Text(
            "${customModel.discountRate.toString()}%",
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
  Widget _review({required CustomModel customModel}) {
    if (customModel.reviewCnt != null && customModel.reviewCnt! > 0) {
      return Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.blue,
          ),
          Text(
            customModel.averageRating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "리뷰 ${customModel.reviewCnt.toString()}",
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
