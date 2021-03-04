import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class ZhLocale extends Locale {
  StartOfWeek strtOfWeek;
  ZhLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => ZhRelativeTime();

  @override
  List<String>? ordinals() => ['日', '日', '日', '日'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class ZhRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '前';
  @override
  String suffixFromNow() => '内';
  @override
  String lessThanOneMinute(int seconds) => '幾秒';
  @override
  String aboutAMinute(int minutes) => '1 分鐘';
  @override
  String minutes(int minutes) => '$minutes 分鐘';
  @override
  String aboutAnHour(int minutes) => '1 小時';
  @override
  String hours(int hours) => '$hours 小時';
  @override
  String aDay(int hours) => '1 天';
  @override
  String days(int days) => '$days 天';
  @override
  String aboutAMonth(int days) => '1 個月';
  @override
  String months(int months) => '$months 個月';
  @override
  String aboutAYear(int year) => '1 年';
  @override
  String years(int years) => '$years 年';
  @override
  String wordSeparator() => '';
}
