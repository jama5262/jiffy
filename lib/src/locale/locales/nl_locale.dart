import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class NlLocale extends Locale {
  @override
  String code() => 'nl';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => NlRelativeTime();
}

class NlRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'geleden';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) =>
      seconds > 0 ? 'op dit moment' : 'een ogenblik';
  @override
  String aboutAMinute(int minutes) => 'een minuut';
  @override
  String minutes(int minutes) => '$minutes minuten';
  @override
  String aboutAnHour(int minutes) => 'een uur';
  @override
  String hours(int hours) => '$hours uur';
  @override
  String aDay(int hours) => 'een dag';
  @override
  String days(int days) => '$days dagen';
  @override
  String aboutAMonth(int days) => 'een maand';
  @override
  String months(int months) => '$months maanden';
  @override
  String aboutAYear(int year) => 'een jaar';
  @override
  String years(int years) => '$years jaar';
  @override
  String wordSeparator() => ' ';
}
