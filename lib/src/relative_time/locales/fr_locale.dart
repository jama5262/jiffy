import 'package:jiffy/src/relative_time/lookup_messages.dart';

class FrLocale extends LookUpMessages {
  String prefixAgo() => 'il y a';
  String prefixFromNow() => "dans";
  String suffixAgo() => '';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => "quelques secondes";
  String aboutAMinute(int minutes) => 'une minute';
  String minutes(int minutes) => '$minutes minutes';
  String aboutAnHour(int minutes) => 'une heure';
  String hours(int hours) => '$hours heures';
  String aDay(int hours) => 'un jour';
  String days(int days) => '$days jours';
  String aboutAMonth(int days) => 'un mois';
  String months(int months) => '$months mois';
  String aboutAYear(int year) => 'un an';
  String years(int years) => '$years ans';
  String wordSeparator() => ' ';
}
