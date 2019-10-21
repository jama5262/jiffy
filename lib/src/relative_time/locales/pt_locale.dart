import 'package:jiffy/src/relative_time/lookup_messages.dart';

class PtLocale extends LookUpMessages {
  String prefixAgo() => 'há';
  String prefixFromNow() => 'em';
  String suffixAgo() => '';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'segundos';
  String aboutAMinute(int minutes) => 'um minuto';
  String minutes(int minutes) => '$minutes minutos';
  String aboutAnHour(int minutes) => 'uma hora';
  String hours(int hours) => '$hours horas';
  String aDay(int hours) => 'um dia';
  String days(int days) => '$days dias';
  String aboutAMonth(int days) => 'um mês';
  String months(int months) => '$months meses';
  String aboutAYear(int year) => 'um ano';
  String years(int years) => '$years anos';
  String wordSeparator() => ' ';
}
