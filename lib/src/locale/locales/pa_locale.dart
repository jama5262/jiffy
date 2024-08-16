import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class PaLocale extends Locale {
  @override
  String code() => 'pa';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => PaRelativeTime();
}

class PaRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'ਪਹਿਲਾਂ';
  @override
  String suffixFromNow() => 'ਵਿੱਚ';
  @override
  String lessThanOneMinute(int seconds) => 'ਕੁਝ ਸਕਿੰਟ';
  @override
  String aboutAMinute(int minutes) => 'ਇੱਕ ਮਿੰਟ';
  @override
  String minutes(int minutes) => '$minutes ਮਿੰਟ';
  @override
  String aboutAnHour(int minutes) => 'ਇੱਕ ਘੰਟਾ';
  @override
  String hours(int hours) => '$hours ਘੰਟੇ';
  @override
  String aDay(int hours) => 'ਇੱਕ ਦਿਨ';
  @override
  String days(int days) => '$days ਦਿਨ';
  @override
  String aboutAMonth(int days) => 'ਇੱਕ ਮਹੀਨਾ';
  @override
  String months(int months) => '$months ਮਹੀਨੇ';
  @override
  String aboutAYear(int year) => 'ਇੱਕ ਸਾਲ';
  @override
  String years(int years) => '$years ਸਾਲ';
  @override
  String wordSeparator() => ' ';
}
