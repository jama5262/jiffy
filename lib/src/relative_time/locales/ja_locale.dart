import 'package:jiffy/src/relative_time/lookup_messages.dart';

class JaLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => '前';
  String suffixFromNow() => '後';
  String lessThanOneMinute(int seconds) => '数秒';
  String aboutAMinute(int minutes) => '1分';
  String minutes(int minutes) => '${minutes}分';
  String aboutAnHour(int minutes) => '1時間';
  String hours(int hours) => '${hours}時間';
  String aDay(int hours) => '1日';
  String days(int days) => '${days}日';
  String aboutAMonth(int days) => '1ヶ月';
  String months(int months) => '${months}ヶ月';
  String aboutAYear(int year) => '1年';
  String years(int years) => '${years}年';
  String wordSeparator() => '';
}
