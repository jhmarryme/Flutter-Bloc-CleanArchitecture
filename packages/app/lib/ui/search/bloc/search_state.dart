import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState extends BaseBlocState with _$SearchState {
  const factory SearchState({
    @Default('') String id,
  }) = _SearchState;
}
