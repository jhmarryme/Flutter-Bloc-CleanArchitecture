
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_resource/resources.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:resources/resources.dart' as appResources;
import 'package:flutter_clearmind_archetype_shared/shared.dart';

import '../app.dart';

class MyApp extends StatefulWidget {
  const MyApp({required this.initialResource, super.key});

  final LoadInitialResourceOutput initialResource;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BasePageState<MyApp, AppBloc> {
  @override
  bool get isAppWidget => true;

  @override
  void initState() {
    super.initState();
    bloc.add(const AppInitiated());
  }

  @override
  Widget buildPage(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(DeviceConstants.designDeviceWidth, DeviceConstants.designDeviceHeight),
      builder: (context, _) => BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) =>
            previous.isDarkTheme != current.isDarkTheme ||
            previous.languageCode != current.languageCode,
        builder: (context, state) {
          return MaterialApp.router(
            builder: (context, child) {
              final MediaQueryData data = MediaQuery.of(context);

              return MediaQuery(
                data: data.copyWith(textScaleFactor: 1.0),
                child: child ?? const SizedBox.shrink(),
              );
            },
            routerConfig: router,
            // routerDelegate: router.routerDelegate,
            // routeInformationParser: router.routeInformationParser,
            // routeInformationProvider: router.routeInformationProvider,
            title: UiConstants.materialAppTitle,
            color: UiConstants.taskMenuMaterialAppColor,
            themeMode: state.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) =>
                supportedLocales.contains(locale)
                    ? locale
                    : const Locale(LocaleConstants.defaultLocale),
            locale: Locale(state.languageCode.localeCode),
            supportedLocales: appResources.S.delegate.supportedLocales,
            localizationsDelegates: [
              appResources.AppResourceLocalizations.delegate,
              ClearmindArchetypeResourceLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
