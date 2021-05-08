import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/locale/arLocale.dart';
import 'package:jiffy/src/locale/deLocale.dart';
import 'package:jiffy/src/locale/enLocale.dart';
import 'package:jiffy/src/locale/esLocale.dart';
import 'package:jiffy/src/locale/faLocale.dart';
import 'package:jiffy/src/locale/frLocale.dart';
import 'package:jiffy/src/locale/hiLocale.dart';
import 'package:jiffy/src/locale/idLocale.dart';
import 'package:jiffy/src/locale/itLocale.dart';
import 'package:jiffy/src/locale/jaLocale.dart';
import 'package:jiffy/src/locale/koLocale.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/nbLocale.dart';
import 'package:jiffy/src/locale/nlLocale.dart';
import 'package:jiffy/src/locale/plLocale.dart';
import 'package:jiffy/src/locale/ptLocale.dart';
import 'package:jiffy/src/locale/ruLocale.dart';
import 'package:jiffy/src/locale/thLocale.dart';
import 'package:jiffy/src/locale/ukLocale.dart';
import 'package:jiffy/src/locale/azLocale.dart';
import 'package:jiffy/src/locale/svLocale.dart';
import 'package:jiffy/src/locale/trLocale.dart';
import 'package:jiffy/src/locale/zhCnLocale.dart';
import 'package:jiffy/src/locale/zhLocale.dart';
import 'package:jiffy/src/locale/bnLocale.dart';

Map<String, Locale> _availableLocales = {
  'en': EnLocale(StartOfWeek.SUNDAY),
  'en_us': EnLocale(StartOfWeek.SUNDAY),
  'en_sg': EnLocale(StartOfWeek.SUNDAY),
  'en_au': EnLocale(StartOfWeek.SUNDAY),
  'en_ca': EnLocale(StartOfWeek.SUNDAY),
  'en_gb': EnLocale(StartOfWeek.MONDAY),
  'en_ie': EnLocale(StartOfWeek.MONDAY),
  'en_il': EnLocale(StartOfWeek.SUNDAY),
  'en_nz': EnLocale(StartOfWeek.SUNDAY),
  'es': EsLocale(StartOfWeek.MONDAY),
  'es_do': EsLocale(StartOfWeek.MONDAY),
  'es_us': EsLocale(StartOfWeek.SUNDAY),
  'fr': FrLocale(StartOfWeek.MONDAY),
  'fr_ch': FrLocale(StartOfWeek.MONDAY),
  'fr_ca': FrLocale(StartOfWeek.SUNDAY),
  'zh': ZhCnLocale(StartOfWeek.SUNDAY),
  'zh_cn': ZhCnLocale(StartOfWeek.SUNDAY),
  'zh_hk': ZhLocale(StartOfWeek.SUNDAY),
  'zh_tw': ZhLocale(StartOfWeek.SUNDAY),
  'de': DeLocale(StartOfWeek.MONDAY),
  'de_de': DeLocale(StartOfWeek.MONDAY),
  'de_at': DeLocale(StartOfWeek.MONDAY),
  'de_ch': DeLocale(StartOfWeek.MONDAY),
  'it': ItLocale(StartOfWeek.MONDAY),
  'it_ch': ItLocale(StartOfWeek.MONDAY),
  'ar': ArLyLocale(true, StartOfWeek.SATURDAY),
  'ar_ly': ArLyLocale(false, StartOfWeek.SATURDAY),
  'ar_dz': ArSaMaDzKwTnLocale(false, StartOfWeek.SUNDAY),
  'ar_kw': ArSaMaDzKwTnLocale(false, StartOfWeek.SUNDAY),
  'ar_sa': ArSaMaDzKwTnLocale(true, StartOfWeek.SUNDAY),
  'ar_ma': ArSaMaDzKwTnLocale(false, StartOfWeek.SATURDAY),
  'ar_tn': ArSaMaDzKwTnLocale(false, StartOfWeek.SATURDAY),
  'az': AzLocale(StartOfWeek.MONDAY),
  'id': IdLocale(StartOfWeek.SUNDAY),
  'ja': JaLocale(StartOfWeek.SUNDAY),
  'ko': KoLocale(StartOfWeek.SUNDAY),
  'ru': RuLocale(StartOfWeek.MONDAY),
  'uk': UkLocale(StartOfWeek.MONDAY),
  'hi': HiLocale(StartOfWeek.SUNDAY),
  'pt': PtLocale(StartOfWeek.MONDAY),
  'pt_br': PtLocale(StartOfWeek.SUNDAY),
  'pl': PlLocale(StartOfWeek.MONDAY),
  'tr': TrLocale(StartOfWeek.MONDAY),
  'sv': SvLocale(StartOfWeek.SUNDAY),
  'nb': NbLocale(StartOfWeek.SUNDAY),
  'fa': FaLocale(true, StartOfWeek.SATURDAY),
  'bn': BnLocale(StartOfWeek.SUNDAY),
  'nl': NlLocale(StartOfWeek.MONDAY),
  'th': ThLocale(StartOfWeek.SUNDAY)
};

Locale getLocale(String locale) {
  return _availableLocales[locale.toLowerCase()] ??
      EnLocale(StartOfWeek.SUNDAY);
}

bool isLocalAvailable(String locale) {
  return !_availableLocales.containsKey(locale.toLowerCase());
}

List<String> getAllLocales() {
  return _availableLocales.keys.toList();
}
