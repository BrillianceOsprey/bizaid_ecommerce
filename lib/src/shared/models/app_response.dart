import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:starter_app/src/shared/errors/exceptions.dart';

part 'app_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AppResponse<T> extends Equatable {
  factory AppResponse({
    required String status,
    required int statusCode,
    required String message,
    List<Map<String, dynamic>>? errors,
    T? data,
  }) =>
      AppResponse._(
        status: status,
        statusCode: statusCode,
        message: message,
        errors: errors,
        data: data,
      );
  const AppResponse._({
    required this.status,
    required this.statusCode,
    required this.message,
    this.errors,
    this.data,
  });

  factory AppResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$AppResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T? value) toJsonT,
  ) =>
      _$AppResponseToJson(this, toJsonT);

  final String status;

  final int statusCode;
  final String message;

  final List<Map<String, dynamic>>? errors;

  final T? data;

  @override
  List<Object?> get props => [status, message, data ?? ''];

  @override
  bool? get stringify => true;
}

typedef FromJsonCallback<M> = M Function(Map<String, dynamic>);
Future<AppResponse<List<T>>> computeAppResponseList<T>(
  dynamic data,
  FromJsonCallback<T> fromJson,
) async {
  return compute(
    (dynamic message) => AppResponse<List<T>>.fromJson(
      message as Map<String, dynamic>,
      (json) {
        // message['isSuccess'] && json != null ? fromJson(json) : null,
        // if (!message['isSuccess']) return [];
        if (json == null) return [];
        final data = (json as List<dynamic>)
            .map((e) => fromJson(e as Map<String, dynamic>))
            .toList();
        return data;
      },
    ),
    data,
  );
}

extension AppResponseX<T> on AppResponse<T> {
  /// Extension function to throw exception if error occurred.
  AppResponse<T> throwIfError() {
    if (status == 'success') {
      return this;
    } else if (errors != null && errors!.isNotEmpty) {
      throw ServerException(
        statusCode: statusCode.toString(),
        message: errors!.map((e) => '${e['msg']}').toList().join('\n'),
      );
    } else {
      throw ServerException(
        statusCode: statusCode.toString(),
        message: message,
      );
    }
  }
}
