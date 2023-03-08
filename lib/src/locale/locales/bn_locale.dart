import '../../enums/start_of_week.dart';
import '../../utils/replace.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class BnLocale extends Locale {
  @override
  String code() => 'bn';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;

  @override
  RelativeDateTime relativeDateTime() => BnRelativeTime();
}

class BnRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'আগে';
  @override
  String suffixFromNow() => 'পরে';
  @override
  String lessThanOneMinute(int seconds) => 'কিছু মুহূর্ত';
  @override
  String aboutAMinute(int minutes) => 'এক মিনিট';
  @override
  String minutes(int minutes) => replaceToLocaleNum('$minutes মিনিট', 'bn');
  @override
  String aboutAnHour(int minutes) => 'এক ঘন্টা';
  @override
  String hours(int hours) => replaceToLocaleNum('$hours ঘন্টা', 'bn');
  @override
  String aDay(int hours) => 'এক দিন';
  @override
  String days(int days) => replaceToLocaleNum('$days দিন', 'bn');
  @override
  String aboutAMonth(int days) => 'এক মাস';
  @override
  String months(int months) => replaceToLocaleNum('$months মাস', 'bn');
  @override
  String aboutAYear(int year) => 'এক বছর';
  @override
  String years(int years) => replaceToLocaleNum('$years বছর', 'bn');
  @override
  String wordSeparator() => ' ';
}
