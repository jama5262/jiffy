import '../utils/verify_locale.dart';
import '../locale/relative_date_time.dart';

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
