import 'package:jiffy/src/display.dart';
import 'package:jiffy/src/enums/start_of_week.dart';
import 'package:jiffy/src/getter.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/locales/ar_locale.dart';
import 'package:jiffy/src/locale/locales/az_locale.dart';
import 'package:jiffy/src/locale/locales/bn_locale.dart';
import 'package:jiffy/src/locale/locales/cs_locale.dart';
import 'package:jiffy/src/locale/locales/de_locale.dart';
import 'package:jiffy/src/locale/locales/en_locale.dart';
import 'package:jiffy/src/locale/locales/es_locale.dart';
import 'package:jiffy/src/locale/locales/fa_locale.dart';
import 'package:jiffy/src/locale/locales/fr_locale.dart';
import 'package:jiffy/src/locale/locales/hi_locale.dart';
import 'package:jiffy/src/locale/locales/hu_locale.dart';
import 'package:jiffy/src/locale/locales/id_locale.dart';
import 'package:jiffy/src/locale/locales/it_locale.dart';
import 'package:jiffy/src/locale/locales/ja_locale.dart';
import 'package:jiffy/src/locale/locales/ko_locale.dart';
import 'package:jiffy/src/locale/locales/nb_locale.dart';
import 'package:jiffy/src/locale/locales/nl_locale.dart';
import 'package:jiffy/src/locale/locales/pl_locale.dart';
import 'package:jiffy/src/locale/locales/pt_locale.dart';
import 'package:jiffy/src/locale/locales/ru_locale.dart';
import 'package:jiffy/src/locale/locales/sk_locale.dart';
import 'package:jiffy/src/locale/locales/sv_locale.dart';
import 'package:jiffy/src/locale/locales/th_locale.dart';
import 'package:jiffy/src/locale/locales/tr_locale.dart';
import 'package:jiffy/src/locale/locales/uk_locale.dart';
import 'package:jiffy/src/locale/locales/zh_locale.dart';
import 'package:jiffy/src/manipulator.dart';
import 'package:jiffy/src/query.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Test locale properties', () {
    for (var testData in localesTestData()) {
      test('Should successfully check locale properties are correct', () {
        // Setup
        final locale = testData['locale'] as Locale;

        // Verify
        expect(locale.code(), testData['code']);
        expect(locale.ordinals().length, 4);
        expect(locale.ordinals(), testData['ordinals']);
        expect(locale.startOfWeek(), testData['startOfWeek']);
        expect(locale.relativeDateTime().runtimeType,
            testData['relativeTime'].runtimeType);
      });
    }
  });

  group('Test locale relative date time', () {
    final getter = Getter();
    final manipulator = Manipulator(getter);
    final query = Query(getter, manipulator);
    final display = Display(getter, manipulator, query);

    for (var testData in localesRelativeDateTimeTestData()) {
      test('Should successfully return correct relative date time', () {
        // Execute
        final actualRelativeDateTime = display.toAsRelativeDateTime(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['locale'],
            true);

        // Verify
        expect(actualRelativeDateTime, testData['expectedRelativeDateTime']);
      });
    }
  });
}

