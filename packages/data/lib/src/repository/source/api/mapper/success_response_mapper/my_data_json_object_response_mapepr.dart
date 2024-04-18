import 'package:data/src/repository/source/api/model/base/data_response.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';

import 'my_base_success_response_mapper.dart';

/// 自定义数据结构的解析器
/// 如果使用该解析器, 调用方的期望数据格式 不要写错! MyDataResponse
/*
{
	"code": 200,
	"msg": "",
	"data": "fake-token-1"
}
 */
class MyDataJsonObjectResponseMapper<T extends Object>
    extends MyBaseSuccessResponseMapper<T, MyDataResponse<T>> {
  @override
  // ignore: avoid-dynamic
  MyDataResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? MyDataResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
