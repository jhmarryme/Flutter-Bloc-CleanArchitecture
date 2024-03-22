import 'package:flutter_clearmind_archetype_data/data.dart';
import 'package:injectable/injectable.dart';

import '../../../../data.dart';
import 'model/base/data_response.dart' as model;

@LazySingleton()
class AuthApiService {
  AuthApiService(
      this._mockAuthAppServerApiClient,
      );
  final MockAuthAppServerApiClient _mockAuthAppServerApiClient;

  Future<model.DataResponse<String>?> verify({
    required String username,
    required String code,
  }) async {
    return _mockAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/verify',
      body: {
        'username': username,
        'code': code,
        'type': 'email'
      },
      decoder: (json) => json as String,
    );
  }

  Future<model.DataResponse<Null>?> sendCode({
    required String username,
  }) async {
    return _mockAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/auth/send-code',
      body: {
        'username': username,
      },
    );
  }
}
