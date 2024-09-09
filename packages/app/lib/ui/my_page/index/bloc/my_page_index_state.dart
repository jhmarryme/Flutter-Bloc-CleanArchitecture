import 'package:flutter_clearmind_archetype_app/app.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:flutter_clearmind_archetype_resource/resources.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_page_index_state.freezed.dart';

@freezed
class MyPageIndexState extends BaseBlocState with _$MyPageIndexState {
  const MyPageIndexState._();


  Map<String, ThemeModeCode> get themeCodeMap => {
        ClearmindArchtypeS.current.themeModeCode_followSystem:
            ThemeModeCode.system,
        ClearmindArchtypeS.current.themeModeCode_dark: ThemeModeCode.dark,
        ClearmindArchtypeS.current.themeModeCode_light: ThemeModeCode.light,
      };

  Map<String, LanguageCode> get languageCodeMap => {
        ClearmindArchtypeS.current.multi_language_simplified_chinese:
            LanguageCode.zhCn,
        ClearmindArchtypeS.current.multi_language_traditional_chinese:
            LanguageCode.zhTw,
        ClearmindArchtypeS.current.multi_language_english: LanguageCode.en,
      };

  const factory MyPageIndexState({
    @Default('') String id,
  }) = _MyPageIndexState;
}
