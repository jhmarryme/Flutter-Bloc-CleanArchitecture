import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_clearmind_archetype_shared/shared.dart';

import 'package:flutter_clearmind_archetype_data/data.dart';

@LazySingleton()
class NoneAuthAppServerApiClient extends RestApiClient {
  NoneAuthAppServerApiClient(HeaderInterceptor _headerInterceptor)
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.appApiBaseUrl),
            interceptors: [
              _headerInterceptor,
            ],
          ),
        );
}
