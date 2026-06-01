import '../utils/verify_locale.dart';
import '../locale/relative_date_time.dart';
import '../locale/new_locale_relative_time.dart';

Map<String, RelativeDateTime> _relativeDateTime = {
  'en': EnRelativeDateTime(),
  'es': EsRelativeDateTime(),
  'fr': FrRelativeDateTime(),
  'zh': ZhRelativeDateTime(),
  'zh_CN': ZhCnRelativeDateTime(),
  'de': DeRelativeDateTime(),
  'it': ItRelativeDateTime(),
  'ar': ArRelativeDateTime(true),
  'ar_DZ': ArSaMaDzKwTnRelativeDateTime(false),
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
  'or': OrRelativeDateTime(),
  'pa': PaRelativeDateTime(),
  'mr': MrRelativeDateTime(),
  'si': SiRelativeDateTime(),
  'jv': JvRelativeDateTime(),
  'ms': MsRelativeDateTime(),
  'sw': SwRelativeDateTime(),
  'ta': TaRelativeDateTime(),
  'te': TeRelativeDateTime(),
  'kn': KnRelativeDateTime(),
  'ml': MlRelativeDateTime(),
  'vi': ViRelativeDateTime(),
  'yo': YoRelativeDateTime(),
  'ur': UrRelativeDateTime(),
  'gu': GuRelativeDateTime(),
  'ro': RoRelativeDateTime(),
  'uz': UzRelativeDateTime(),
  'am': AmRelativeDateTime(),
  'ha': HaRelativeDateTime(),
  'ig': IgRelativeDateTime(),
  'sn': SnRelativeDateTime(),
  'kk': KkRelativeDateTime(),
  'el': ElRelativeDateTime(),
  'tl': TlRelativeDateTime(),
  'he': HeRelativeDateTime(),
  'rw': RwRelativeDateTime(),
  'no': NbRelativeDateTime(),
  'fi': FiRelativeDateTime(),
  'da': DaRelativeDateTime(),
  'lt': LtRelativeDateTime(),
  'sl': SlRelativeDateTime(),
  'hr': HrRelativeDateTime(),
  'ca': CaRelativeDateTime(),
  'sr': SrRelativeDateTime(),
  'bg': BgRelativeDateTime(),
  'ka': KaRelativeDateTime(),
  'et': EtRelativeDateTime(),
  'eu': EuRelativeDateTime(),
  'gl': GlRelativeDateTime(),
};

RelativeDateTime? _defaultRelativeDateTime;

set defaultRelativeDateTime(RelativeDateTime? relativeDateTime) {
  _defaultRelativeDateTime = relativeDateTime;
}

RelativeDateTime getRelativeDateTime(String locale) {
  if (_defaultRelativeDateTime != null) {
    return _defaultRelativeDateTime!;
  } else {
    final supportedLocale = verifyLocale(locale,
        onLocaleExists: (localeExists) =>
            _relativeDateTime.containsKey(localeExists),
        onFailureMessage: _onFailureMessageLocaleNotSupported);

    return _relativeDateTime[supportedLocale.NAME]!;
  }
}

String _onFailureMessageLocaleNotSupported(String locale) {
  return "Locale `$locale` is not supported for relative date time formatting.";
}
