import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_widget_external/widgets.dart';

import '../../app.dart';
import 'bloc/search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends BasePageState<SearchPage, SearchBloc> {
  @override
  Widget buildPage(BuildContext context) {
    // return CommonScaffold(
    //   body: Center(
    //     child: ElevatedButton(
    //       style: ButtonStyle(
    //         backgroundColor: MaterialStateProperty.all(AppColors.current.primaryColor),
    //       ),
    //       onPressed: () {
    //         navigator.push(AppRouteInfo.login(), useRootNavigator: true);
    //       },
    //       child: Text(
    //         S.current.login,
    //         style: AppTextStyles.s14w400Primary(),
    //       ),
    //     ),
    //   ),
    // );
    return CommonScaffold(
      body: EasyRefreshComponent<SimpleUser>(
        controller: CustomEasyRefreshController(
          dataLoader: (PageRequestEntity request) async {
            final completer = Completer<PagingDataEntity<SimpleUser>>();
            bloc.add(SearchButtonPressed(
              page: request.page!,
              completer: completer,
            ));
            return await completer.future;
          }
        ),
        enableScrollListener: false,
        itemBuilder: (user) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.d8.responsive(),
              vertical: Dimens.d4.responsive(),
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.current.primaryColor,
                borderRadius: BorderRadius.circular(Dimens.d8.responsive()),
              ),
              width: double.infinity,
              height: Dimens.d160.responsive(),
              child: Text(
                user.name,
                style: AppTextStyles.s14w400Primary(),
              ),
            ),
          );
        },
      ),
    );
  }
}
