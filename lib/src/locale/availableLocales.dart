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
import 'package:jiffy/src/locale/plLocale.dart';
import 'package:jiffy/src/locale/ptLocale.dart';
import 'package:jiffy/src/locale/ruLocale.dart';
import 'package:jiffy/src/locale/svLocale.dart';
import 'package:jiffy/src/locale/trLocale.dart';
import 'package:jiffy/src/locale/zhCnLocale.dart';
import 'package:jiffy/src/locale/zhLocale.dart';

Map<String, Locale> _availableLocales = {
  'en': EnLocale(),
  'en_us': EnLocale(),
  'en_sg': EnLocale(),
  'en_au': EnLocale(),
  'en_ca': EnLocale(),
  'en_gb': EnLocale(),
  'en_ie': EnLocale(),
  'en_il': EnLocale(),
  'en_nz': EnLocale(),
  'es': EsLocale(),
  'es_do': EsLocale(),
  'es_us': EsLocale(),
  'fr': FrLocale(),
  'fr_ch': FrLocale(),
  'fr_ca': FrLocale(),
  'zh': ZhCnLocale(),
  'zh_cn': ZhCnLocale(),
  'zh_hk': ZhLocale(),
  'zh_tw': ZhLocale(),
  'de': DeLocale(),
  'de_de': DeLocale(),
  'de_at': DeLocale(),
  'de_ch': DeLocale(),
  'it': ItLocale(),
  'it_ch': ItLocale(),
  'ar': ArLyLocale(true),
  'ar_ly': ArLyLocale(false),
  'ar_dz': ArSaMaDzKwTnLocale(false),
  'ar_kw': ArSaMaDzKwTnLocale(false),
  'ar_sa': ArSaMaDzKwTnLocale(true),
  'ar_ma': ArSaMaDzKwTnLocale(false),
  'ar_tn': ArSaMaDzKwTnLocale(false),
  'id': IdLocale(),
  'ja': JaLocale(),
  'ko': KoLocale(),
  'ru': RuLocale(),
  'hi': HiLocale(),
  'pt': PtLocale(),
  'pt_br': PtLocale(),
  'pl': PlLocale(),
  'tr': TrLocale(),
  'sv': SvLocale(),
  'nb': NbLocale(),
  'fa': FaLocale(true),
};

Locale getLocale(String locale) {
  return _availableLocales[locale.toLowerCase()] ?? EnLocale();
}

bool isLocalAvailable(String locale) {
  return !_availableLocales.containsKey(locale.toLowerCase());
}
