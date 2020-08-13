import 'package:jiffy/src/relative_time/lookup_messages.dart';

class PtPtLocale extends LookUpMessages {
  @override
  String prefixAgo() => 'há';
  @override
  String prefixFromNow() => 'daqui a';
  @override
  String suffixAgo() => 'atrás';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'segundos';
  @override
  String aboutAMinute(int minutes) => 'um minuto';
  @override
  String minutes(int minutes) => '$minutes minutos';
  @override
  String aboutAnHour(int minutes) => 'uma hora';
  @override
  String hours(int hours) => '$hours horas';
  @override
  String aDay(int hours) => 'um dia';
  @override
  String days(int days) => '$days dias';
  @override
  String aboutAMonth(int days) => 'um mês';
  @override
  String months(int months) => '$months meses';
  @override
  String aboutAYear(int year) => 'um ano';
  @override
  String years(int years) => '$years anos';
  @override
  String wordSeparator() => ' ';
}

class PtBrLocale extends PtPtLocale {
  @override
  String prefixFromNow() => 'em';
    @override
  String suffixAgo() => '';
}