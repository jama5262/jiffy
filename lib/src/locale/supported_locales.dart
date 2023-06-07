import 'locale.dart';
import 'locales/ar_locale.dart';
import 'locales/cs_locale.dart';
import 'locales/de_locale.dart';
import 'locales/en_locale.dart';
import 'locales/es_locale.dart';
import 'locales/fa_locale.dart';
import 'locales/fr_locale.dart';
import 'locales/hi_locale.dart';
import 'locales/hu_locale.dart';
import 'locales/id_locale.dart';
import 'locales/it_locale.dart';
import 'locales/ja_locale.dart';
import 'locales/ko_locale.dart';
import 'locales/nb_locale.dart';
import 'locales/nl_locale.dart';
import 'locales/pl_locale.dart';
import 'locales/pt_locale.dart';
import 'locales/ru_locale.dart';
import 'locales/sk_locale.dart';
import 'locales/th_locale.dart';
import 'locales/uk_locale.dart';
import 'locales/az_locale.dart';
import 'locales/sv_locale.dart';
import 'locales/tr_locale.dart';
import 'locales/zh_locale.dart';
import 'locales/bn_locale.dart';

Map<String, Locale> _supportedLocales = {
  'en': EnLocale(),
  'en_us': EnUsLocale(),
  'en_sg': EnSgLocale(),
  'en_au': EnAuLocale(),
  'en_ca': EnCaLocale(),
  'en_gb': EnGbLocale(),
  'en_ie': EnIeLocale(),
  'en_il': EnIlLocale(),
  'en_nz': EnNzLocale(),
  'es': EsLocale(),
  'es_do': EsDoLocale(),
  'es_us': EsUsLocale(),
  'fr': FrLocale(),
  'fr_ch': FrChLocale(),
  'fr_ca': FrCaLocale(),
  'zh': ZhLocale(),
  'zh_cn': ZhCnLocale(),
  'zh_hk': ZhHkLocale(),
  'zh_tw': ZhTwLocale(),
  'de': DeLocale(),
  'de_de': DeDeLocale(),
  'de_at': DeAtLocale(),
  'de_ch': DeChLocale(),
  'it': ItLocale(),
  'it_ch': ItChLocale(),
  'ar': ArLocale(),
  'ar_ly': ArLyLocale(),
  'ar_dz': ArDzLocale(),
  'ar_kw': ArKwLocale(),
  'ar_sa': ArSaLocale(),
  'ar_ma': ArMaLocale(),
  'ar_tn': ArTnLocale(),
  'az': AzLocale(),
  'id': IdLocale(),
  'ja': JaLocale(),
  'ko': KoLocale(),
  'ru': RuLocale(),
  'uk': UkLocale(),
  'hi': HiLocale(),
  'hu': HuLocale(),
  'hu_hu': HuHuLocale(),
  'pt': PtLocale(),
  'pt_br': PtBrLocale(),
  'pl': PlLocale(),
  'tr': TrLocale(),
  'sv': SvLocale(),
  'nb': NbLocale(),
  'fa': FaLocale(),
  'bn': BnLocale(),
  'nl': NlLocale(),
  'th': ThLocale(),
  'sk': SkLocale(),
  'cs': CsLocale(),
};

Locale getLocale(String locale) {
  return _supportedLocales[locale.toLowerCase()] ?? _supportedLocales['en_us']!;
}

bool isLocalSupported(String locale) {
  return _supportedLocales.containsKey(locale.toLowerCase());
}

List<String> getSupportedLocales() {
  return _supportedLocales.keys.toList();
}
