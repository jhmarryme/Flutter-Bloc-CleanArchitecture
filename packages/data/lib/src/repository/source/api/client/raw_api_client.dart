import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_clearmind_archetype_data/data.dart';

@LazySingleton()
class RawApiClient extends RestApiClient {
  RawApiClient()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: ''),
          ),
        );
}
