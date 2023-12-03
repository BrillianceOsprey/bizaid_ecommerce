// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      productCode: json['productCode'] as String,
      erpCode: json['erpCode'] as String,
      productName: json['productName'] as String,
      price: json['price'] as int,
      imageUrl: json['imageUrl'] as String? ?? '',
      variants: (json['variants'] as List<dynamic>?)
              ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'productCode': instance.productCode,
      'erpCode': instance.erpCode,
      'productName': instance.productName,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'variants': instance.variants,
    };

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      code: json['variantCode'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'variantCode': instance.code,
      'imageUrl': instance.imageUrl,
    };
