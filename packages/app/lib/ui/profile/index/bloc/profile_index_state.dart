import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_index_state.freezed.dart';

@freezed
class ProfileIndexState extends BaseBlocState with _$ProfileIndexState {
  const ProfileIndexState._();

  const factory ProfileIndexState({
    @Default('') String id,
  }) = _ProfileIndexState;
}
