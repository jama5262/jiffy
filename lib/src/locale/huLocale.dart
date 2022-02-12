import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';

class HuLocale extends Locale {
  StartOfWeek strtOfWeek;
  HuLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => HuRelativeTime();

  @override
  List<String>? ordinals() => ['.', '.', '.', '.'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class HuRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'ezelőtt';
  @override
  String suffixFromNow() => 'ezután';
  @override
  String lessThanOneMinute(int seconds) => 'néhány másodperccel';
  @override
  String aboutAMinute(int minutes) => 'egy perccel';
  @override
  String minutes(int minutes) => '$minutes perccel';
  @override
  String aboutAnHour(int minutes) => 'egy órával';
  @override
  String hours(int hours) => '$hours órával';
  @override
  String aDay(int hours) => 'egy nappal';
  @override
  String days(int days) => '$days nappal';
  @override
  String aboutAMonth(int days) => 'egy hónappal';
  @override
  String months(int months) => '$months hónappal';
  @override
  String aboutAYear(int year) => 'egy évvel';
  @override
  String years(int years) => '$years évvel';
  @override
  String wordSeparator() => ' ';
}
