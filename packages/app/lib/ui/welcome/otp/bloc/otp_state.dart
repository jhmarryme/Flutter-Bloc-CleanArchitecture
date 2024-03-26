import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState extends BaseBlocState with _$OtpState {
  const factory OtpState({
    // 用户名
    @Default('') String username,
    // 验证码
    @Default('') String code,
    // 验证码验证成功后得到的token
    @Default('') String sign,
  }) = _OtpState;
}
