import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:resources/resources.dart';

import '../../../app.dart';
import 'bloc/my_page_index.dart';

class MyPageIndexPage extends StatefulWidget {
  const MyPageIndexPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyPageIndexPageState();
  }
}

class _MyPageIndexPageState
    extends BasePageState<MyPageIndexPage, MyPageIndexBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("ACCOUNT", style: AppTextStyles.s18wBoldGrey()),
              const SizedBox(height: 10.0),
              Card(
                elevation: 0.5,
                margin: EdgeInsets.symmetric(
                    vertical: Dimens.d5.responsive(), horizontal: 0),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Assets.images.appLogo.svg(),
                      ),
                      title: Text(
                        "Kuria Maindo",
                        style: AppTextStyles.s14w400Primary(),
                      ),
                      onTap: () {},
                    ),
                    DividerStyle.divider1Half,
                    SwitchListTile(
                      value: true,
                      title: Text("Private Account",
                          style: AppTextStyles.s14w400Primary()),
                      onChanged: (val) {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: Dimens.d15.responsive()),
              Text("PUSH NOTIFICATIONS", style: AppTextStyles.s18wBoldGrey()),
              SizedBox(height: Dimens.d15.responsive()),
              Card(
                margin: EdgeInsets.symmetric(
                    vertical: Dimens.d5.responsive(), horizontal: 0),
                child: DefaultTextStyle(
                  style: AppTextStyles.s14w400Primary(),
                  child: Column(
                    children: [
                      SwitchListTile(
                        value: true,
                        title: Text("Received notification",
                            style: AppTextStyles.s14w400Primary()),
                        onChanged: (val) {},
                      ),
                      DividerStyle.divider1Half,
                      SwitchListTile(
                        value: true,
                        title: Text("Received Offer Notification",
                            style: AppTextStyles.s14w400Primary()),
                        onChanged: (val) {},
                      ),
                      DividerStyle.divider1Half,
                      SwitchListTile(
                        value: true,
                        title: Text("Received App Updates",
                            style: AppTextStyles.s14w400Primary()),
                        onChanged: null,
                      ),
                      DividerStyle.divider1Half,
                      BlocBuilder<AppBloc, AppState>(
                        buildWhen: (previous, current) =>
                            previous.isDarkTheme != current.isDarkTheme,
                        builder: (context, state) {
                          return SwitchListTile.adaptive(
                            title: Text(S.current.darkTheme,
                                style: AppTextStyles.s14w400Primary()),
                            value: state.isDarkTheme,
                            onChanged: (isDarkTheme) => appBloc.add(
                              AppThemeChanged(isDarkTheme: isDarkTheme),
                            ),
                          );
                        },
                      ),
                      DividerStyle.divider1Half,
                      BlocBuilder<AppBloc, AppState>(
                        buildWhen: (previous, current) =>
                            previous.languageCode != current.languageCode,
                        builder: (context, state) {
                          return SwitchListTile.adaptive(
                            title: Text(S.current.japanese,
                                style: AppTextStyles.s14w400Primary()),
                            value: state.languageCode == LanguageCode.ja,
                            onChanged: (isJa) => appBloc.add(
                              AppLanguageChanged(
                                  languageCode:
                                      isJa ? LanguageCode.ja : LanguageCode.en),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Dimens.d15.responsive()),
              ElevatedButton(
                onPressed: () => bloc.add(const LogoutButtonPressed()),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.current.primaryColor),
                ),
                child: Text(S.current.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
