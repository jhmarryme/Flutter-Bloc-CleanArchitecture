import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'main_state.freezed.dart';

@freezed
class MainState extends BaseBlocState with _$MainState {
  const factory MainState({
    @Default('') String id,
  }) = _MainState;
}
