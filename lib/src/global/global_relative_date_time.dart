import 'package:intl/intl.dart';

import '../locale/relative_date_time.dart';
import '../utils/jiffy_exception.dart';

Map<String, RelativeDateTime> _relativeDateTime = {
  'en': EnRelativeDateTime(),
  'es': EsRelativeDateTime(),
  'fr': FrRelativeDateTime(),
  'zh': ZhRelativeDateTime(),
  'zh_CN': ZhCnRelativeDateTime(),
  'de': DeRelativeDateTime(),
  'it': ItRelativeDateTime(),
  'ar': ArRelativeDateTime(true),
  'ar_LY': ArRelativeDateTime(false),
  'ar_DZ': ArSaMaDzKwTnRelativeDateTime(false),
  'ar_KW': ArSaMaDzKwTnRelativeDateTime(false),
  'ar_SA': ArSaMaDzKwTnRelativeDateTime(true),
  'ar_MA': ArSaMaDzKwTnRelativeDateTime(false),
  'ar_TN': ArSaMaDzKwTnRelativeDateTime(false),
  'az': AzRelativeDateTime(),
  'id': IdRelativeDateTime(),
  'ja': JaRelativeDateTime(),
  'ko': KoRelativeDateTime(),
  'ru': RuRelativeDateTime(),
  'uk': UkRelativeDateTime(),
  'hi': HiRelativeDateTime(),
  'hu': HuRelativeDateTime(),
  'pt': PtRelativeDateTime(),
  'pl': PlRelativeDateTime(),
  'tr': TrRelativeDateTime(),
  'sv': SvRelativeDateTime(),
  'nb': NbRelativeDateTime(),
  'fa': FaRelativeDateTime(),
  'bn': BnRelativeDateTime(),
  'nl': NlRelativeDateTime(),
  'th': ThRelativeDateTime(),
  'sk': SkRelativeDateTime(),
  'cs': CsRelativeDateTime(),
};

RelativeDateTime? _defaultRelativeDateTime;

set defaultRelativeDateTime(RelativeDateTime? relativeDateTime) {
  _defaultRelativeDateTime = relativeDateTime;
}

RelativeDateTime getRelativeDateTime(String locale) {
  if (_defaultRelativeDateTime != null) {
    return _defaultRelativeDateTime!;
  } else {
    final canonicalizedLocale = Intl.canonicalizedLocale(locale);
    final rdt1 = _relativeDateTime[canonicalizedLocale];
    if (rdt1 != null) return rdt1;

    final shortLocale = Intl.shortLocale(locale);
    final rdt2 = _relativeDateTime[shortLocale];
    if (rdt2 != null) return rdt2;

    throw JiffyException(
        "Locale `$locale` is not supported for relative date formatting.");
  }
}
