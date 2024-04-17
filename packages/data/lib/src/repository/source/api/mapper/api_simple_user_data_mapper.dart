import 'package:data/src/repository/source/api/model/api_simple_user_data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class ApiSimpleUserDataMapper
    extends BaseDataMapper<ApiSimpleUserData, SimpleUser> {
  ApiSimpleUserDataMapper();

  @override
  SimpleUser mapToEntity(ApiSimpleUserData? data) {
    return SimpleUser(
      id: data?.id ?? SimpleUser.defaultId,
      name: data?.name ?? SimpleUser.defaultName,
      age: data?.age ?? SimpleUser.defaultAge,
    );
  }
}
