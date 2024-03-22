import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.freezed.dart';
part 'data_response.g.dart';

@Freezed(genericArgumentFactories: true)
class DataResponse<T> with _$DataResponse<T> {
  const factory DataResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') T? data,
  }) = _DataResponse;

  factory DataResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$DataResponseFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
class DataListResponse<T> with _$DataListResponse<T> {
  const factory DataListResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') List<T>? data,
  }) = _DataListResponse;

  factory DataListResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$DataListResponseFromJson(json, fromJsonT);
}
