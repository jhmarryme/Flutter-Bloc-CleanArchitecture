import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_state.freezed.dart';

@freezed
class MyPageState extends BaseBlocState with _$MyPageState {
  const MyPageState._();

  const factory MyPageState({
    @Default('') String id,
  }) = _MyPageState;
}
