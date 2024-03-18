import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'index_event.freezed.dart';

abstract class IndexEvent extends BaseBlocEvent {
  const IndexEvent();
}

@freezed
class IndexInitiated extends IndexEvent with _$IndexInitiated {
  const factory IndexInitiated() = _IndexInitiated;
}
