import 'package:dartx/dartx.dart';
import 'package:data/data.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:injectable/injectable.dart';


@Injectable()
class ThemeModeCodeDataMapper extends BaseDataMapper<int, ThemeModeCode>
    with DataMapperMixin {
  @override
  ThemeModeCode mapToEntity(int? data) {
    return ThemeModeCode.values
            .firstOrNullWhere((element) => element.serverValue == data) ??
        ThemeModeCode.defaultValue;
  }

  @override
  int mapToData(ThemeModeCode entity) {
    return entity.serverValue;
  }
}
