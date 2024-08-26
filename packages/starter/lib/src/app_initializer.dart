import 'package:app/app.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

class AppInitializer {
  AppInitializer();

  Future<void> init() async {
    usePathUrlStrategy();
    EnvConstants.init();
    await SharedConfig.getInstance().init();
    await DataConfig.getInstance().init();
    await DomainConfig.getInstance().init();
    await AppConfig.getInstance().init();
  }
}
