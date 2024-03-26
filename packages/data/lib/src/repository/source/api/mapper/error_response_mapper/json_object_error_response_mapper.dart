import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:injectable/injectable.dart';

import 'my_base_error_response_mapper.dart';

@Injectable()
class MyJsonObjectErrorResponseMapper
    extends MyBaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? data) {
    return ServerError(
      generalServerStatusCode: data?['code'] as int?,
      generalMessage: data?['msg'] as String?,
    );
  }
}
