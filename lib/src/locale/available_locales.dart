import 'locale.dart';
import 'locales/arLocale.dart';
import 'locales/deLocale.dart';
import 'locales/enLocale.dart';
import 'locales/esLocale.dart';
import 'locales/faLocale.dart';
import 'locales/frLocale.dart';
import 'locales/hiLocale.dart';
import 'locales/huLocale.dart';
import 'locales/idLocale.dart';
import 'locales/itLocale.dart';
import 'locales/jaLocale.dart';
import 'locales/koLocale.dart';
import 'locales/nbLocale.dart';
import 'locales/nlLocale.dart';
import 'locales/plLocale.dart';
import 'locales/ptLocale.dart';
import 'locales/ruLocale.dart';
import 'locales/thLocale.dart';
import 'locales/ukLocale.dart';
import 'locales/azLocale.dart';
import 'locales/svLocale.dart';
import 'locales/trLocale.dart';
import 'locales/zhLocale.dart';
import 'locales/bnLocale.dart';

Map<String, Locale> _availableLocales = {
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
  'th': ThLocale()
};

Locale getLocale(String locale) {
  return _availableLocales[locale.toLowerCase()] ?? _availableLocales['en_us']!;
}

bool isLocalAvailable(String locale) {
  return _availableLocales.containsKey(locale.toLowerCase());
}

// todo remove this function, it has no purpose
// all available locales can be maintained in the documentation
List<String> getAllLocales() {
  return _availableLocales.keys.toList();
}
