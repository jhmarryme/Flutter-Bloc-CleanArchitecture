import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_clearmind_archetype_data/data.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import '../../../../../data.dart';

@LazySingleton()
class AuthAppServerApiClient extends RestApiClient {
  AuthAppServerApiClient(
    HeaderInterceptor _headerInterceptor,
    AccessTokenInterceptor _accessTokenInterceptor,
    RefreshTokenInterceptor _refreshTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.appApiBaseUrl),
            interceptors: [
              _headerInterceptor,
              _accessTokenInterceptor,
              _refreshTokenInterceptor,
            ],
          ),
        );
}