List<Map<String, dynamic>> localesTestData() {
  return [
    {
      'locale': EnLocale(),
      'code': 'en',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnUsLocale(),
      'code': 'en_us',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnSgLocale(),
      'code': 'en_sg',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnAuLocale(),
      'code': 'en_au',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnCaLocale(),
      'code': 'en_ca',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnGbLocale(),
      'code': 'en_gb',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnIeLocale(),
      'code': 'en_ie',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnIlLocale(),
      'code': 'en_il',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EnNzLocale(),
      'code': 'en_nz',
      'ordinals': ['st', 'nd', 'rd', 'th'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EnRelativeTime()
    },
    {
      'locale': EsLocale(),
      'code': 'es',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': EsRelativeTime()
    },
    {
      'locale': EsDoLocale(),
      'code': 'es_do',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': EsRelativeTime()
    },
    {
      'locale': EsUsLocale(),
      'code': 'es_us',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': EsRelativeTime()
    },
    {
      'locale': FrLocale(),
      'code': 'fr',
      'ordinals': ['er', '', '', ''],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': FrRelativeTime()
    },
    {
      'locale': FrChLocale(),
      'code': 'fr_ch',
      'ordinals': ['er', '', '', ''],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': FrRelativeTime()
    },
    {
      'locale': FrCaLocale(),
      'code': 'fr_ca',
      'ordinals': ['er', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': FrRelativeTime()
    },
    {
      'locale': ZhLocale(),
      'code': 'zh',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': ZhRelativeTime()
    },
    {
      'locale': ZhCnLocale(),
      'code': 'zh_cn',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': ZhCnRelativeTime()
    },
    {
      'locale': ZhHkLocale(),
      'code': 'zh_hk',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': ZhRelativeTime()
    },
    {
      'locale': ZhTwLocale(),
      'code': 'zh_tw',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': ZhRelativeTime()
    },
    {
      'locale': DeLocale(),
      'code': 'de',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': DeDeLocale(),
      'code': 'de_de',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': DeAtLocale(),
      'code': 'de_at',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': DeChLocale(),
      'code': 'de_ch',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': DeRelativeTime()
    },
    {
      'locale': ItLocale(),
      'code': 'it',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': ItRelativeTime()
    },
    {
      'locale': ItChLocale(),
      'code': 'it_ch',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': ItRelativeTime()
    },
    {
      'locale': ArLocale(),
      'code': 'ar',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.saturday,
      'relativeTime': ArRelativeTime(true)
    },
    {
      'locale': ArLyLocale(),
      'code': 'ar_ly',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.saturday,
      'relativeTime': ArRelativeTime(false)
    },
    {
      'locale': ArDzLocale(),
      'code': 'ar_dz',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': ArKwLocale(),
      'code': 'ar_kw',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': ArSaLocale(),
      'code': 'ar_sa',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': ArSaMaDzKwTnRelativeTime(true)
    },
    {
      'locale': ArMaLocale(),
      'code': 'ar_ma',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.saturday,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': ArTnLocale(),
      'code': 'ar_tn',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.saturday,
      'relativeTime': ArSaMaDzKwTnRelativeTime(false)
    },
    {
      'locale': AzLocale(),
      'code': 'az',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': AzRelativeTime()
    },
    {
      'locale': IdLocale(),
      'code': 'id',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': IdRelativeTime()
    },
    {
      'locale': JaLocale(),
      'code': 'ja',
      'ordinals': ['日', '日', '日', '日'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': JaRelativeTime()
    },
    {
      'locale': KoLocale(),
      'code': 'ko',
      'ordinals': ['일', '일', '일', '일'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': KoRelativeTime()
    },
    {
      'locale': RuLocale(),
      'code': 'ru',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': RuRelativeTime()
    },
    {
      'locale': UkLocale(),
      'code': 'uk',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': UkRelativeTime()
    },
    {
      'locale': HiLocale(),
      'code': 'hi',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': HiRelativeTime()
    },
    {
      'locale': HuLocale(),
      'code': 'hu',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': HuRelativeTime()
    },
    {
      'locale': HuHuLocale(),
      'code': 'hu_hu',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': HuRelativeTime()
    },
    {
      'locale': PtLocale(),
      'code': 'pt',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': PtRelativeTime()
    },
    {
      'locale': PtBrLocale(),
      'code': 'pt_br',
      'ordinals': ['º', 'º', 'º', 'º'],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': PtRelativeTime()
    },
    {
      'locale': PlLocale(),
      'code': 'pl',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': PlRelativeTime()
    },
    {
      'locale': TrLocale(),
      'code': 'tr',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': TrRelativeTime()
    },
    {
      'locale': SvLocale(),
      'code': 'sv',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': SvRelativeTime()
    },
    {
      'locale': NbLocale(),
      'code': 'nb',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': NbRelativeTime()
    },
    {
      'locale': FaLocale(),
      'code': 'fa',
      'ordinals': ['م', 'م', 'م', 'م'],
      'startOfWeek': StartOfWeek.saturday,
      'relativeTime': FaRelativeTime()
    },
    {
      'locale': BnLocale(),
      'code': 'bn',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': BnRelativeTime()
    },
    {
      'locale': NlLocale(),
      'code': 'nl',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': NlRelativeTime()
    },
    {
      'locale': ThLocale(),
      'code': 'th',
      'ordinals': ['', '', '', ''],
      'startOfWeek': StartOfWeek.sunday,
      'relativeTime': ThRelativeTime()
    },
    {
      'locale': SkLocale(),
      'code': 'sk',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': SkRelativeTime(),
    },
    {
      'locale': CsLocale(),
      'code': 'cs',
      'ordinals': ['.', '.', '.', '.'],
      'startOfWeek': StartOfWeek.monday,
      'relativeTime': CsRelativeTime(),
    },
  ];
}

List<Map<String, dynamic>> localesRelativeDateTimeTestData() {
  return [
    // EnLocale
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'in a few seconds',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'in a few seconds',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'a few seconds ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'in a minute',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'a minute ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'in 2 minutes',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 minutes ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'in an hour',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'an hour ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'in 2 hours',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 hours ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'in a day',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'a day ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'in 3 days',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 days ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'in a month',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'a month ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'in 2 months',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 months ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'in a year',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'a year ago',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'in 3 years',
    },
    {
      'locale': EnLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 years ago',
    },

    // EsLocale
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'en un momento',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'en un momento',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'hace un momento',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'en un minuto',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'hace un minuto',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'en 2 minutos',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'hace 2 minutos',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'en una hora',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'hace una hora',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'en 2 horas',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'hace 2 horas',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'en un día',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'hace un día',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'en 3 días',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'hace 3 días',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'en un mes',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'hace un mes',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'en 2 meses',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'hace 2 meses',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'en un año',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'hace un año',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'en 3 años',
    },
    {
      'locale': EsLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'hace 3 años',
    },

    // FrLocale
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'dans quelques secondes',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'dans quelques secondes',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'il y a quelques secondes',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'dans une minute',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'il y a une minute',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'dans 2 minutes',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'il y a 2 minutes',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'dans une heure',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'il y a une heure',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'dans 2 heures',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'il y a 2 heures',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'dans un jour',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'il y a un jour',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'dans 3 jours',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'il y a 3 jours',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'dans un mois',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'il y a un mois',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'dans 2 mois',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'il y a 2 mois',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'dans un an',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'il y a un an',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'dans 3 ans',
    },
    {
      'locale': FrLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'il y a 3 ans',
    },

    // ZhLocale
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '幾秒内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': '幾秒内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '幾秒前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': '1 分鐘内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': '1 分鐘前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2 分鐘内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 分鐘前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': '1 小時内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': '1 小時前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2 小時内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 小時前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '1 天内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': '1 天前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3 天内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 天前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': '1 個月内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': '1 個月前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2 個月内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 個月前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '1 年内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': '1 年前',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3 年内',
    },
    {
      'locale': ZhLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 年前',
    },

    // ZhCnLocale
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '几秒内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': '几秒内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '几秒前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': '1 分钟内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': '1 分钟前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2 分钟内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 分钟前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': '1 小时内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': '1 小时前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2 小时内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 小时前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '1 天内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': '1 天前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3 天内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 天前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': '1 个月内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': '1 个月前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2 个月内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 个月前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '1 年内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': '1 年前',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3 年内',
    },
    {
      'locale': ZhCnLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 年前',
    },

    // DeLocale
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'in ein paar Sekunden',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'in ein paar Sekunden',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'vor ein paar Sekunden',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'in einer Minute',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'vor einer Minute',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'in 2 Minuten',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'vor 2 Minuten',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'in einer Stunde',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'vor einer Stunde',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'in 2 Stunden',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'vor 2 Stunden',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'in einem Tag',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'vor einem Tag',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'in 3 Tagen',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'vor 3 Tagen',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'in einem Monat',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'vor einem Monat',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'in 2 Monaten',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'vor 2 Monaten',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'in einem Jahr',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'vor einem Jahr',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'in 3 Jahren',
    },
    {
      'locale': DeLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'vor 3 Jahren',
    },

    // ItLocale
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'tra alcuni secondi',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'tra alcuni secondi',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'alcuni secondi fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'tra un minuto',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'un minuto fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'tra 2 minuti',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 minuti fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'tra un\'ora',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'un\'ora fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'tra 2 ore',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 ore fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'tra un giorno',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'un giorno fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'tra 3 giorni',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 giorni fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'tra un mese',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'un mese fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'tra 2 mesi',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 mesi fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'tra un anno',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'un anno fa',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'tra 3 anni',
    },
    {
      'locale': ItLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 anni fa',
    },

    // ArLocale
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'بعد ثانية واحدة',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'بعد ثانية واحدة',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'منذ ثانية واحدة',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'بعد دقيقة واحدة',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'منذ دقيقة واحدة',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'بعد دقيقتين',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'منذ دقيقتين',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'بعد ساعة واحدة',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'منذ ساعة واحدة',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'بعد  ساعتين',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'منذ  ساعتين',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'بعد يوم واحد',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'منذ يوم واحد',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'بعد ۳ ايام ',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'منذ ۳ ايام ',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'بعد شهر واحد',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'منذ شهر واحد',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'بعد شهرين',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'منذ شهرين',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'بعد عام واحد',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'منذ عام واحد',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'بعد ۳ أعوام ',
    },
    {
      'locale': ArLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'منذ ۳ أعوام ',
    },

    // ArSaLocale
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'في ثوان',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'في ثوان',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'منذ ثوان',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'في دقيقة',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'منذ دقيقة',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'في ۲ دقائق ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'منذ ۲ دقائق ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'في ساعة',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'منذ ساعة',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'في ۲ ساعات ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'منذ ۲ ساعات ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'في يوم',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'منذ يوم',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'في ۳ أيام ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'منذ ۳ أيام ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'في شهر',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'منذ شهر',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'في ۲ أشهر ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'منذ ۲ أشهر ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'في سنة',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'منذ سنة',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'في ۳ سنوات ',
    },
    {
      'locale': ArSaLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'منذ ۳ سنوات ',
    },

    // AzLocale
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'bir neçə saniyə sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'bir neçə saniyə sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'bir neçə saniyə geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'dəqiqə sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'dəqiqə geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2 dəqiqə sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 dəqiqə geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'saat sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'saat geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2 saat sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 saat geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'gün sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'gün geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3 gün sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 gün geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'ay sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'ay geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2 ay sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 ay geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'il sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'il geri',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3 il sonra',
    },
    {
      'locale': AzLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 il geri',
    },

    // IdLocale
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'dalam beberapa detik',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'dalam beberapa detik',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'beberapa detik yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'dalam satu menit',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'satu menit yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'dalam 2 menit',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 menit yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'dalam satu jam',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'satu jam yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'dalam 2 jam',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 jam yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'dalam satu hari',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'satu hari yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'dalam 3 hari',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 hari yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'dalam satu bulan',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'satu bulan yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'dalam 2 bulan',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 bulan yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'dalam satu tahun',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'satu tahun yang lalu',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'dalam 3 tahun',
    },
    {
      'locale': IdLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 tahun yang lalu',
    },

    // JaLocale
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '数秒後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': '数秒後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '数秒前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': '1分後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': '1分前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2分後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2分前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': '1時間後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': '1時間前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2時間後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2時間前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '1日後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': '1日前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3日後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3日前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': '1ヶ月後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': '1ヶ月前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2ヶ月後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2ヶ月前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '1年後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': '1年前',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3年後',
    },
    {
      'locale': JaLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3年前',
    },

    // KoLocale
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '몇 초 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': '몇 초 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': '몇 초 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': '1분 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': '1분 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2분 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2분 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': '한 시간 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': '한 시간 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2시간 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2시간 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '하루 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': '하루 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3일 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3일 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': '한 달 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': '한 달 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2달 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2달 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '일 년 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': '일 년 전',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3년 후',
    },
    {
      'locale': KoLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3년 전',
    },

    // RuLocale
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'через несколько секунд',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'через несколько секунд',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'несколько секунд назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'через минуту',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'минуту назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'через 2 минуты',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 минуты назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'через час',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'час назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'через 2 часа',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 часа назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'через день',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'день назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'через 3 дня',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 дня назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'через месяц',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'месяц назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'через 2 месяца',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 месяца назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'через год',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'год назад',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'через 3 года',
    },
    {
      'locale': RuLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 года назад',
    },

    // UkLocale
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'через декілька секунд',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'через декілька секунд',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'декілька секунд тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'через хвилину',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'хвилину тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'через 2 хвилини',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 хвилини тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'через годину',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'годину тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'через 2 години',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 години тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'через день',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'день тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'через 3 дні',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 дні тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'через місяць',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'місяць тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'через 2 місяці',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 місяці тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'через рік',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'рік тому',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'через 3 роки',
    },
    {
      'locale': UkLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 роки тому',
    },

    // HiLocale
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'कुछ ही क्षण में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'कुछ ही क्षण में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'कुछ ही क्षण पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'एक मिनट में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'एक मिनट पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2 मिनट में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 मिनट पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'एक घंटा में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'एक घंटा पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2 घंटे में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 घंटे पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'एक दिन में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'एक दिन पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3 दिन में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 दिन पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'एक महीने में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'एक महीने पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2 महीने में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 महीने पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'एक वर्ष में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'एक वर्ष पहले',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3 वर्ष में',
    },
    {
      'locale': HiLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 वर्ष पहले',
    },

    // HuLocale
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'néhány másodperccel ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'néhány másodperccel ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'néhány másodperccel ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'egy perccel ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'egy perccel ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2 perccel ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 perccel ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'egy órával ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'egy órával ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2 órával ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 órával ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'egy nappal ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'egy nappal ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3 nappal ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 nappal ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'egy hónappal ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'egy hónappal ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2 hónappal ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 hónappal ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'egy évvel ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'egy évvel ezelőtt',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3 évvel ezután',
    },
    {
      'locale': HuLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 évvel ezelőtt',
    },

    // PtLocale
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'em segundos',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'em segundos',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'há segundos',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'em um minuto',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'há um minuto',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'em 2 minutos',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'há 2 minutos',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'em uma hora',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'há uma hora',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'em 2 horas',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'há 2 horas',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'em um dia',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'há um dia',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'em 3 dias',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'há 3 dias',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'em um mês',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'há um mês',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'em 2 meses',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'há 2 meses',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'em um ano',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'há um ano',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'em 3 anos',
    },
    {
      'locale': PtLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'há 3 anos',
    },

    // PlLocale
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'za kilka sekund',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'za kilka sekund',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'kilka sekund temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'za minutę',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'minutę temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'za 2 minuty',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 minuty temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'za godzinę',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'godzinę temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'za 2 godziny',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 godziny temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'za 1 dzień',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': '1 dzień temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'za 3 dni',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 dni temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'za miesiąc',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'miesiąc temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'za 2 miesiące',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 miesiące temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'za rok',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'rok temu',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'za 3 lata',
    },
    {
      'locale': PlLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 lata temu',
    },

    // TrLocale
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'birkaç saniye içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'birkaç saniye içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'birkaç saniye önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'bir dakika içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'bir dakika önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2 dakika içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 dakika önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'bir saat içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'bir saat önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2 saat içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 saat önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'bir gün içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'bir gün önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3 gün içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 gün önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'bir ay içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'bir ay önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2 ay içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 ay önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'bir yıl içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'bir yıl önce',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3 yıl içinde',
    },
    {
      'locale': TrLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 yıl önce',
    },

    // SvLocale
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'om några sekunder',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'om några sekunder',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'några sekunder sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'om en minut',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'en minut sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'om 2 minuter',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 minuter sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'om en timme',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'en timme sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'om 2 timmar',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 timmar sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'om en dag',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'en dag sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'om 3 dagar',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 dagar sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'om en månad',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'en månad sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'om 2 månader',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 månader sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'om ett år',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'ett år sedan',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'om 3 år',
    },
    {
      'locale': SvLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 år sedan',
    },

    // NbLocale
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'om noen sekunder',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'om noen sekunder',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'noen sekunder siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'om ett minutt',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'ett minutt siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'om 2 minutter',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 minutter siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'om en time',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'en time siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'om 2 timer',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 timer siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'om en dag',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'en dag siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'om 3 dager',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 dager siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'om en måned',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'en måned siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'om 2 måneder',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 måneder siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'om ett år',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'ett år siden',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'om 3 år',
    },
    {
      'locale': NbLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 år siden',
    },

    // FaLocale
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'چند ثانیه بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'چند ثانیه بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'چند ثانیه پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'یک دقیقه بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'یک دقیقه پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '۲ دقیقه  بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '۲ دقیقه  پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'یک ساعت بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'یک ساعت پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '۲ ساعت  بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '۲ ساعت  پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'یک روز بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'یک روز پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '۳ روز  بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '۳ روز  پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'یک ماه بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'یک ماه پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '۲ ماه  بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '۲ ماه  پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'یک سال بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'یک سال پیش',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '۳ سال  بعد',
    },
    {
      'locale': FaLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '۳ سال  پیش',
    },

    // BnLocale
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'কিছু মুহূর্ত পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'কিছু মুহূর্ত পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'কিছু মুহূর্ত আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'এক মিনিট পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'এক মিনিট আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '২ মিনিট পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '২ মিনিট আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'এক ঘন্টা পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'এক ঘন্টা আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '২ ঘন্টা পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '২ ঘন্টা আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'এক দিন পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'এক দিন আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '৩ দিন পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '৩ দিন আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'এক মাস পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'এক মাস আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '২ মাস পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '২ মাস আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'এক বছর পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'এক বছর আগে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '৩ বছর পরে',
    },
    {
      'locale': BnLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '৩ বছর আগে',
    },

    // NlLocale
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'een ogenblik',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'op dit moment',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'op dit moment geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'een minuut',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'een minuut geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': '2 minuten',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 minuten geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'een uur',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'een uur geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': '2 uur',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 uur geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'een dag',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'een dag geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': '3 dagen',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 dagen geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'een maand',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'een maand geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': '2 maanden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 maanden geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'een jaar',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'een jaar geleden',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': '3 jaar',
    },
    {
      'locale': NlLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 jaar geleden',
    },

    // ThLocale
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'อีกไม่กี่วินาที',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'อีกไม่กี่วินาที',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'ไม่กี่วินาทีที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'อีก1 นาที',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': '1 นาทีที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'อีก2 นาที',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': '2 นาทีที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'อีก1 ชั่วโมง',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': '1 ชั่วโมงที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'อีก2 ชั่วโมง',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': '2 ชั่วโมงที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'อีก1 วัน',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': '1 วันที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'อีก3 วัน',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': '3 วันที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'อีก1 เดือน',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': '1 เดือนที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'อีก2 เดือน',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': '2 เดือนที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'อีก1 ปี',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': '1 ปีที่แล้ว',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'อีก3 ปี',
    },
    {
      'locale': ThLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': '3 ปีที่แล้ว',
    },
    // SkLocale
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'za pár sekundami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'za pár sekundami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'pred pár sekundami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'za minútou',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'pred minútou',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'za 2 minútami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'pred 2 minútami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'za hodinou',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'pred hodinou',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'za 2 hodinami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'pred 2 hodinami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'za dňom',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'pred dňom',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'za 3 dňami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'pred 3 dňami',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'za mesiacom',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'pred mesiacom',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'za 2 mesiacmi',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'pred 2 mesiacmi',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'za rokom',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'pred rokom',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'za 3 rokmi',
    },
    {
      'locale': SkLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'pred 3 rokmi',
    },
    // CsLocale
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'za pár sekundami',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedRelativeDateTime': 'za pár sekundami',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedRelativeDateTime': 'před pár sekundami',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedRelativeDateTime': 'za minutou',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedRelativeDateTime': 'před minutou',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 1),
      'secondDateTime': DateTime(1997, 10, 23, 12, 3),
      'expectedRelativeDateTime': 'za 2 minutami',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 3),
      'secondDateTime': DateTime(1997, 10, 23, 12, 1),
      'expectedRelativeDateTime': 'před 2 minutami',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedRelativeDateTime': 'za hodinou',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedRelativeDateTime': 'před hodinou',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 1),
      'secondDateTime': DateTime(1997, 10, 23, 3),
      'expectedRelativeDateTime': 'za 2 hodinami',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23, 3),
      'secondDateTime': DateTime(1997, 10, 23, 1),
      'expectedRelativeDateTime': 'před 2 hodinami',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 22),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'za dnem',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 22),
      'expectedRelativeDateTime': 'před dnem',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedRelativeDateTime': 'za 3 dny',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedRelativeDateTime': 'před 3 dny',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10, 1),
      'secondDateTime': DateTime(1997, 11, 1),
      'expectedRelativeDateTime': 'za měsícem',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 11, 1),
      'secondDateTime': DateTime(1997, 10, 1),
      'expectedRelativeDateTime': 'před měsícem',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 12),
      'expectedRelativeDateTime': 'za 2 měsíci',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997, 12),
      'secondDateTime': DateTime(1997, 10),
      'expectedRelativeDateTime': 'před 2 měsíci',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'za rokem',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedRelativeDateTime': 'před rokem',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedRelativeDateTime': 'za 3 lety',
    },
    {
      'locale': CsLocale(),
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedRelativeDateTime': 'před 3 lety',
    },
  ];
}
