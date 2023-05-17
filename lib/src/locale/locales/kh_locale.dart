import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class KmKhLocale extends Locale {
  @override
  String code() => 'km_kh';

  @override
  List<String> ordinals() =>
      List.from(['ទី', 'ទី', 'ទី', 'ទី'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => KmKhRelativeTime();
}

class KmKhRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'ក្នុងរយៈពេល';
  @override
  String suffixAgo() => 'មុន';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'ពីរបីវិនាទី';
  @override
  String aboutAMinute(int minutes) => 'មួយនាទី';
  @override
  String minutes(int minutes) => '$minutes នាទី';
  @override
  String aboutAnHour(int minutes) => 'មួយម៉ោង';
  @override
  String hours(int hours) => '$hours ម៉ោង';
  @override
  String aDay(int hours) => 'មួយថ្ងៃ';
  @override
  String days(int days) => '$days ថ្ងៃ';
  @override
  String aboutAMonth(int days) => 'មួយខែ';
  @override
  String months(int months) => '$months ខែ';
  @override
  String aboutAYear(int year) => 'មួយឆ្នាំ';
  @override
  String years(int years) => '$years ឆ្នាំ';
  @override
  String wordSeparator() => ' ';
}
