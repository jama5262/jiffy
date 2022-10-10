import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class MnLocale extends Locale {
  StartOfWeek strtOfWeek;
  MnLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => MnRelativeTime();

  @override
  List<String>? ordinals() => ['-р', '-р', '-р', '-р'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class MnRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'өмнө';
  @override
  String suffixFromNow() => 'дараа';
  @override
  String lessThanOneMinute(int seconds) => 'хэдэн хормын';
  @override
  String aboutAMinute(int minutes) => '1 минутын';
  @override
  String minutes(int minutes) => '$minutes минутын';
  @override
  String aboutAnHour(int minutes) => '1 цагийн';
  @override
  String hours(int hours) => '$hours цагийн';
  @override
  String aDay(int hours) => '1 өдрийн';
  @override
  String days(int days) => '$days өдрийн';
  @override
  String aboutAMonth(int days) => '1 сарын';
  @override
  String months(int months) => '$months сарын';
  @override
  String aboutAYear(int year) => '1 жилийн';
  @override
  String years(int years) => '$years жилийн';
  @override
  String wordSeparator() => ' ';
}
