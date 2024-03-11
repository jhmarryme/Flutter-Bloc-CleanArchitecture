import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../data.dart';

@LazySingleton(as: AppRepository)
class RepositoryImpl implements AppRepository {
  RepositoryImpl(
    this._appPreferences,
    this._languageCodeDataMapper,
  );

  final AppPreferences _appPreferences;
  final LanguageCodeDataMapper _languageCodeDataMapper;

  @override
  bool get isLoggedIn => _appPreferences.isLoggedIn;

  @override
  bool get isDarkMode => _appPreferences.isDarkMode;

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
  Future<bool> saveIsDarkMode(bool isDarkMode) =>
      _appPreferences.saveIsDarkMode(isDarkMode);
}
