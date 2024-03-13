import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_detail_state.freezed.dart';

@freezed
class ItemDetailState extends BaseBlocState with _$ItemDetailState {
  const factory ItemDetailState({
    @Default('') String id,
  }) = _ItemDetailState;
}
