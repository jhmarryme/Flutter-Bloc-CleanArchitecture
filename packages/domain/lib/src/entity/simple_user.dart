import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_user.freezed.dart';
part 'simple_user.g.dart';

@freezed
class SimpleUser with _$SimpleUser {
  factory SimpleUser({
    @Default(SimpleUser.defaultId) String id,
    @Default(SimpleUser.defaultName) String name,
    @Default(SimpleUser.defaultAge) int age,
  }) = _SimpleUser;

  static const defaultId = '';
  static const defaultName = '';
  static const defaultAge = 0;
  factory SimpleUser.fromJson(Map<String, dynamic> json) => _$SimpleUserFromJson(json);
}
