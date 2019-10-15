import 'package:jiffy/src/relative_time/lookup_messages.dart';

class DeLocale extends LookUpMessages {
  String prefixAgo() => 'vor';
  String prefixFromNow() => 'in';
  String suffixAgo() => '';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'ein paar Sekunden';
  String aboutAMinute(int minutes) => 'einer Minute';
  String minutes(int minutes) => '$minutes Minuten';
  String aboutAnHour(int minutes) => 'einer Stunde';
  String hours(int hours) => '$hours Stunden';
  String aDay(int hours) => 'einem Tag';
  String days(int days) => '$days Tagen';
  String aboutAMonth(int days) => 'einem Monat';
  String months(int months) => '$months Monaten';
  String aboutAYear(int year) => 'einem Jahr';
  String years(int years) => '$years Jahren';
  String wordSeparator() => ' ';
}
