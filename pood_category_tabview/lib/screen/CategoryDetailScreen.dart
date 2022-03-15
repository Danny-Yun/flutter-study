import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pood_category_tabview/controller/CategoryDetailController.dart';
import 'package:pood_category_tabview/model/GoodsModel.dart';
import 'package:pood_category_tabview/repository/CategoryDetailRepository.dart';
import 'package:pood_category_tabview/resource/Urls.dart';
import 'package:pood_category_tabview/resource/span_list_view.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({Key? key}) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen>
    with TickerProviderStateMixin {
  bool loadData = false;
  CategoryDetailRepository? categoryDetailRepository =
      CategoryDetailRepository();

  late TabController _tabController;
  List tabLabel = ['전체', '건식사료', '습식사료', '소프트사료', '에어드라이', '자연식'];

  final ScrollController _scrollController = ScrollController();
  int pageIdx = CategoryDetailController.to.pageIdx.value;

  List<GoodsModel> allFeedList = [];
  List<GoodsModel> dryFeedList = [];
  List<GoodsModel> wetFeedList = [];
  List<GoodsModel> softFeedList = [];
  List<GoodsModel> airDryFeedList = [];
  List<GoodsModel> naturalFeedList = [];

  List<GoodsModel> newData = [];
  int checkIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: tabLabel.length, vsync: this);
    _init();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        print("New Data Call");
        print('tabIdx - ${_tabController.index}');
        print('checkIndex - ${checkIndex}');

        if (checkIndex != _tabController.index) {
          pageIdx = 0;
        }

        pageIdx++;
        print('pageIdx - $pageIdx');
        _fetchData(_tabController.index);

        checkIndex = _tabController.index;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    _scrollController.dispose();
    super.dispose();
  }

  Future _init() async {
    setState(() {
      loadData = false;
    });
    // print('pageIdx - $pageIdx');
    allFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.ALL_FEED, pageIdx: 0);
    dryFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.DRY_FEED, pageIdx: 0);
    wetFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.WET_FEED, pageIdx: 0);
    softFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.SOFT_FEED, pageIdx: 0);
    airDryFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.AIR_DRY_FEED, pageIdx: 0);
    naturalFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.NATURAL_FEED, pageIdx: 0);

    setState(() {
      loadData = true;
    });
  }

  Future _fetchData(int tabIdx) async {
    if (tabIdx == 0) {
      newData = await categoryDetailRepository!
          .getData(url: Urls.BASE_URL + Urls.ALL_FEED, pageIdx: pageIdx);
      print(newData);
      allFeedList.addAll(newData);
      setState(() {});
    }
    if (tabIdx == 1) {
      newData = await categoryDetailRepository!
          .getData(url: Urls.BASE_URL + Urls.DRY_FEED, pageIdx: pageIdx);
      print(newData);
      dryFeedList.addAll(newData);
      setState(() {});
    }
    if (tabIdx == 2) {
      newData = await categoryDetailRepository!
          .getData(url: Urls.BASE_URL + Urls.WET_FEED, pageIdx: pageIdx);
      print(newData);
      wetFeedList.addAll(newData);
      setState(() {});
    }
    if (tabIdx == 3) {
      newData = await categoryDetailRepository!
          .getData(url: Urls.BASE_URL + Urls.SOFT_FEED, pageIdx: pageIdx);
      print(newData);
      softFeedList.addAll(newData);
      setState(() {});
    }
    if (tabIdx == 4) {
      newData = await categoryDetailRepository!
          .getData(url: Urls.BASE_URL + Urls.AIR_DRY_FEED, pageIdx: pageIdx);
      print(newData);
      airDryFeedList.addAll(newData);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(categoryTitle: '사료'),
      backgroundColor: Colors.white,
      body: SafeArea(child: _body()),
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
    return DefaultTabController(
      length: tabLabel.length,
      child: Column(
        children: [
          _tabBar(),
          _tabBarView(),
        ],
      ),
    );
  }

  // 탭바
  Widget _tabBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xffefefef))),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey.shade400,
        indicatorColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(horizontal: 20),
        indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
        isScrollable: true,
        tabs: List.generate(
          tabLabel.length,
          (index) => Tab(
            text: tabLabel[index],
          ),
        ),
      ),
    );
  }

  // 탭바 뷰
  Widget _tabBarView() {
    return Expanded(
      child: loadData
          ? TabBarView(
              controller: _tabController,
              children: [
                _tabBarViewScreen(feedList: allFeedList),
                _tabBarViewScreen(feedList: dryFeedList),
                _tabBarViewScreen(feedList: wetFeedList),
                _tabBarViewScreen(feedList: softFeedList),
                _tabBarViewScreen(feedList: airDryFeedList),
                // _tabBarViewScreen(feedList: naturalFeedList),
                Center(child: Text('상품이 준비중입니다.')),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _tabBarViewScreen({required List<GoodsModel> feedList}) {
    if (feedList == null) {
      return Center(child: Text('상품이 준비중입니다.'));
    }
    return SingleChildScrollView(
      controller: _scrollController,
      child: SpanListView(
        itemCount: feedList.length,
        span: 2,
        lineVerticalAxisAlignment: CrossAxisAlignment.start,
        separatorWidget: const SizedBox(height: 8),
        usePercentFetchData: true,
        widgetBuilder: (index) {
          return GestureDetector(
            child: _item(
                goodsModel: feedList[index],
                index: index,
                size: MediaQuery.of(context).size.width),
          );
        },
      ),
    );
  }

  Widget _item({
    required GoodsModel goodsModel,
    required int index,
    required double size,
  }) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(goodsModel: goodsModel, size: size),
          SizedBox(height: 8),
          _goodsName(goodsModel: goodsModel),
          SizedBox(height: 4),
          _discount(goodsModel: goodsModel),
          SizedBox(height: 4),
          _review(goodsModel: goodsModel),
        ],
      ),
    );
  }

  // 이미지
  Widget _image({required GoodsModel goodsModel, required double size}) {
    if (goodsModel.mainImage == null) {
      return SizedBox();
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        width: size / 2.3,
        height: 200,
        fit: BoxFit.cover,
        filterQuality: FilterQuality.high,
        fadeInDuration: Duration(milliseconds: 500),
        fadeOutDuration: Duration(milliseconds: 500),
        imageUrl: goodsModel.mainImage.toString(),
      ),
    );
  }

  // 상품명
  Widget _goodsName({required GoodsModel goodsModel}) {
    return Text(
      goodsModel.goodsName.toString(),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  // 할인율, 할인 가격
  Widget _discount({required GoodsModel goodsModel}) {
    var format = NumberFormat("###,###,###,###");
    String price = format.format(goodsModel.goodsPrice);

    return Row(
      children: [
        if (goodsModel.discountRate != null) ...[
          Text(
            "${goodsModel.discountRate.toString()}%",
            style: TextStyle(
                color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
        SizedBox(width: 7),
        Text(
          price,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // 리뷰 정보
  Widget _review({required GoodsModel goodsModel}) {
    if (goodsModel.reviewCnt != null && goodsModel.reviewCnt! > 0) {
      return Row(
        children: [
          Icon(
            Icons.star,
            size: 18,
            color: Colors.blue,
          ),
          Text(
            goodsModel.averageRating.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "리뷰 ${goodsModel.reviewCnt.toString()}",
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        ],
      );
    } else {
      return SizedBox();
    }
  }
}
