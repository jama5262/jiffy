import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class IdLocale extends Locale {
  @override
  String code() => 'id';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;

  @override
  RelativeDateTime relativeDateTime() => IdRelativeTime();
}

class IdRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'dalam';
  @override
  String suffixAgo() => 'yang lalu';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'beberapa detik';
  @override
  String aboutAMinute(int minutes) => 'satu menit';
  @override
  String minutes(int minutes) => '$minutes menit';
  @override
  String aboutAnHour(int minutes) => 'satu jam';
  @override
  String hours(int hours) => '$hours jam';
  @override
  String aDay(int hours) => 'satu hari';
  @override
  String days(int days) => '$days hari';
  @override
  String aboutAMonth(int days) => 'satu bulan';
  @override
  String months(int months) => '$months bulan';
  @override
  String aboutAYear(int year) => 'satu tahun';
  @override
  String years(int years) => '$years tahun';
  @override
  String wordSeparator() => ' ';
}
