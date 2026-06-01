import '../utils/verify_locale.dart';
import '../locale/ordinals.dart';

Map<String, Ordinals> _builtInOrdinals = {
  'en': Ordinals(first: 'st', second: 'nd', third: 'rd', nth: 'th'),
  'es': Ordinals(first: 'º', second: 'º', third: 'º', nth: 'º'),
  'fr': Ordinals(first: 'er', second: '', third: '', nth: ''),
  'zh': Ordinals(first: '日', second: '日', third: '日', nth: '日'),
  'de': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'it': Ordinals(first: 'º', second: 'º', third: 'º', nth: 'º'),
  'ar': Ordinals(first: '', second: '', third: '', nth: ''),
  'az': Ordinals(first: '', second: '', third: '', nth: ''),
  'id': Ordinals(first: '', second: '', third: '', nth: ''),
  'ja': Ordinals(first: '日', second: '日', third: '日', nth: '日'),
  'ko': Ordinals(first: '일', second: '일', third: '일', nth: '일'),
  'ru': Ordinals(first: '', second: '', third: '', nth: ''),
  'uk': Ordinals(first: '', second: '', third: '', nth: ''),
  'hi': Ordinals(first: '', second: '', third: '', nth: ''),
  'hu': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'pt': Ordinals(first: 'º', second: 'º', third: 'º', nth: 'º'),
  'pl': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'tr': Ordinals(first: '', second: '', third: '', nth: ''),
  'sv': Ordinals(first: '', second: '', third: '', nth: ''),
  'nb': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'fa': Ordinals(first: 'م', second: 'م', third: 'م', nth: 'م'),
  'bn': Ordinals(first: '', second: '', third: '', nth: ''),
  'nl': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'th': Ordinals(first: '', second: '', third: '', nth: ''),
  'sk': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'cs': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'or': Ordinals(first: '', second: '', third: '', nth: ''),
  'pa': Ordinals(first: '', second: '', third: '', nth: ''),
  'mr': Ordinals(first: '', second: '', third: '', nth: ''),
  'si': Ordinals(first: '', second: '', third: '', nth: ''),
  'jv': Ordinals(first: '', second: '', third: '', nth: ''),
  'ms': Ordinals(first: '', second: '', third: '', nth: ''),
  'sw': Ordinals(first: '', second: '', third: '', nth: ''),
  'ta': Ordinals(first: '', second: '', third: '', nth: ''),
  'te': Ordinals(first: '', second: '', third: '', nth: ''),
  'kn': Ordinals(first: '', second: '', third: '', nth: ''),
  'ml': Ordinals(first: '', second: '', third: '', nth: ''),
  'vi': Ordinals(first: '', second: '', third: '', nth: ''),
  'yo': Ordinals(first: '', second: '', third: '', nth: ''),
  'ur': Ordinals(first: '', second: '', third: '', nth: ''),
  'gu': Ordinals(first: '', second: '', third: '', nth: ''),
  'ro': Ordinals(first: '', second: '', third: '', nth: ''),
  'uz': Ordinals(first: '', second: '', third: '', nth: ''),
  'am': Ordinals(first: '', second: '', third: '', nth: ''),
  'ha': Ordinals(first: '', second: '', third: '', nth: ''),
  'ig': Ordinals(first: '', second: '', third: '', nth: ''),
  'sn': Ordinals(first: '', second: '', third: '', nth: ''),
  'kk': Ordinals(first: '', second: '', third: '', nth: ''),
  'el': Ordinals(first: '', second: '', third: '', nth: ''),
  'tl': Ordinals(first: '', second: '', third: '', nth: ''),
  'he': Ordinals(first: '', second: '', third: '', nth: ''),
  'rw': Ordinals(first: '', second: '', third: '', nth: ''),
  'no': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
  'fi': Ordinals(first: '', second: '', third: '', nth: ''),
  'da': Ordinals(first: '', second: '', third: '', nth: ''),
  'lt': Ordinals(first: '', second: '', third: '', nth: ''),
  'sl': Ordinals(first: '', second: '', third: '', nth: ''),
  'hr': Ordinals(first: '', second: '', third: '', nth: ''),
  'ca': Ordinals(first: '', second: '', third: '', nth: ''),
  'sr': Ordinals(first: '', second: '', third: '', nth: ''),
  'bg': Ordinals(first: '', second: '', third: '', nth: ''),
  'ka': Ordinals(first: '', second: '', third: '', nth: ''),
  'et': Ordinals(first: '', second: '', third: '', nth: ''),
  'eu': Ordinals(first: '', second: '', third: '', nth: ''),
  'gl': Ordinals(first: '', second: '', third: '', nth: ''),
};

Ordinals? _defaultOrdinals;

set defaultOrdinals(Ordinals? ordinals) {
  _defaultOrdinals = ordinals;
}

Ordinals getOrdinals(String locale) {
  if (_defaultOrdinals != null) {
    return _defaultOrdinals!;
  } else {
    final supportedLocale = verifyLocale(locale,
        onLocaleExists: (localeExists) =>
            _builtInOrdinals.containsKey(localeExists),
        onFailureMessage: _onFailureMessageLocaleNotSupported);

    return _builtInOrdinals[supportedLocale.NAME]!;
  }
}

String _onFailureMessageLocaleNotSupported(String locale) {
  return "Locale `$locale` is not supported for ordinals.";
}
