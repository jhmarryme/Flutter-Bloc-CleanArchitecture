import 'package:data/src/repository/source/api/model/api_simple_user_data.dart';
import 'package:flutter_clearmind_archetype_data/data.dart';
import 'package:injectable/injectable.dart';

import '../../../../data.dart';

@LazySingleton()
class ClearmindApiService {
  ClearmindApiService(
    this._mockClearmindAppServerApiClient,
  );

  final MockClearmindAppServerApiClient _mockClearmindAppServerApiClient;

  Future<PagingDataResponse<ApiSimpleUserData>?> pageUser({
    required int page,
    required int size,
  }) async {
    return _mockClearmindAppServerApiClient.request(
      method: RestMethod.post,
      path: '/v1/order/order',
      body: {
        'page': page,
        'size': size,
      },
      successResponseMapperType: SuccessResponseMapperType.pagingDataObject,
      decoder: (json) {
        return ApiSimpleUserData.fromJson(json as Map<String, dynamic>);
      },
    );
  }
}
