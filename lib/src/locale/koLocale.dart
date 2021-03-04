import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class KoLocale extends Locale {
  StartOfWeek strtOfWeek;
  KoLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => KoRelativeTime();

  @override
  List<String>? ordinals() => ['일', '일', '일', '일'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class KoRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '전';
  @override
  String suffixFromNow() => '후';
  @override
  String lessThanOneMinute(int seconds) => '몇 초';
  @override
  String aboutAMinute(int minutes) => '1분';
  @override
  String minutes(int minutes) => '$minutes분';
  @override
  String aboutAnHour(int minutes) => '한 시간';
  @override
  String hours(int hours) => '$hours시간';
  @override
  String aDay(int hours) => '하루';
  @override
  String days(int days) => '$days일';
  @override
  String aboutAMonth(int days) => '한 달';
  @override
  String months(int months) => '$months달';
  @override
  String aboutAYear(int year) => '일 년';
  @override
  String years(int years) => '$years년';
  @override
  String wordSeparator() => ' ';
}
