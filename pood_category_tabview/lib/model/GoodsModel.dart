import 'package:freezed_annotation/freezed_annotation.dart';

part 'GoodsModel.freezed.dart';
part 'GoodsModel.g.dart';

@freezed
class GoodsModel with _$GoodsModel {
  factory GoodsModel({
    int? idx,
    int? pcIdx,
    int? goodsTypeIdx,
    String? goodsName,
    int? goodsOriginPrice,
    int? goodsPrice,
    int? discountRate,
    double? averageRating,
    int? reviewCnt,
    String? mainImage,
  }) = _GoodsModel;

  factory GoodsModel.fromJson(Map<String, dynamic> json) =>
      _$GoodsModelFromJson(json);
}
