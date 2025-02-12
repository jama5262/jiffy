import 'package:intl/intl.dart';

import '../locale/ordinals.dart';
import '../utils/jiffy_exception.dart';

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
};

Ordinals? _defaultOrdinals;

set defaultOrdinals(Ordinals? ordinals) {
  _defaultOrdinals = ordinals;
}

Ordinals getOrdinals(String locale) {
  if (_defaultOrdinals != null) {
    return _defaultOrdinals!;
  } else {
    final ordinals = _builtInOrdinals[Intl.shortLocale(locale)];
    if (ordinals == null) {
      throw JiffyException("Locale `$locale` is not supported for ordinals.");
    }
    return ordinals;
  }
}
