import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

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
  String minutes(int minutes) => '$minutes মিনিট';
  @override
  String aboutAnHour(int minutes) => 'এক ঘণ্টা';
  @override
  String hours(int hours) => '$hours ঘণ্টা';
  @override
  String aDay(int hours) => 'এক দিন';
  @override
  String days(int days) => '$days দিন';
  @override
  String aboutAMonth(int days) => 'এক মাস';
  @override
  String months(int months) => '$months মাস';
  @override
  String aboutAYear(int year) => 'এক বছর';
  @override
  String years(int years) => '$years বছর';
  @override
  String wordSeparator() => ' ';
}
