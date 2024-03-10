import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart' as archetypeApp;
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:initializer/initializer.dart';

import '../app.dart';
import '../di/di.dart' as di;

class AppConfig extends ApplicationConfig {
  factory AppConfig.getInstance() {
    return _instance;
  }

  AppConfig._();

  static final AppConfig _instance = AppConfig._();

  @override
  Future<void> config() async {
    di.configureInjection();
    archetypeApp.configureInjection();
    Bloc.observer = archetypeApp.AppBlocObserver();
    await ViewUtils.setPreferredOrientations(
        DeviceUtils.deviceType == DeviceType.mobile
            ? UiConstants.mobileOrientation
            : UiConstants.tabletOrientation);
    ViewUtils.setSystemUIOverlayStyle(UiConstants.systemUiOverlay);
    await LocalPushNotificationHelper.init();
  }
}
