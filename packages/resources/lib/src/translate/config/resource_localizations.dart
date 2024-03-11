import 'package:flutter/material.dart';

import '../../../resources.dart';
import '../generated/intl/messages_all.dart';
import 'delegate.dart';

class AppResourceLocalizations {
  /// Delegate.
  static TranslateLocalizationsDelegate<S> delegate =
      TranslateLocalizationsDelegate(
    isLocaleSupported: S.delegate.isSupported,
    initializeMessages: initializeMessages,
    builder: (locale) async {
      await S.load(Locale(locale));
      return S();
    },
  );
}
