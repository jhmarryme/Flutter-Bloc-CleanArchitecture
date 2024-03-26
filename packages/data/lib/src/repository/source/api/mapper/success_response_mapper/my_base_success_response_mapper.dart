import 'package:flutter_clearmind_archetype_data/data.dart';

import 'my_data_json_object_response_mapepr.dart';

/// 拓展自己的数据格式, 通过重写RestApiClient#defaultResponseHandler调用
abstract class MyBaseSuccessResponseMapper<I extends Object, O extends Object>
    extends BaseSuccessResponseMapper<I, O> {
  const MyBaseSuccessResponseMapper();

  factory MyBaseSuccessResponseMapper.fromType(SuccessResponseMapperType type) {
    return switch (type) {
      /// 自定义的数据结构映射解析
      SuccessResponseMapperType.dataJsonObject =>
        MyDataJsonObjectResponseMapper<I>()
            as MyBaseSuccessResponseMapper<I, O>,
      // TODO: Handle this case.
      SuccessResponseMapperType.dataJsonArray => throw UnimplementedError(),
      // TODO: Handle this case.
      SuccessResponseMapperType.jsonObject => throw UnimplementedError(),
      // TODO: Handle this case.
      SuccessResponseMapperType.jsonArray => throw UnimplementedError(),
      // TODO: Handle this case.
      SuccessResponseMapperType.recordsJsonArray => throw UnimplementedError(),
      // TODO: Handle this case.
      SuccessResponseMapperType.resultsJsonArray => throw UnimplementedError(),
      // TODO: Handle this case.
      SuccessResponseMapperType.plain => throw UnimplementedError(),
      // TODO: Handle this case.
      SuccessResponseMapperType.simpleJsonObject => throw UnimplementedError(),
    };
  }
}
