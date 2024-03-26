import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class ZhLocale extends Locale {
  @override
  String code() => 'zh';

  @override
  List<String> ordinals() => List.from(['日', '日', '日', '日'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;

  @override
  RelativeDateTime relativeDateTime() => ZhRelativeTime();
}

class ZhCnLocale extends ZhLocale {
  @override
  String code() => 'zh_cn';

  /// Per https://www.unicode.org/cldr/charts/42/supplemental/territory_information.html
  /// China	First day of week is monday
  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => ZhCnRelativeTime();
}

class ZhHkLocale extends ZhLocale {
  @override
  String code() => 'zh_hk';
}

class ZhTwLocale extends ZhLocale {
  @override
  String code() => 'zh_tw';
}

class ZhRelativeTime extends RelativeDateTime {
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

class ZhCnRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '前';
  @override
  String suffixFromNow() => '内';
  @override
  String lessThanOneMinute(int seconds) => '几秒';
  @override
  String aboutAMinute(int minutes) => '1 分钟';
  @override
  String minutes(int minutes) => '$minutes 分钟';
  @override
  String aboutAnHour(int minutes) => '1 小时';
  @override
  String hours(int hours) => '$hours 小时';
  @override
  String aDay(int hours) => '1 天';
  @override
  String days(int days) => '$days 天';
  @override
  String aboutAMonth(int days) => '1 个月';
  @override
  String months(int months) => '$months 个月';
  @override
  String aboutAYear(int year) => '1 年';
  @override
  String years(int years) => '$years 年';
  @override
  String wordSeparator() => '';
}
