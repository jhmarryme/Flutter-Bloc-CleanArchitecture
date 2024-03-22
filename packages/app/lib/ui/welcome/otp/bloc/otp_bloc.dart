import 'dart:async';

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
  }

  final OtpVerifyUseCase _otpVerifyUseCase;

  FutureOr<void> _onOtpPageInitiated(OtpPageInitiated event,
      Emitter<OtpState> emit,) {}

  FutureOr<void> _onOtpVerify(OtpVerify event,
      Emitter<OtpState> emit,) {
    _otpVerifyUseCase.execute(
        OtpVerifyInput(username: event.username, code: event.code,));
  }
}
