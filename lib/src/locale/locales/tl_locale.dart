import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class TlLocale extends Locale {
  @override
  String code() => 'tl';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;

  @override
  RelativeDateTime relativeDateTime() => TlRelativeTime();
}

class TlRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'sa loob ng';
  @override
  String suffixAgo() => 'ang nakalipas';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'ilang segundo';
  @override
  String aboutAMinute(int minutes) => 'isang minuto';
  @override
  String minutes(int minutes) => '$minutes minuto ang nakalipas';
  @override
  String aboutAnHour(int minutes) => 'isang oras';
  @override
  String hours(int hours) => '$hours oras';
  @override
  String aDay(int hours) => 'isang araw';
  @override
  String days(int days) => '$days araw';
  @override
  String aboutAMonth(int days) => 'isang buwan';
  @override
  String months(int months) => '$months buwan';
  @override
  String aboutAYear(int year) => 'isang taon';
  @override
  String years(int years) => '$years taon';
  @override
  String wordSeparator() => ' ';
}
