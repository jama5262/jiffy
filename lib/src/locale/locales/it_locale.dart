import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class ItLocale extends Locale {
  @override
  String code() => 'it';

  @override
  List<String> ordinals() => List.from(['º', 'º', 'º', 'º'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => ItRelativeTime();
}

class ItChLocale extends ItLocale {
  @override
  String code() => 'it_ch';
}

class ItRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'tra';
  @override
  String suffixAgo() => 'fa';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'alcuni secondi';
  @override
  String aboutAMinute(int minutes) => 'un minuto';
  @override
  String minutes(int minutes) => '$minutes minuti';
  @override
  String aboutAnHour(int minutes) => 'un\'ora';
  @override
  String hours(int hours) => '$hours ore';
  @override
  String aDay(int hours) => 'un giorno';
  @override
  String days(int days) => '$days giorni';
  @override
  String aboutAMonth(int days) => 'un mese';
  @override
  String months(int months) => '$months mesi';
  @override
  String aboutAYear(int year) => 'un anno';
  @override
  String years(int years) => '$years anni';
  @override
  String wordSeparator() => ' ';
}
