import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class NbLocale extends Locale {
  @override
  String code() => 'nb';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => NbRelativeTime();
}

class NbRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'om';
  @override
  String suffixAgo() => 'siden';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'noen sekunder';
  @override
  String aboutAMinute(int minutes) => 'ett minutt';
  @override
  String minutes(int minutes) => '$minutes minutter';
  @override
  String aboutAnHour(int minutes) => 'en time';
  @override
  String hours(int hours) => '$hours timer';
  @override
  String aDay(int hours) => 'en dag';
  @override
  String days(int days) => '$days dager';
  @override
  String aboutAMonth(int days) => 'en måned';
  @override
  String months(int months) => '$months måneder';
  @override
  String aboutAYear(int year) => 'ett år';
  @override
  String years(int years) => '$years år';
  @override
  String wordSeparator() => ' ';
}
