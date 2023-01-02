import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/locales/arLocale.dart';
import 'package:jiffy/src/locale/locales/azLocale.dart';
import 'package:jiffy/src/locale/locales/bnLocale.dart';
import 'package:jiffy/src/locale/locales/deLocale.dart';
import 'package:jiffy/src/locale/locales/enLocale.dart';
import 'package:jiffy/src/locale/locales/esLocale.dart';
import 'package:jiffy/src/locale/locales/faLocale.dart';
import 'package:jiffy/src/locale/locales/frLocale.dart';
import 'package:jiffy/src/locale/locales/hiLocale.dart';
import 'package:jiffy/src/locale/locales/huLocale.dart';
import 'package:jiffy/src/locale/locales/idLocale.dart';
import 'package:jiffy/src/locale/locales/itLocale.dart';
import 'package:jiffy/src/locale/locales/jaLocale.dart';
import 'package:jiffy/src/locale/locales/koLocale.dart';
import 'package:jiffy/src/locale/locales/nbLocale.dart';
import 'package:jiffy/src/locale/locales/nlLocale.dart';
import 'package:jiffy/src/locale/locales/plLocale.dart';
import 'package:jiffy/src/locale/locales/ptLocale.dart';
import 'package:jiffy/src/locale/locales/ruLocale.dart';
import 'package:jiffy/src/locale/locales/svLocale.dart';
import 'package:jiffy/src/locale/locales/thLocale.dart';
import 'package:jiffy/src/locale/locales/trLocale.dart';
import 'package:jiffy/src/locale/locales/ukLocale.dart';
import 'package:jiffy/src/locale/locales/zhLocale.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  for (var testData in localesTestData()) {
    test('Should successfully check locale contents are correct', () {
      // Setup
      final locale = testData['locale'] as Locale;

      // Verify
      expect(locale.code(), testData['code']);
      expect(locale.ordinals().length, 4);
      expect(locale.ordinals(), testData['ordinals']);
      expect(locale.startOfWeek(), testData['startOfWeek']);
      expect(locale.relativeTime().runtimeType,
          testData['relativeTime'].runtimeType);
    });
  }
}

List<Map<String, dynamic>> localesTestData() {
  return [
    {
      'locale': EnLocale(),
      'code': 'en',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnUsLocale(),
      'code': 'en_us',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnSgLocale(),
      'code': 'en_sg',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnAuLocale(),
      'code': 'en_au',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnCaLocale(),
      'code': 'en_ca',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnGbLocale(),
      'code': 'en_gb',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnIeLocale(),
      'code': 'en_ie',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnLiLocale(),
      'code': 'en_li',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnNzLocale(),
      'code': 'en_nz',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EsLocale(),
      'code': 'es',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': EsRelativeTime()
    },
    {
      'locale': EsDoLocale(),
      'code': 'es_do',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': EsRelativeTime()
    },
    {
      'locale': EsUsLocale(),
      'code': 'es_us',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': EsRelativeTime()
    },
    {
      'locale': FrLocale(),
      'code': 'fr',
      'ordinals': ['er', '', '', ''],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': FrRelativeTime()
    },
    {
      'locale': FrChLocale(),
      'code': 'fr_ch',
      'ordinals': ['er', '', '', ''],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': FrRelativeTime()
    },
    {
      'locale': FrCaLocale(),
      'code': 'fr_ca',
      'ordinals': ['er', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': FrRelativeTime()
    },
    {
      'locale': ZhLocale(),
      'code': 'zh',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ZhRelativeTime()
    },
    {
      'locale': ZhCnLocale(),
      'code': 'zh_cn',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ZhCnRelativeTime()
    },
    {
      'locale': ZhHkLocale(),
      'code': 'zh_hk',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ZhRelativeTime()
    },
    {
      'locale': ZhTwLocale(),
      'code': 'zh_tw',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ZhRelativeTime()
    },
    {
      'locale': DeLocale(),
      'code': 'de',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': DeDeLocale(),
      'code': 'de_de',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': DeAtLocale(),
      'code': 'de_at',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': DeChLocale(),
      'code': 'de_ch',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': ItLocale(),
      'code': 'it',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': ItRelativeTime()
    },
    {
      'locale': ItChLocale(),
      'code': 'it_ch',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': ItRelativeTime()
    },
    {
      'locale': ArLocale(),
      'code': 'ar',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SATURDAY,
      'relativeTime': ArRelativeTime(true)
    },
    {
      'locale': ArLyLocale(),
      'code': 'ar_ly',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SATURDAY,
      'relativeTime': ArRelativeTime(false)
    },
    {
      'locale': ArDzLocale(),
      'code': 'ar_dz',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': ArKwLocale(),
      'code': 'ar_kw',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': ArSaLocale(),
      'code': 'ar_sa',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ArSaMaDzKwTnRelativeTime(true)
    },
    {
      'locale': ArMaLocale(),
      'code': 'ar_ma',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SATURDAY,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': ArTnLocale(),
      'code': 'ar_tn',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SATURDAY,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': AzLocale(),
      'code': 'az',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': AzRelativeTime()
    },
    {
      'locale': IdLocale(),
      'code': 'id',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': IdRelativeTime()
    },
    {
      'locale': JaLocale(),
      'code': 'ja',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': JaRelativeTime()
    },
    {
      'locale': KoLocale(),
      'code': 'ko',
      'ordinals': ['일', '일', '일', '일'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': KoRelativeTime()
    },
    {
      'locale': RuLocale(),
      'code': 'ru',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': RuRelativeTime()
    },
    {
      'locale': UkLocale(),
      'code': 'uk',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': UkRelativeTime()
    },
    {
      'locale': HiLocale(),
      'code': 'hi',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': HiRelativeTime()
    },
    {
      'locale': HuLocale(),
      'code': 'hu',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': HuRelativeTime()
    },
    {
      'locale': HuHuLocale(),
      'code': 'hu_hu',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': HuRelativeTime()
    },
    {
      'locale': PtLocale(),
      'code': 'pt',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': PtRelativeTime()
    },
    {
      'locale': PtBrLocale(),
      'code': 'pt_br',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': PtRelativeTime()
    },
    {
      'locale': PlLocale(),
      'code': 'pl',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': PlRelativeTime()
    },
    {
      'locale': TrLocale(),
      'code': 'tr',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': TrRelativeTime()
    },
    {
      'locale': SvLocale(),
      'code': 'sv',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': SvRelativeTime()
    },
    {
      'locale': NbLocale(),
      'code': 'nb',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': NbRelativeTime()
    },
    {
      'locale': FaLocale(),
      'code': 'fa',
      'ordinals': ['م', 'م', 'م', 'م'],
      'startOfWeek': StartOfWeek.SATURDAY,
      'relativeTime': FaRelativeTime()
    },
    {
      'locale': BnLocale(),
      'code': 'bn',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': BnRelativeTime()
    },
    {
      'locale': NlLocale(),
      'code': 'nl',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.MONDAY,
      'relativeTime': NlRelativeTime()
    },
    {
      'locale': ThLocale(),
      'code': 'th',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.SUNDAY,
      'relativeTime': ThRelativeTime()
    },
  ];
}
