import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain.dart';

part 'otp_verify_use_case.freezed.dart';

@Injectable()
class OtpVerifyUseCase
    extends BaseFutureUseCase<OtpVerifyInput, OtpVerifyOutput> {
  const OtpVerifyUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @protected
  @override
  Future<OtpVerifyOutput> buildUseCase(OtpVerifyInput input) async {
    final result = await _authRepository.verify(
      input.username,
      input.code,
    );

    return OtpVerifyOutput(sign: result);
  }
}

@freezed
class OtpVerifyInput extends BaseInput with _$OtpVerifyInput {
  const factory OtpVerifyInput({
    required String username,
    required String code,
  }) = _OtpVerifyInput;
}

@freezed
class OtpVerifyOutput extends BaseOutput with _$OtpVerifyOutput {
  const OtpVerifyOutput._();

  const factory OtpVerifyOutput({
    @Default('') String sign,
  }) = _OtpVerifyOutput;
}
