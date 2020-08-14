import 'package:jiffy/src/relative_time/locales/ar_locale.dart';
import 'package:jiffy/src/relative_time/locales/bg_locale.dart';
import 'package:jiffy/src/relative_time/locales/da_locale.dart';
import 'package:jiffy/src/relative_time/locales/de_locale.dart';
import 'package:jiffy/src/relative_time/locales/en_locale.dart';
import 'package:jiffy/src/relative_time/locales/es_locale.dart';
import 'package:jiffy/src/relative_time/locales/fr_locale.dart';
import 'package:jiffy/src/relative_time/locales/hi_locale.dart';
import 'package:jiffy/src/relative_time/locales/id_locale.dart';
import 'package:jiffy/src/relative_time/locales/it_locale.dart';
import 'package:jiffy/src/relative_time/locales/ja_locale.dart';
import 'package:jiffy/src/relative_time/locales/ko_locale.dart';
import 'package:jiffy/src/relative_time/locales/nl_locale.dart';
import 'package:jiffy/src/relative_time/locales/pl_locale.dart';
import 'package:jiffy/src/relative_time/locales/pt_locale.dart';
import 'package:jiffy/src/relative_time/locales/ru_locale.dart';
import 'package:jiffy/src/relative_time/locales/uk_locale.dart';
import 'package:jiffy/src/relative_time/locales/zh_locale.dart';
import 'package:jiffy/src/relative_time/locales/tr_locale.dart';
import 'package:jiffy/src/relative_time/locales/sv_locale.dart';
import 'package:jiffy/src/relative_time/lookup_messages.dart';
import 'package:jiffy/src/utils/replace.dart';

Map<String, LookUpMessages> _lookupMessagesMap = {
  'de': DeLocale(),
  'deat': DeLocale(),
  'dech': DeLocale(),
  'dede': DeLocale(),
  'delu': DeLocale(),
  'en': EnLocale(),
  'enau': EnLocale(),
  'enca': EnLocale(),
  'engb': EnLocale(),
  'enid': EnLocale(),
  'enie': EnLocale(),
  'enil': EnLocale(),
  'ennz': EnLocale(),
  'ensg': EnLocale(),
  'enus': EnLocale(),
  'es': EsLocale(),
  'esdo': EsLocale(),
  'eses': EsLocale(),
  'esic': EsLocale(),
  'esus': EsLocale(),
  'fr': FrLocale(),
  'frbe': FrLocale(),
  'frca': FrLocale(),
  'frch': FrLocale(),
  'frfr': FrLocale(),
  'frlu': FrLocale(),
  'id': IdLocale(),
  'idid': IdLocale(),
  'it': ItLocale(),
  'itch': ItLocale(),
  'itit': ItLocale(),
  'ja': JaLocale(),
  'jajp': JaLocale(),
  'ko': KoLocale(),
  'kokr': KoLocale(),
  'ru': RuLocale(),
  'ruru': RuLocale(),
  'hi': HiLocale(),
  'hiin': HiLocale(),
  'ar': ArLyLocale(true),
  'ardz': ArSaMaDzKwTnLocale(false),
  'arkw': ArSaMaDzKwTnLocale(false),
  'arly': ArLyLocale(false),
  'arma': ArSaMaDzKwTnLocale(false),
  'arsa': ArSaMaDzKwTnLocale(true),
  'artn': ArSaMaDzKwTnLocale(false),
  'bgbg': BgLocale(), // Unverified
  'bgbg': DaLocale(), // Unverified
  'nlnl': NlLocale(), // Unverified
  'pl': PlLocale(),
  'plpl': PlLocale(),
  'pt': PtPtLocale(),
  'ptbr': PtBrLocale(),
  'ptpt': PtPtLocale(),
  'sv': SvLocale(),
  'svse': SvLocale(),
  'tr': TrLocale(),
  'trtr': TrLocale(),// Unimplemented
  'zh': ZhCnLocale(),
  'zhcn': ZhCnLocale(),
  'zhhk': ZhLocale(),
  'zhtw': ZhLocale(),
};

String format(String locale, DateTime date1, [DateTime date2]) {
  final messages =
      _lookupMessagesMap[replaceLocaleHyphen(locale)] ?? EnLocale();
  final _date2 = date2 ?? DateTime.now();
  final _allowFromNow = _date2.isBefore(date1);
  var elapsed = _date2.millisecondsSinceEpoch - date1.millisecondsSinceEpoch;

  String prefix, suffix;

  if (_allowFromNow && elapsed < 0) {
    elapsed = date1.isBefore(_date2) ? elapsed : elapsed.abs();
    prefix = messages.prefixFromNow();
    suffix = messages.suffixFromNow();
  } else {
    prefix = messages.prefixAgo();
    suffix = messages.suffixAgo();
  }

  final num seconds = elapsed / 1000;
  final num minutes = seconds / 60;
  final num hours = minutes / 60;
  final num days = hours / 24;
  final num months = days / 30;
  final num years = days / 365;

  String result;
  if (seconds < 45) {
    result = messages.lessThanOneMinute(seconds.round());
  } else if (seconds < 90) {
    result = messages.aboutAMinute(minutes.round());
  } else if (minutes < 45) {
    result = messages.minutes(minutes.round());
  } else if (minutes < 90) {
    result = messages.aboutAnHour(minutes.round());
  } else if (hours < 24) {
    result = messages.hours(hours.round());
  } else if (hours < 48) {
    result = messages.aDay(hours.round());
  } else if (days < 30) {
    result = messages.days(days.round());
  } else if (days < 60) {
    result = messages.aboutAMonth(days.round());
  } else if (days < 365) {
    result = messages.months(months.round());
  } else if (years < 2) {
    result = messages.aboutAYear(months.round());
  } else {
    result = messages.years(years.round());
  }

  return [prefix, result, suffix]
      .where((str) => str != null && str.isNotEmpty)
      .join(messages.wordSeparator());
}
