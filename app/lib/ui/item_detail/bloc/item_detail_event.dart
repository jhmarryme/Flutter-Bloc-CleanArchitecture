import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'item_detail_event.freezed.dart';

abstract class ItemDetailEvent extends BaseBlocEvent {
  const ItemDetailEvent();
}

@freezed
class ItemDetailPageInitiated extends ItemDetailEvent with _$ItemDetailPageInitiated {
  const factory ItemDetailPageInitiated({
    required int id,
  }) = _ItemDetailPageInitiated;
}
