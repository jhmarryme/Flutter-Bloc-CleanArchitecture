import 'dart:async';

import 'package:app/app.dart';
import 'package:app/core/shared_view/card/flight_search_card.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_widget/widgets/color/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resources/resources.dart';

import 'bloc/search_index.dart';

class SearchIndexPage extends StatefulWidget {
  const SearchIndexPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchIndexPageState();
  }
}

class _SearchIndexPageState
    extends BasePageState<SearchIndexPage, SearchIndexBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return CommonScaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: 25.spMin, vertical: 15.spMin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 文字区域
              FittedBox(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomLeft,
                  width: 200,
                  height: 90,
                  child: Text(
                    S.current.search_searchIndexTitle,
                    style: const TextStyle(
                        fontSize: 28, color: ColorStyle.kGrey600),
                  ),
                ),
              ),
              FlightSearchCard(
                itemSearchFunction: (keyword) {
                  final completer = Completer<List<FlightSearchCity>>();
                  bloc.add(SearchCityTrigger(
                    keyword: keyword,
                    completer: completer,
                  ));
                  return completer.future;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
