import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_index_event.freezed.dart';

abstract class ProfileIndexEvent extends BaseBlocEvent {
  const ProfileIndexEvent();
}

@freezed
class ProfileIndexInitiated extends ProfileIndexEvent with _$ProfileIndexInitiated {
  const factory ProfileIndexInitiated() = _ProfileIndexInitiated;
}
