import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:go_router/go_router.dart';

import '../../app.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'rootNavigator');
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'homeNavigator');
final searchNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'searchNavigator');
final myPageNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'myPageNavigator');
final profileShellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'profileShellNavigator');

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: NavigationConstants.homePath,
  debugLogDiagnostics: true,
  observers: [NavigatorObserver()],
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          MainPage(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: NavigationConstants.homePath,
              name: NavigationConstants.homeName,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: searchNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: NavigationConstants.searchPath,
              name: NavigationConstants.searchName,
              builder: (context, state) => const SearchIndexPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: myPageNavigatorKey,
          routes: <RouteBase>[
            ShellRoute(
              navigatorKey: profileShellNavigatorKey,
              builder: (context, state, child) => PlaceholderRootView(
                fixedContent: const MyPageIndexPage(),
                dynamicContent: child,
              ),
              routes: [
                GoRoute(
                  path: NavigationConstants.myPagePath,
                  name: NavigationConstants.myPageName,
                  builder: (context, state) => const PlaceholderOrNotWidget(
                    widget: MyPageIndexPage(),
                  ),
                ),
                GoRoute(
                  path: NavigationConstant.myPageOtpPath,
                  name: NavigationConstant.myPageOtpName,
                  builder: (context, state) => OtpPage(
                    username:
                    state.pathParameters[NavigationConstant.usernamePathParam] ??
                        '',
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: NavigationConstants.loginPath,
      name: NavigationConstants.loginName,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: NavigationConstants.itemDetailPath,
      name: NavigationConstants.itemDetailName,
      builder: (context, state) => ItemDetailPage(
        user: User.fromJson(
          state.extra is Map<String, dynamic>
              ? state.extra as Map<String, dynamic>
              : {},
        ),
        userId: state.pathParameters[NavigationConstants.userIdPathParam] ?? '',
        email: state.uri.queryParameters[NavigationConstants.emailQueryParam] ??
            '',
      ),
      // redirect: (context, state) => GetIt.instance.get<RouteGuard>().redirect(context, state),
    ),
    GoRoute(
      path: NavigationConstant.otpPath,
      name: NavigationConstant.otpName,
      builder: (context, state) => OtpPage(
        username:
            state.pathParameters[NavigationConstant.usernamePathParam] ??
                '',
      ),
    ),
  ],
);
