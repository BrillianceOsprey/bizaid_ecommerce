// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponse<T> _$AppResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    AppResponse<T>(
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      message:
          (json['message'] as List<dynamic>?)?.map((e) => e as String).toList(),
      error: json['error'] as String?,
      statusMessage: json['statusMessage'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$AppResponseToJson<T>(
  AppResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'error': instance.error,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'statusMessage': instance.statusMessage,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
