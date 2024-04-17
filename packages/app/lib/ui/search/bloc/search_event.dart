import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_widget_external/components/refresh/easy_refresh/base/paging_data_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

abstract class SearchEvent extends BaseBlocEvent {
  const SearchEvent();
}

@freezed
class SearchPageInitiated extends SearchEvent with _$SearchPageInitiated {
  const factory SearchPageInitiated({
    required String id,
  }) = _SearchPageInitiated;
}

@freezed
class SearchButtonPressed extends SearchEvent with _$SearchButtonPressed {
  const factory SearchButtonPressed({
    required int page,
    // 用于获取返回当前事件执行的结果, 返回一个验证成功或失败的bool值
    required Completer<PagingDataEntity<SimpleUser>> completer,
  }) = _SearchButtonPressed;
}
