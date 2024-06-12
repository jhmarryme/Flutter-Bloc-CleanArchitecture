import 'package:dio/dio.dart';
import 'package:flutter_clearmind_archetype_data/data.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:injectable/injectable.dart';

import '../mapper/error_response_mapper/my_base_error_response_mapper.dart';
import '../mapper/success_response_mapper/my_base_success_response_mapper.dart';

@LazySingleton()
class MockClearmindAppServerApiClient extends RestApiClient {
  MockClearmindAppServerApiClient(
    HeaderInterceptor _headerInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(
              baseUrl:
                  'https://console-mock.apipost.cn/mock/e090c5f3-73d8-4738-b3d8-6beef69b00dc/',
            ),
            interceptors: [
              // _headerInterceptor,
            ],
          ),
        );

  /// 使用自定义的解析器
  @override
  Future<T?> handleResponseI<D extends Object, T extends Object>(
    Response<dynamic> response,
    Decoder<D>? decoder,
    SuccessResponseMapperTypeExtension successResponseMapperType,
  ) async {
    return MyBaseSuccessResponseMapper<D, T>.fromType(successResponseMapperType)
        .map(response: response.data, decoder: decoder);
  }

  /// 使用自定义的异常解析器
  @override
  void handleErrorI(
      ErrorResponseMapperTypeExtension errorResponseMapperType, Object error) {
    throw DioExceptionMapper(
      MyBaseErrorResponseMapper.fromType(errorResponseMapperType),
    ).map(error);
  }
}
