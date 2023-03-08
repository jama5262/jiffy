import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class JaLocale extends Locale {
  @override
  String code() => 'ja';

  @override
  List<String> ordinals() => List.from(['日', '日', '日', '日'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;

  @override
  RelativeDateTime relativeDateTime() => JaRelativeTime();
}

class JaRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '前';
  @override
  String suffixFromNow() => '後';
  @override
  String lessThanOneMinute(int seconds) => '数秒';
  @override
  String aboutAMinute(int minutes) => '1分';
  @override
  String minutes(int minutes) => '$minutes分';
  @override
  String aboutAnHour(int minutes) => '1時間';
  @override
  String hours(int hours) => '$hours時間';
  @override
  String aDay(int hours) => '1日';
  @override
  String days(int days) => '$days日';
  @override
  String aboutAMonth(int days) => '1ヶ月';
  @override
  String months(int months) => '$monthsヶ月';
  @override
  String aboutAYear(int year) => '1年';
  @override
  String years(int years) => '$years年';
  @override
  String wordSeparator() => '';
}
