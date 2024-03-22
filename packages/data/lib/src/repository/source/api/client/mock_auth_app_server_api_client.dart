import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_clearmind_archetype_data/data.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import '../../../../../data.dart';

@LazySingleton()
class MockAuthAppServerApiClient extends RestApiClient {
  MockAuthAppServerApiClient(
    HeaderInterceptor _headerInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl:
                  'https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc',
            ),
            interceptors: [
              _headerInterceptor,
            ],
          ),
        );
}
