import 'dart:async';

import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_event.freezed.dart';

abstract class OtpEvent extends BaseBlocEvent {
  const OtpEvent();
}

/// 初始化事件
@freezed
class OtpPageInitiated extends OtpEvent with _$OtpPageInitiated {
  const factory OtpPageInitiated({
    required String username,
  }) = _OtpPageInitiated;
}

/// 验证码验证事件
@freezed
class OtpVerify extends OtpEvent with _$OtpVerify {
  const factory OtpVerify({
    @Default('') String username,
    @Default('') String code,
    // 用于获取返回当前事件执行的结果, 返回一个验证成功或失败的bool值
    required Completer<bool> completer,
  }) = _OtpVerify;
}

/// 验证码验证成功事件
@freezed
class OtpVerifySucceed extends OtpEvent with _$OtpVerifySucceed {
  const factory OtpVerifySucceed() = _OtpVerifySucceed;
}
