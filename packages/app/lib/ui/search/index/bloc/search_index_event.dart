import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_widget_external/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_index_event.freezed.dart';

abstract class SearchIndexEvent extends BaseBlocEvent {
  const SearchIndexEvent();
}

@freezed
class SearchIndexPageInitiated extends SearchIndexEvent with _$SearchIndexPageInitiated {
  const factory SearchIndexPageInitiated({
    required String id,
  }) = _SearchIndexPageInitiated;
}

@freezed
class SearchButtonPressed extends SearchIndexEvent with _$SearchButtonPressed {
  const factory SearchButtonPressed({
    required int page,
    // 用于获取返回当前事件执行的结果, 返回一个验证成功或失败的bool值
    // required Completer<List<FlightSearchCity>?> completer,
  }) = _SearchButtonPressed;
}

@freezed
class SearchCityTrigger extends SearchIndexEvent with _$SearchCityTrigger {
  const factory SearchCityTrigger({
    required String keyword,
    // 用于获取返回当前事件执行的结果, 返回一个验证成功或失败的bool值
    required Completer<List<FlightSearchCity>?> completer,
  }) = _SearchCityTrigger;
}
