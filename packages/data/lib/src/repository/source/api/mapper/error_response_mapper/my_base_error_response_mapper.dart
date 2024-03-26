import 'package:flutter_clearmind_archetype_data/data.dart';

import 'json_object_error_response_mapper.dart';

/// 拓展自己的数据格式, 通过重写RestApiClient#defaultErrorHandler调用
abstract class MyBaseErrorResponseMapper<T extends Object>
    extends BaseErrorResponseMapper<T> {
  const MyBaseErrorResponseMapper();

  factory MyBaseErrorResponseMapper.fromType(ErrorResponseMapperType type) {
    return switch (type) {
      ErrorResponseMapperType.jsonObject =>
        MyJsonObjectErrorResponseMapper() as MyBaseErrorResponseMapper<T>,
      // TODO: Handle this case.
      ErrorResponseMapperType.jsonArray => throw UnimplementedError(),
      // TODO: Handle this case.
      ErrorResponseMapperType.line => throw UnimplementedError(),
      // TODO: Handle this case.
      ErrorResponseMapperType.twitter => throw UnimplementedError(),
      // TODO: Handle this case.
      ErrorResponseMapperType.goong => throw UnimplementedError(),
      // TODO: Handle this case.
      ErrorResponseMapperType.firebaseStorage => throw UnimplementedError(),
      // TODO: Handle this case.
      ErrorResponseMapperType.simpleJsonObject => throw UnimplementedError(),
    };
  }
}
