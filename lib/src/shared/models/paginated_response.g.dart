// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedData<T> _$PaginatedDataFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedData<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList() ?? [],
      meta: json['meta'] == null
          ? null
          : MetaData.fromJson(json['meta'] as Map<String, dynamic>),
    );

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      currentPage: json['current_page'] as int? ?? 0,
      from: json['from'] as int? ?? 0,
      perPage: json['per_page'] as int? ?? 0,
      to: json['to'] as int? ?? 0,
      nextPageUrl: json['next_page_url'] as String?,
      previousPageUrl: json['prev_page_url'] as String?,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'current_page': instance.currentPage,
      'from': instance.from,
      'per_page': instance.perPage,
      'to': instance.to,
      'next_page_url': instance.nextPageUrl,
      'prev_page_url': instance.previousPageUrl,
    };

PaginationRequest _$PaginationRequestFromJson(Map<String, dynamic> json) =>
    PaginationRequest(
      page: json['page'] as int,
      limit: json['limit'] as int,
    );

Map<String, dynamic> _$PaginationRequestToJson(PaginationRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
