import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  genericArgumentFactories: true,
  createToJson: false,
)
class PaginatedData<T> extends Equatable {
  const PaginatedData({
    required this.data,
    this.meta,
  });

  @JsonKey(name: 'data', defaultValue: [])
  final List<T> data;

  @JsonKey(name: 'meta')
  final MetaData? meta;

  bool get isCompleted => meta == null ? true : meta!.nextPageUrl == null;

  PaginationRequest? nextPage() => meta == null
      ? null
      : PaginationRequest(
          page: meta!.currentPage + 1,
          limit: MetaData.itemPerPage,
        );

  factory PaginatedData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedDataFromJson(json, fromJsonT);

  @override
  List<Object?> get props => [data, meta ?? ''];

  @override
  bool? get stringify => true;
}

// {
//   "current_page": 1,
//   "first_page_url":
//       "http://13.228.29.1/api/v1/shop-mobile/products?page=1&limit=20&search=&divisionId=&itemCategoryId=&productCategoryId=",
//   "from": 1,
//   "next_page_url":
//       "http://13.228.29.1/api/v1/shop-mobile/products?page=2&limit=20&search=&divisionId=&itemCategoryId=&productCategoryId=",
//   "path":
//       "http://13.228.29.1/api/v1/shop-mobile/products?page=1&limit=20&search=&divisionId=&itemCategoryId=&productCategoryId=",
//   "per_page": 20,
//   "prev_page_url": null,
//   "to": 20
// }
@JsonSerializable()
class MetaData {
  const MetaData({
    required this.currentPage,
    required this.from,
    required this.perPage,
    required this.to,
    this.nextPageUrl,
    this.previousPageUrl,
  });

  static const int itemPerPage = 20;

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);

  @JsonKey(name: 'current_page', defaultValue: 0)
  final int currentPage;

  @JsonKey(name: 'from', defaultValue: 0)
  final int from;

  @JsonKey(name: 'per_page', defaultValue: 0)
  final int perPage;

  @JsonKey(name: 'to', defaultValue: 0)
  final int to;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  @JsonKey(name: 'prev_page_url')
  final String? previousPageUrl;
}

@JsonSerializable()
class PaginationRequest extends Equatable {
  const PaginationRequest({required this.page, required this.limit});

  factory PaginationRequest.fromJson(Map<String, dynamic> json) =>
      _$PaginationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationRequestToJson(this);

  final int page;
  final int limit;

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}
