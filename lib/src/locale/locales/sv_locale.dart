import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class SvLocale extends Locale {
  @override
  String code() => 'sv';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => SvRelativeTime();
}

class SvRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'om';
  @override
  String suffixAgo() => 'sedan';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'några sekunder';
  @override
  String aboutAMinute(int minutes) => 'en minut';
  @override
  String minutes(int minutes) => '$minutes minuter';
  @override
  String aboutAnHour(int minutes) => 'en timme';
  @override
  String hours(int hours) => '$hours timmar';
  @override
  String aDay(int hours) => 'en dag';
  @override
  String days(int days) => '$days dagar';
  @override
  String aboutAMonth(int days) => 'en månad';
  @override
  String months(int months) => '$months månader';
  @override
  String aboutAYear(int year) => 'ett år';
  @override
  String years(int years) => '$years år';
  @override
  String wordSeparator() => ' ';
}
