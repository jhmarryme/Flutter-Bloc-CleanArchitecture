import 'package:flutter_clearmind_archetype_data/data.dart';

import 'json_object_error_response_mapper.dart';

/// 拓展自己的数据格式, 通过重写RestApiClient#defaultErrorHandler调用
abstract class MyBaseErrorResponseMapper<T extends Object>
    extends BaseErrorResponseMapper<T> {
  const MyBaseErrorResponseMapper();

  factory MyBaseErrorResponseMapper.fromType(
      ErrorResponseMapperTypeExtension type) {
    switch (type) {
      case ErrorResponseMapperTypeExtension.extension1:
        return MyJsonObjectErrorResponseMapper() as MyBaseErrorResponseMapper<T>;
      default:
        return throw UnimplementedError();
    }
  }
}
