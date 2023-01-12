import '../../enums/startOfWeek.dart';
import '../locale.dart';
import '../relativeTime.dart';

class UzLocale extends Locale {
  @override
  String code() => 'uz';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.MONDAY;

  @override
  RelativeTime relativeTime() => UzRelativeTime();
}

class UzRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'oldin';
  @override
  String suffixFromNow() => 'o\ʻtib';
  @override
  String lessThanOneMinute(int seconds) => 'bir necha soniya';
  @override
  String aboutAMinute(int minutes) => '$minutes daqiqa';
  @override
  String minutes(int minutes) => '$minutes daqiqa';
  @override
  String aboutAnHour(int minutes) => '1 soat';
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
  String wordSeparator() => ' ';
}
