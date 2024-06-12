import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_index_state.freezed.dart';

@freezed
class SearchIndexState extends BaseBlocState with _$SearchIndexState {
  const factory SearchIndexState({
    @Default(1) int current,
  }) = _SearchIndexState;
}
