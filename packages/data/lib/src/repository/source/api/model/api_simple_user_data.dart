import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_simple_user_data.freezed.dart';
part 'api_simple_user_data.g.dart';

@freezed
class ApiSimpleUserData with _$ApiSimpleUserData {
  const ApiSimpleUserData._();

  const factory ApiSimpleUserData({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'age') int? age,
  }) = _ApiSimpleUserData;

  factory ApiSimpleUserData.fromJson(Map<String, dynamic> json) => _$ApiSimpleUserDataFromJson(json);
}
