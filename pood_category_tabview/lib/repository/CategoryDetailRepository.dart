import 'package:dio/dio.dart';
import 'package:pood_category_tabview/model/GoodsModel.dart';
import 'package:sprintf/sprintf.dart';

class CategoryDetailRepository {
  static const headerToken = "token";
  static const headerUuid = "useruuid";

  List<GoodsModel> feedList = [];

  Dio dio = Dio(
    BaseOptions(
      validateStatus: (status) {
        return status! < 500;
      },
      connectTimeout: 10000,
      receiveTimeout: 3000,
      headers: {
        'Content-Type': Headers.jsonContentType,
        headerToken: "",
        headerUuid: ""
      },
    ),
  );

  Future getData({required String url, required int pageIdx}) async {
    var postData = {
      "fieldList": [
        {"fieldKey": "position", "fieldValue": "ALL"},
        {"fieldKey": "main_property", "fieldValue": "ALL"},
        {"fieldKey": "unit_size", "fieldValue": "ALL"},
        {"fieldKey": "feed_target", "fieldValue": "ALL"},
        {"fieldKey": "life_stage", "fieldValue": "ALL"}
      ]
    };

    String newUrl = sprintf(url, [pageIdx]);
    var response = await dio.post(newUrl, data: postData);

    var feedList = response.data['content'].map<GoodsModel>((e) {
      return GoodsModel.fromJson(e);
    }).toList();
    // print(response.data['content']);
    // print(feedList);

    return feedList;
  }
}
