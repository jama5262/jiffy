import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class ItLocale extends Locale {
  StartOfWeek strtOfWeek;
  ItLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => ItRelativeTime();

  @override
  List<String>? ordinals() => ['º', 'º', 'º', 'º'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class ItRelativeTime extends RelativeTime {
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
