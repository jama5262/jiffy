import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/utils/replace.dart';

class BnLocale extends Locale {
  StartOfWeek strtOfWeek;
  BnLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => BnRelativeTime();

  @override
  List<String>? ordinals() => null;

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class BnRelativeTime extends RelativeTime {
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
