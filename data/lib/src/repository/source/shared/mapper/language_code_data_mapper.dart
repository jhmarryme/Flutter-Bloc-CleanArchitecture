import 'package:dartx/dartx.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class LanguageCodeDataMapper extends BaseDataMapper<String, LanguageCode> with DataMapperMixin {
  @override
  LanguageCode mapToEntity(String? data) {
    return LanguageCode.values.firstOrNullWhere((element) => element.serverValue == data) ??
        LanguageCode.defaultValue;
  }

  @override
  String mapToData(LanguageCode entity) {
    return entity.serverValue;
  }
}
