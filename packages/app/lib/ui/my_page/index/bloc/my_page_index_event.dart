import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'my_page_index_event.freezed.dart';

abstract class MyPageIndexEvent extends BaseBlocEvent {
  const MyPageIndexEvent();
}

@freezed
class MyPageIndexPageInitiated extends MyPageIndexEvent with _$MyPageIndexPageInitiated {
  const factory MyPageIndexPageInitiated({
    required int id,
  }) = _MyPageIndexPageInitiated;
}

@freezed
class LogoutButtonPressed extends MyPageIndexEvent with _$LogoutButtonPressed {
  const factory LogoutButtonPressed() = _LogoutButtonPressed;
}
