import 'package:data/src/repository/source/api/model/base/data_response.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';

import 'my_base_success_response_mapper.dart';

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
