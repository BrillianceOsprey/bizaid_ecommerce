import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:starter_app/src/shared/errors/exceptions.dart';

part 'app_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class AppResponse<T> extends Equatable {
  const AppResponse._({
    this.status,
    this.message,
    this.statusCode,
    this.error,
    required this.statusMessage,
    this.data,
  });

  factory AppResponse({
    String? status,
    int? statusCode,
    List<String>? message,
    String? error,
    String? statusMessage,
    T? data,
  }) =>
      AppResponse._(
        status: status,
        message: message,
        statusCode: statusCode ?? 200,
        error: error,
        statusMessage: statusMessage ?? 'The request has succeeded.',
        data: data,
      );

  factory AppResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$AppResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
    Object? Function(T? value) toJsonT,
  ) =>
      _$AppResponseToJson(this, toJsonT);

  final String? status;
  final int? statusCode;
  final List<String>? message;
  final String? error;

  /// The [AppResponse] data
  final T? data;

  /// `statusMessage` added by http response (Not from server)
  final String statusMessage;

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
    if (error == null) {
      return this;
    } else {
      throw ServerException(
        statusCode: statusCode.toString(),
        message: error!,
      );
    }
  }
}
