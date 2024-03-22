import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState extends BaseBlocState with _$OtpState {
  const factory OtpState({
    @Default('') String username,
    @Default('') String code,
  }) = _OtpState;
}
