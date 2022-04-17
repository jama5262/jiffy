import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class DaLocale extends Locale {
  StartOfWeek strtOfWeek;
  DaLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => DaRelativeTime();

  @override
  List<String>? ordinals() => null;

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class DaRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'om';
  @override
  String suffixAgo() => 'siden';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'nogle sekunder';
  @override
  String aboutAMinute(int minutes) => 'ét minut';
  @override
  String minutes(int minutes) => '$minutes minutter';
  @override
  String aboutAnHour(int minutes) => 'én time';
  @override
  String hours(int hours) => '$hours timer';
  @override
  String aDay(int hours) => 'én dag';
  @override
  String days(int days) => '$days dage';
  @override
  String aboutAMonth(int days) => 'én måned';
  @override
  String months(int months) => '$months måneder';
  @override
  String aboutAYear(int year) => 'ét år';
  @override
  String years(int years) => '$years år';
  @override
  String wordSeparator() => ' ';
}
