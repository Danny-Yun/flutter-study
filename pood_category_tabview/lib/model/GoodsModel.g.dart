// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GoodsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GoodsModel _$$_GoodsModelFromJson(Map<String, dynamic> json) =>
    _$_GoodsModel(
      idx: json['idx'] as int?,
      pcIdx: json['pcIdx'] as int?,
      goodsTypeIdx: json['goodsTypeIdx'] as int?,
      goodsName: json['goodsName'] as String?,
      goodsOriginPrice: json['goodsOriginPrice'] as int?,
      goodsPrice: json['goodsPrice'] as int?,
      discountRate: json['discountRate'] as int?,
      averageRating: (json['averageRating'] as num?)?.toDouble(),
      reviewCnt: json['reviewCnt'] as int?,
      mainImage: json['mainImage'] as String?,
    );

Map<String, dynamic> _$$_GoodsModelToJson(_$_GoodsModel instance) =>
    <String, dynamic>{
      'idx': instance.idx,
      'pcIdx': instance.pcIdx,
      'goodsTypeIdx': instance.goodsTypeIdx,
      'goodsName': instance.goodsName,
      'goodsOriginPrice': instance.goodsOriginPrice,
      'goodsPrice': instance.goodsPrice,
      'discountRate': instance.discountRate,
      'averageRating': instance.averageRating,
      'reviewCnt': instance.reviewCnt,
      'mainImage': instance.mainImage,
    };
