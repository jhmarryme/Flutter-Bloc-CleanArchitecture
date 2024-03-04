import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState extends BaseBlocState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool isLoginButtonEnabled,
    @Default(false) bool obscureText,
    @Default('') String onPageError,
    @Default(false) bool showLoginButtonLoading,
  }) = _LoginState;
}
