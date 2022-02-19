class TodayModel {
  int? idx;
  String? goodsName;
  int? discountRate;
  int? discountPrice;
  int? saleStatus;
  int? mainProduct;
  double? averageRating;
  int? reviewCnt;
  String? mainImage;
  Map<String, dynamic>? promotionInfo;

  TodayModel({
    required this.idx,
    required this.goodsName,
    required this.discountRate,
    required this.discountPrice,
    required this.saleStatus,
    required this.mainProduct,
    required this.averageRating,
    required this.reviewCnt,
    required this.mainImage,
    required this.promotionInfo,
  });

  @override
  String toString() {
    return "TodayModel(idx : $idx, goodsName : $goodsName, discountRate : $discountRate, discountPrice : $discountPrice, saleStatus : $saleStatus,"
        "mainProduct : $mainProduct, averageRating : $averageRating, reviewCnt : $reviewCnt, mainImage : $mainImage, mainImage : $mainImage)\n";
  }

  factory TodayModel.fromJson(Map<String, dynamic> json) {
    return TodayModel(
      idx: json["idx"] as int?,
      goodsName: json["goodsName"] as String?,
      discountRate: json["discountRate"] as int?,
      discountPrice: json["discountPrice"] as int?,
      saleStatus: json["saleStatus"] as int?,
      mainProduct: json["mainProduct"] as int?,
      averageRating: json["averageRating"] as double?,
      reviewCnt: json["reviewCnt"] as int?,
      mainImage: json["mainImage"] as String?,
      promotionInfo: json["promotionInfo"] as Map<String, dynamic>?,
    );
  }
}

class promotionInfo {
  int? idx;
  String? name;
  int? prPrice;
  int? prDiscountPrice;
  int? prDiscountRate;
  String? startPeriod;
  String? endPeriod;
  int? goodsIdx;

  promotionInfo({
    required this.idx,
    required this.name,
    required this.prPrice,
    required this.prDiscountPrice,
    required this.prDiscountRate,
    required this.startPeriod,
    required this.endPeriod,
    required this.goodsIdx,
  });

  factory promotionInfo.fromJson(Map<String, dynamic> json) {
    return promotionInfo(
      idx: json["idx"] as int?,
      name: json["name"] as String?,
      prPrice: json["prPrice"] as int?,
      prDiscountPrice: json["prDiscountPrice"] as int?,
      prDiscountRate: json["prDiscountRate"] as int?,
      startPeriod: json["startPeriod"] as String?,
      endPeriod: json["endPeriod"] as String?,
      goodsIdx: json["goodsIdx"] as int?,
    );
  }
}
