import 'package:flutter_clearmind_archetype_data/data.dart';

import 'my_data_json_object_response_mapepr.dart';

/// 拓展自己的数据格式, 通过重写RestApiClient#defaultResponseHandler调用
abstract class MyBaseSuccessResponseMapper<I extends Object, O extends Object>
    extends BaseSuccessResponseMapper<I, O> {
  const MyBaseSuccessResponseMapper();

  factory MyBaseSuccessResponseMapper.fromType(
      SuccessResponseMapperTypeExtension type) {
    switch (type) {
      /// 自定义的数据结构映射解析, MyDataResponse
      case SuccessResponseMapperTypeExtension.extension1 :
        return MyDataJsonObjectResponseMapper<I>() as MyBaseSuccessResponseMapper<I, O>;
      default:
        return throw UnimplementedError();
    }
  }
}
