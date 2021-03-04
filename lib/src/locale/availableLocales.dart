import 'package:jiffy/src/locale/enLocale.dart';
import 'package:jiffy/src/locale/locale.dart';

Map<String, Locale> _availableLocales = {
  'en': EnLocale(),
  'en-sg': EnLocale(),
  'fr': EnLocale()
};

Locale getLocale(String locale) {
  return _availableLocales[locale]!;
}

bool isLocalAvailable(String locale) {
  return !_availableLocales.containsKey(locale.toLowerCase());
}