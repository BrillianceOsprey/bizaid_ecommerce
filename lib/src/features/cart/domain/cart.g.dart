// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      json['id'] as int,
      json['productCode'] as String,
      json['quantity'] as int,
      json['variantId'] as String?,
      Product.fromJson(json['product'] as Map<String, dynamic>),
      json['variant'] == null
          ? null
          : Variant.fromJson(json['variant'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'productCode': instance.productCode,
      'quantity': instance.quantity,
      'variantId': instance.variantId,
      'product': instance.product,
      'variant': instance.variant,
    };
