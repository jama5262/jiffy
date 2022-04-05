import 'package:jiffy/src/locale/deLocale.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class DaLocale extends Locale {
  StartOfWeek strtOfWeek;
  DaLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => DeRelativeTime();

  @override
  List<String>? ordinals() => ['.', '.', '.', '.'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class EnRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'i';
  @override
  String suffixAgo() => 'siden';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'få sekunder';
  @override
  String aboutAMinute(int minutes) => 'et minut';
  @override
  String minutes(int minutes) => '$minutes minutter';
  @override
  String aboutAnHour(int minutes) => 'en time';
  @override
  String hours(int hours) => '$hours timer';
  @override
  String aDay(int hours) => 'en dag';
  @override
  String days(int days) => '$days dage';
  @override
  String aboutAMonth(int days) => 'en måned';
  @override
  String months(int months) => '$months måneder';
  @override
  String aboutAYear(int year) => 'et år';
  @override
  String years(int years) => '$years år';
  @override
  String wordSeparator() => ' ';
}
