import 'package:flutter_clearmind_archetype_app/app.dart';
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
