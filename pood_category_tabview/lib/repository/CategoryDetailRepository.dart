import 'package:dio/dio.dart';

class CategoryDetailRepository {
  static const headerToken = "token";
  static const headerUuid = "useruuid";

  // List<>

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

  Future getData({required String url}) async {
    var postData = {
      "fieldList": [
        {"fieldKey": "position", "fieldValue": "ALL"},
        {"fieldKey": "main_property", "fieldValue": "ALL"},
        {"fieldKey": "unit_size", "fieldValue": "ALL"},
        {"fieldKey": "feed_target", "fieldValue": "ALL"},
        {"fieldKey": "life_stage", "fieldValue": "ALL"}
      ]
    };
    return await dio.post(url, data: postData);
  }
}
