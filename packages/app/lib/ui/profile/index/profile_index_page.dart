import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:flutter_clearmind_widget_external/widgets/drop_down/my_dorpdown_widget.dart';
import 'package:resources/resources.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/index.dart';

class ProfileIndexPage extends StatefulWidget {
  const ProfileIndexPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileIndexPageState();
}

class _ProfileIndexPageState
    extends BasePageState<ProfileIndexPage, IndexBloc> {
  final TextStyle headerStyle = TextStyle(
    color: Colors.grey.shade800,
    fontWeight: FontWeight.bold,
    fontSize: Dimens.d20.responsive(),
  );
  final Divider divider = Divider(
    height: 0.5,
    thickness: 0.5,
    color: AppColors.current.secondaryTextColor,
  );

  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(Dimens.d10.responsive()),
          child: Column(
            children: [
              Text("ACCOUNT", style: headerStyle),
              const SizedBox(height: 10.0),
              Card(
                elevation: 0.5,
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Assets.images.appLogo.svg(),
                      ),
                      title: const Text("Kuria Maindo"),
                      onTap: () {},
                    ),
                    divider,
                    SwitchListTile(
                      activeColor: Colors.purple,
                      value: true,
                      title: const Text("Private Account"),
                      onChanged: (val) {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Text("PUSH NOTIFICATIONS", style: headerStyle),
              const SizedBox(height: 20.0),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                child: Column(
                  children: <Widget>[
                    SwitchListTile(
                      activeColor: Colors.purple,
                      value: true,
                      title: const Text("Received notification"),
                      onChanged: (val) {},
                    ),
                    divider,
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) =>
                          previous.isDarkTheme != current.isDarkTheme,
                      builder: (context, state) {
                        return SwitchListTile.adaptive(
                          title: Text(
                            S.current.darkTheme,
                            style: AppTextStyles.s14w400Primary(),
                          ),
                          tileColor: AppColors.current.primaryColor,
                          value: state.isDarkTheme,
                          onChanged: (isDarkTheme) => appBloc.add(
                            AppThemeChanged(isDarkTheme: isDarkTheme),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<AppBloc, AppState>(
                      buildWhen: (previous, current) =>
                          previous.languageCode != current.languageCode,
                      builder: (context, state) {
                        return SwitchListTile.adaptive(
                          title: Text(
                            S.current.japanese,
                            style: AppTextStyles.s14w400Primary(),
                          ),
                          tileColor: AppColors.current.primaryColor,
                          value: state.languageCode == LanguageCode.ja,
                          onChanged: (isJa) => appBloc.add(
                            AppLanguageChanged(
                                languageCode:
                                    isJa ? LanguageCode.ja : LanguageCode.en),
                          ),
                        );
                      },
                    ),
                    divider,
                    SwitchListTile(
                      activeColor: Colors.purple,
                      value: true,
                      title: const Text("Received Offer Notification"),
                      onChanged: (val) {},
                    ),
                    divider,
                    const SwitchListTile(
                      activeColor: Colors.purple,
                      value: true,
                      title: Text("Received App Updates"),
                      onChanged: null,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
