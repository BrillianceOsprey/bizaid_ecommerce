// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String productCode;
  final String erpCode;
  final String productName;
  final int price;
  @JsonKey(defaultValue: '')
  final String imageUrl;

  @JsonKey(name: 'variants', defaultValue: [])
  final List<Variant> variants;

  const Product({
    required this.productCode,
    required this.erpCode,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.variants,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Product copyWith({
    String? productCode,
    String? erpCode,
    String? productName,
    int? price,
    String? imageUrl,
    List<Variant>? variants,
  }) {
    return Product(
      productCode: productCode ?? this.productCode,
      erpCode: erpCode ?? this.erpCode,
      productName: productName ?? this.productName,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      variants: variants ?? this.variants,
    );
  }

  @override
  List<Object?> get props => [productCode];
}
//    "productCode": "P17676",
//   "erpCode": "SHKUFG038",
//   "productName": "FOOD STREAMER PLATE အစားအပေါင်းခံပြား( 17CM)",
//   "price": 3800,
//   "imageUrl": null,
//   "variants": []

@JsonSerializable()
class Variant extends Equatable {
  const Variant({required this.code, required this.imageUrl});

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  @JsonKey(name: 'variantCode', defaultValue: '')
  final String code;

  @JsonKey(name: 'imageUrl', defaultValue: '')
  final String imageUrl;

  @override
  List<Object?> get props => [code, imageUrl];

  @override
  bool? get stringify => true;
}
