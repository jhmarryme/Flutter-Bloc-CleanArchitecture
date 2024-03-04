import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart' as archetypeDomain;
import '../di/di.dart' as di;

class DomainConfig extends Config {
  factory DomainConfig.getInstance() {
    return _instance;
  }

  DomainConfig._();

  static final DomainConfig _instance = DomainConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
    archetypeDomain.configureInjection();
  }
}
