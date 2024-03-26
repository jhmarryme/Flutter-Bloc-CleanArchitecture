import 'package:flutter_clearmind_archetype_data/data.dart';
import 'package:injectable/injectable.dart';

import '../../../../data.dart';

@LazySingleton()
class AuthApiService {
  AuthApiService(
    this._mockClearmindAppServerApiClient,
  );

  final MockClearmindAppServerApiClient _mockClearmindAppServerApiClient;

  Future<SimpleDataResponse<String>?> verify({
    required String username,
    required String code,
  }) async {
    return _mockClearmindAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/verify',
      body: {
        'username': username,
        'code': code,
        'type': 'email',
      },
      decoder: (json) => json as String,
    );
  }

  Future<SimpleDataResponse<Null>?> sendCode({
    required String username,
  }) async {
    return _mockClearmindAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/send-code',
      body: {
        'username': username,
      },
    );
  }
}
