import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:injectable/injectable.dart';
import 'package:resources/resources.dart';

import '../../app.dart';

@LazySingleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo appRouteInfo, AppNavigator navigator) {
    return appRouteInfo.when(
      confirmDialog: (message, onPressed) {
        return CommonDialog(
          actions: [
            PopupButton(
              text: S.current.ok,
              onPressed: Func0(() async {
                navigator.closeDialog(appRouteInfo);
                (onPressed ?? Func0(() => navigator.pop())).call();
              }),
            ),
          ],
          message: message,
        );
      },
      errorWithRetryDialog: (message, onRetryPressed) {
        return CommonDialog(
          actions: [
            PopupButton(
              text: S.current.cancel,
              onPressed: Func0(() async {
                navigator.closeDialog(appRouteInfo);
                navigator.pop();
              }),
            ),
            PopupButton(
              text: S.current.retry,
              onPressed: Func0(() async {
                navigator.closeDialog(appRouteInfo);
                (onRetryPressed ?? Func0(() => navigator.pop())).call();
              }),
              isDefault: true,
            ),
          ],
          message: message,
        );
      },
      requiredLoginDialog: () => CommonDialog.adaptive(
        title: S.current.login,
        message: S.current.login,
        actions: [
          PopupButton(
            text: S.current.cancel,
            onPressed: Func0(() async {
              navigator.closeDialog(appRouteInfo);
              navigator.pop();
            }),
          ),
          PopupButton(
            text: S.current.login,
            onPressed: Func0(() async {
              navigator.closeDialog(appRouteInfo);
              navigator.pop();
              await navigator.push(
                  const AppRouteInfo(name: NavigationConstants.loginName));
            }),
          ),
        ],
      ),
    );
  }
}
