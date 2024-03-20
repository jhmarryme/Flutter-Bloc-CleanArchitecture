import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_index_state.freezed.dart';

@freezed
class MyPageIndexState extends BaseBlocState with _$MyPageIndexState {
  const MyPageIndexState._();

  const factory MyPageIndexState({
    @Default('') String id,
  }) = _MyPageIndexState;
}
