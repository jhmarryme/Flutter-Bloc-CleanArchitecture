import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:injectable/injectable.dart';

import 'otp.dart';

@Injectable()
class OtpBloc extends BaseBloc<OtpEvent, OtpState> {
  OtpBloc(this._otpVerifyUseCase) : super(const OtpState()) {
    on<OtpPageInitiated>(
      _onOtpPageInitiated,
      transformer: log(),
    );
    on<OtpVerify>(
      _onOtpVerify,
      transformer: log(),
    );
    on<OtpVerifySucceed>(
      _onOtpVerifySucceed,
      transformer: log(),
    );
  }

  final OtpVerifyUseCase _otpVerifyUseCase;

  FutureOr<void> _onOtpPageInitiated(
    OtpPageInitiated event,
    Emitter<OtpState> emit,
  ) {
    emit(state.copyWith(username: event.username));
  }

  /// 验证码验证 事件
  FutureOr<void> _onOtpVerify(
    OtpVerify event,
    Emitter<OtpState> emit,
  ) async {
    await runBlocCatching(
      action: () async {
        final result = await _otpVerifyUseCase.execute(
            OtpVerifyInput(username: event.username, code: event.code));
        // 保存验证通过后的token
        emit(state.copyWith(sign: result.sign));
      },
      doOnSuccessOrError: () async {
        // 通过事件请求中的completer 返回事件的执行结果
        if (!event.completer.isCompleted) {
          event.completer.complete(state.sign.isNotBlank);
        }
      },
    );
  }

  /// 验证码验证通过 事件
  FutureOr<void> _onOtpVerifySucceed(
    OtpVerifySucceed event,
    Emitter<OtpState> emit,
  ) {
    //  携带sign返回上一个页面
    navigator.pop(result: state.sign);
  }
}
