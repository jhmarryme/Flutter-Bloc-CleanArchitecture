import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_clearmind_archetype_shared/shared.dart';

import 'package:flutter_clearmind_archetype_data/data.dart';

@LazySingleton()
class RandomUserApiClient extends RestApiClient {
  RandomUserApiClient()
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.randomUserBaseUrl),
          ),
        );
}
