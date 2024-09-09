import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:flutter_clearmind_archetype_data/data.dart' as archetypeData;

import '../di/di.dart' as di;

class DataConfig extends Config {
  DataConfig._();

  factory DataConfig.getInstance() {
    return _instance;
  }

  static final DataConfig _instance = DataConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
    archetypeData.configureInjection();
  }
}
