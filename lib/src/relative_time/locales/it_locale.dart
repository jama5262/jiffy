import 'package:jiffy/src/relative_time/lookup_messages.dart';

class ItLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => 'tra';
  String suffixAgo() => 'fa';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'alcuni secondi';
  String aboutAMinute(int minutes) => 'un minuto';
  String minutes(int minutes) => '${minutes} minuti';
  String aboutAnHour(int minutes) => "un'ora";
  String hours(int hours) => '${hours} ore';
  String aDay(int hours) => 'un giorno';
  String days(int days) => '${days} giorni';
  String aboutAMonth(int days) => 'un mese';
  String months(int months) => '${months} mesi';
  String aboutAYear(int year) => 'un anno';
  String years(int years) => '${years} anni';
  String wordSeparator() => ' ';
}
