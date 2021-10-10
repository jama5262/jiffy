import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class FiLocale extends Locale {
  StartOfWeek strtOfWeek;
  FiLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => FiRelativeTime();

  @override
  List<String>? ordinals() => null;

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class FiRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'päästä';
  @override
  String suffixAgo() => 'sitten';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'muutama sekunti';
  @override
  String aboutAMinute(int minutes) => 'yksi minuutti';
  @override
  String minutes(int minutes) => '$minutes minuuttia';
  @override
  String aboutAnHour(int minutes) => 'yksi tunti';
  @override
  String hours(int hours) => '$hours tuntia';
  @override
  String aDay(int hours) => 'yksi päivä';
  @override
  String days(int days) => '$days päivää';
  @override
  String aboutAMonth(int days) => 'yksi kuukausi';
  @override
  String months(int months) => '$months kuukautta';
  @override
  String aboutAYear(int year) => 'yksi vuosi';
  @override
  String years(int years) => '$years vuotta';
  @override
  String wordSeparator() => ' ';
}
