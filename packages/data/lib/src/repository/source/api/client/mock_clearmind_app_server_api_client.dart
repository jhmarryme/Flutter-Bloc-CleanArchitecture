import 'package:dio/dio.dart';
import 'package:flutter_clearmind_archetype_data/data.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class MockClearmindAppServerApiClient extends RestApiClient {
  MockClearmindAppServerApiClient(
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

// /// 使用自定义的解析器
// @override
// Future<T?> handleResponse<D extends Object, T extends Object>(
//   Response<dynamic> response,
//   Decoder<D>? decoder,
//   SuccessResponseMapperType successResponseMapperType,
// ) async {
//   return MyBaseSuccessResponseMapper<D, T>.fromType(successResponseMapperType)
//       .map(response: response.data, decoder: decoder);
// }
//
// @override
// void handleError(
//     ErrorResponseMapperType errorResponseMapperType, Object error) {
//   throw DioExceptionMapper(
//     MyBaseErrorResponseMapper.fromType(errorResponseMapperType),
//   ).map(error);
// }
}
