import 'package:jiffy/src/relative_time/lookup_messages.dart';

class ItLocale extends LookUpMessages {
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
