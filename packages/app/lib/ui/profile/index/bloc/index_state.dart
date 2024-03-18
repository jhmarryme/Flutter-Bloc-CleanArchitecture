import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'index_state.freezed.dart';

@freezed
class IndexState extends BaseBlocState with _$IndexState {
  const IndexState._();

  const factory IndexState({
    @Default('') String id,
  }) = _IndexState;
}
