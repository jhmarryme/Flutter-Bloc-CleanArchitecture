import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_response.freezed.dart';
part 'data_response.g.dart';

/// 自己的响应数据结构
@Freezed(genericArgumentFactories: true)
class MyDataResponse<T> with _$MyDataResponse<T> {
  const factory MyDataResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') T? data,
  }) = _MyDataResponse;

  factory MyDataResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$MyDataResponseFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
class MyDataListResponse<T> with _$MyDataListResponse<T> {
  const factory MyDataListResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') List<T>? data,
  }) = _MyDataListResponse;

  factory MyDataListResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$MyDataListResponseFromJson(json, fromJsonT);
}
