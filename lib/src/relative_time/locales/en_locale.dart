import 'package:jiffy/src/relative_time/lookup_messages.dart';

class EnLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => 'in';
  String suffixAgo() => 'ago';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'a few seconds';
  String aboutAMinute(int minutes) => 'a minute';
  String minutes(int minutes) => '$minutes minutes';
  String aboutAnHour(int minutes) => 'an hour';
  String hours(int hours) => '$hours hours';
  String aDay(int hours) => 'a day';
  String days(int days) => '$days days';
  String aboutAMonth(int days) => 'a month';
  String months(int months) => '$months months';
  String aboutAYear(int year) => 'a year';
  String years(int years) => '$years years';
  String wordSeparator() => ' ';
}
