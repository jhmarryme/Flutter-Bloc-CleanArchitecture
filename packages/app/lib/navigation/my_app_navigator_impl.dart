import 'package:domain/domain.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:injectable/injectable.dart';

import '../app.dart';

@LazySingleton(as: MyAppNavigator)
class MyAppNavigatorImpl extends AppNavigatorImpl with LogMixin {
  MyAppNavigatorImpl(super.appPopupInfoMapper);
}
