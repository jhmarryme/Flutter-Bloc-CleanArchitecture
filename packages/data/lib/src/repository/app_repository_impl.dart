import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: AppRepository)
class RepositoryImpl implements AppRepository {
  RepositoryImpl(
    this._appPreferences,
    this._languageCodeDataMapper,
    this._themeCodeDataMapper,
  );

  final AppPreferences _appPreferences;
  final LanguageCodeDataMapper _languageCodeDataMapper;
  final ThemeModeCodeDataMapper _themeCodeDataMapper;

  @override
  bool get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  ThemeModeCode get themeModeCode =>
      _themeCodeDataMapper.mapToEntity(_appPreferences.themeModeCode);

  @override
  LanguageCode get languageCode =>
      _languageCodeDataMapper.mapToEntity(_appPreferences.languageCode);

  @override
  Future<void> clearCurrentUserData() => _appPreferences.clearCurrentUserData();

  @override
  Future<bool> saveLanguageCode(LanguageCode languageCode) {
    return _appPreferences
        .saveLanguageCode(_languageCodeDataMapper.mapToData(languageCode));
  }

  @override
  Future<bool> saveThemeModeCode(ThemeModeCode themeModeCode) => _appPreferences
      .saveThemeModeCode(_themeCodeDataMapper.mapToData(themeModeCode));
}
