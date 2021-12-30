import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> dataList = [
    '개발',
    '마케팅',
    '경영지원',
    '디자인',
    '개발',
    '마케팅',
    '경영지원',
    '디자인',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: bodySeperated2(),
    );
  }

  // 4번 예시
  Widget bodySeperated2() {
    return ListView.separated(
      // physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return bodyBuilder();
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 30,
          color: Colors.blue,
        );
      },
      itemCount: dataList.length,
    );
  }

  // 4번 예시
  Widget bodySeperated() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return listItem(dataList[index]);
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 30,
          color: Colors.blue,
        );
      },
      itemCount: dataList.length,
    );
  }

  // 3번 예시
  Widget bodyBuilder() {
    return ListView.builder(
      // 중접 리스트 만들 때 primary, shrinkWrap
      // 메인 스크롤 관리
      primary: false,
      shrinkWrap: true,

      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            print('클릭');
          },
          child: listItem(dataList[index]),
        );
      },
      itemCount: dataList.length,
    );
  }

  // 2번 예시
  Widget listItem(String data) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      // 넓은 영역 클릭 유도
      // color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(data),
        ],
      ),
    );
    // return Container(
    //   child: Text('부서 : $data'),
    //   alignment: Alignment.center,
    //   height: 100,
    //   color: Colors.grey,
    // );
  }

  // 1번 예시
  Widget body() {
    return ListView(
      children: [
        Container(
          color: Colors.pink,
          height: 300,
          width: double.infinity,
        ),
        Container(
          color: Colors.yellow,
          height: 300,
          width: double.infinity,
        ),
        Container(
          color: Colors.blueAccent,
          height: 300,
          width: double.infinity,
        ),
        Container(
          color: Colors.greenAccent,
          height: 300,
          width: double.infinity,
        ),
      ],
    );
  }
}
