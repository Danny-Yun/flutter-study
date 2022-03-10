import 'package:flutter/material.dart';
import 'package:pood_category_tabview/model/GoodsModel.dart';
import 'package:pood_category_tabview/repository/CategoryDetailRepository.dart';
import 'package:pood_category_tabview/resource/Urls.dart';

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

  List<GoodsModel> allFeedList = [];
  List<GoodsModel> dryFeedList = [];
  List<GoodsModel> wetFeedList = [];
  List<GoodsModel> softFeedList = [];
  List<GoodsModel> airDryFeedList = [];
  List<GoodsModel> naturalFeedList = [];

  @override
  void initState() {
    _tabController = TabController(length: tabLabel.length, vsync: this);
    _init();
    super.initState();
  }

  Future _init() async {
    allFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.ALL_FEED);
    dryFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.DRY_FEED);
    wetFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.WET_FEED);
    softFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.SOFT_FEED);
    airDryFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.AIR_DRY_FEED);
    naturalFeedList = await categoryDetailRepository!
        .getData(url: Urls.BASE_URL + Urls.NATURAL_FEED);

    // print('all - $allFeedList');
    // print('dry - $dryFeedList');
    // print('wet - $wetFeedList');
    // print('soft - $softFeedList');
    // print('air - $airDryFeedList');
    // print('natural - $naturalFeedList');
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
      child: TabBarView(
        controller: _tabController,
        children: [
          Container(child: Center(child: Text('1'))),
          Container(child: Center(child: Text('2'))),
          Container(child: Center(child: Text('3'))),
          Container(child: Center(child: Text('4'))),
          Container(child: Center(child: Text('5'))),
          Container(child: Center(child: Text('6'))),
        ],
      ),
    );
  }

  Widget _tabBarViewScreen({required List<GoodsModel> feedList}) {
    return ListView.builder(
      itemCount: feedList.length,
      itemBuilder: (context, index) {},
    );
  }
}
