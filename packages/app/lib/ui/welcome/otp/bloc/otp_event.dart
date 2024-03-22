import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_event.freezed.dart';

abstract class OtpEvent extends BaseBlocEvent {
  const OtpEvent();
}

@freezed
class OtpPageInitiated extends OtpEvent with _$OtpPageInitiated {
  const factory OtpPageInitiated({
    required String username,
  }) = _OtpPageInitiated;
}

@freezed
class OtpVerify extends OtpEvent with _$OtpVerify {
  const factory OtpVerify({
    @Default('') String username,
    @Default('') String code,
  }) = _OtpVerify;
}
