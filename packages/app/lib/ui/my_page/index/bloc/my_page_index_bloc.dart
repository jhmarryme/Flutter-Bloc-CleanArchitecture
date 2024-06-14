import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:injectable/injectable.dart';

import 'my_page_index.dart';

@Injectable()
class MyPageIndexBloc extends BaseBloc<MyPageIndexEvent, MyPageIndexState> {
  MyPageIndexBloc(this._logoutUseCase) : super(const MyPageIndexState()) {
    on<LogoutButtonPressed>(
      _onLogoutButtonPressed,
      transformer: log(),
    );
    on<OtpButtonPressed>(
      _onOtpButtonPressed,
      transformer: log(),
    );
  }

  final LogoutUseCase _logoutUseCase;

  FutureOr<void> _onLogoutButtonPressed(
    LogoutButtonPressed event,
    Emitter<MyPageIndexState> emit,
  ) async {
    return runBlocCatching(
      action: () async {
        await _logoutUseCase.execute(const LogoutInput());
      },
    );
  }

  FutureOr<void> _onOtpButtonPressed(
    OtpButtonPressed event,
    Emitter<MyPageIndexState> emit,
  ) async {
    // todo 这里写死用户名
    // 跳转到otp页面, 验证通过后会获取一个token用于后续流程
    final String? token = await navigator.push(AppRouteInfo.myPageOtp('fake'));
    logD('token: $token');
  }
}
