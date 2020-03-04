import 'package:jiffy/src/relative_time/lookup_messages.dart';

class FrLocale extends LookUpMessages {
  @override String prefixAgo() => 'il y a';
  @override String prefixFromNow() => 'dans';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => 'quelques secondes';
  @override String aboutAMinute(int minutes) => 'une minute';
  @override String minutes(int minutes) => '$minutes minutes';
  @override String aboutAnHour(int minutes) => 'une heure';
  @override String hours(int hours) => '$hours heures';
  @override String aDay(int hours) => 'un jour';
  @override String days(int days) => '$days jours';
  @override String aboutAMonth(int days) => 'un mois';
  @override String months(int months) => '$months mois';
  @override String aboutAYear(int year) => 'un an';
  @override String years(int years) => '$years ans';
  @override String wordSeparator() => ' ';
}
