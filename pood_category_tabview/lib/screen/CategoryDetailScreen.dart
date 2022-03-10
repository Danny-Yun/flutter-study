import 'package:flutter/material.dart';
import 'package:pood_category_tabview/repository/CategoryDetailRepository.dart';
import 'package:pood_category_tabview/resource/Urls.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  bool loadData = false;
  CategoryDetailRepository? categoryDetailRepository =
      CategoryDetailRepository();

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future _init() async {
    var response = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.ALL_FEED);
    await categoryDetailRepository!.getData(url: Urls.BASE_URL + Urls.DRY_FEED);
    await categoryDetailRepository!.getData(url: Urls.BASE_URL + Urls.WET_FEED);
    await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.SOFT_FEED);
    await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.AIR_DRY_FEED);
    await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.NATURAL_FEED);
    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(categoryTitle: '사료'),
      backgroundColor: Colors.white,
      body: _body(),
    );
  }

  // 앱바
  PreferredSizeWidget _appbar({required String categoryTitle}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(categoryTitle,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
      centerTitle: true,
      leading: _backButton(),
      actions: [_searchCartButtons()],
    );
  }

  // 뒤로가기 버튼
  Widget _backButton() {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          'assets/pood_icon_nav_back.png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  // 검색, 장바구니 버튼
  Widget _searchCartButtons() {
    return Row(
      children: [
        Image.asset(
          'assets/icon_search_black.png',
          width: 40,
        ),
        Image.asset(
          'assets/icon_basket.png',
          width: 43,
        ),
      ],
    );
  }

  Widget _body() {
    return Container();
  }
}
