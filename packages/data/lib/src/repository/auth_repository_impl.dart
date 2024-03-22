import 'package:data/src/repository/source/api/auth_api_service.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._appApiService);

  final AuthApiService _appApiService;

  @override
  Future<String> verify(
    String username,
    String code,
  ) async {
    final response =
        await _appApiService.verify(username: username, code: code);

    return Future.value(response?.data ?? '');
  }
}
