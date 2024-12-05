import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class UzLocale extends Locale {
  @override
  String code() => 'uz';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => UzRelativeTime();
}

class UzRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => ' oldin';
  @override
  String suffixFromNow() => 'dan keyin';
  @override
  String lessThanOneMinute(int seconds) => 'bir necha soniya';
  @override
  String aboutAMinute(int minutes) => 'daqiqa';
  @override
  String minutes(int minutes) => '$minutes daqiqa';
  @override
  String aboutAnHour(int minutes) => 'soat';
  @override
  String hours(int hours) => '$hours soat';
  @override
  String aDay(int hours) => '1 kun';
  @override
  String days(int days) => '$days kun';
  @override
  String aboutAMonth(int days) => '1 oy';
  @override
  String months(int months) => '$months oy';
  @override
  String aboutAYear(int year) => '1 yil';
  @override
  String years(int years) => '$years yil';
  @override
  String wordSeparator() => '';
}
