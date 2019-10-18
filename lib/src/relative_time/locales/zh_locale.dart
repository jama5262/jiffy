import 'package:jiffy/src/relative_time/lookup_messages.dart';

class ZhCnLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => '前';
  String suffixFromNow() => '内';
  String lessThanOneMinute(int seconds) => '几秒';
  String aboutAMinute(int minutes) => '1 分钟';
  String minutes(int minutes) => '$minutes 分钟';
  String aboutAnHour(int minutes) => '1 小时';
  String hours(int hours) => '${hours} 小时';
  String aDay(int hours) => '1 天';
  String days(int days) => '${days} 天';
  String aboutAMonth(int days) => '1 个月';
  String months(int months) => '${months} 个月';
  String aboutAYear(int year) => '1 年';
  String years(int years) => '${years} 年';
  String wordSeparator() => '';
}

class ZhLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => '前';
  String suffixFromNow() => '内';
  String lessThanOneMinute(int seconds) => '幾秒';
  String aboutAMinute(int minutes) => '1 分鐘';
  String minutes(int minutes) => '${minutes} 分鐘';
  String aboutAnHour(int minutes) => '1 小時';
  String hours(int hours) => '${hours} 小時';
  String aDay(int hours) => '1 天';
  String days(int days) => '${days} 天';
  String aboutAMonth(int days) => '1 個月';
  String months(int months) => '${months} 個月';
  String aboutAYear(int year) => '1 年';
  String years(int years) => '${years} 年';
  String wordSeparator() => '';
}
