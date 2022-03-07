class CustomModel {
  int? idx;
  String? displayType;
  String? goodsName;
  int? goodsPrice;
  int? discountRate;
  double? averageRating;
  int? reviewCnt;
  String? mainImage;

  CustomModel({
    required this.idx,
    required this.displayType,
    required this.goodsName,
    required this.goodsPrice,
    required this.discountRate,
    required this.averageRating,
    required this.reviewCnt,
    required this.mainImage,
  });

  String toString() {
    return "CustomModel(idx : $idx, displayType: $displayType, goodsName : $goodsName, goodsPrice : $goodsPrice, discountRate : $discountRate,"
        "averageRating : $averageRating, reviewCnt : $reviewCnt, mainImage : $mainImage)\n";
  }

  factory CustomModel.fromJson(Map<String, dynamic> json) {
    return CustomModel(
      idx: json["idx"] as int?,
      displayType: json["displayType"] as String?,
      goodsName: json["goodsName"] as String?,
      goodsPrice: json["goodsPrice"] as int?,
      discountRate: json["discountRate"] as int?,
      averageRating: json["averageRating"] as double?,
      reviewCnt: json["reviewCnt"] as int?,
      mainImage: json["mainImage"] as String?,
    );
  }
}
