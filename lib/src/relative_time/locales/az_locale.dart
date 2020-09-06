import 'package:jiffy/src/relative_time/lookup_messages.dart';

class AzLocale extends LookUpMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'ərzində';
  @override
  String suffixAgo() => 'əvvəl';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'bir neçə saniyə';
  @override
  String aboutAMinute(int minutes) => 'bir dəqiqə olar';
  @override
  String minutes(int minutes) => '$minutes dəqiqə';
  @override
  String aboutAnHour(int minutes) => 'bir saat olar';
  @override
  String hours(int hours) => '$hours saat';
  @override
  String aDay(int hours) => 'bir gün';
  @override
  String days(int days) => '$days gün';
  @override
  String aboutAMonth(int days) => 'bir ay';
  @override
  String months(int months) => '$months ay';
  @override
  String aboutAYear(int year) => 'il';
  @override
  String years(int years) => '$years il';
  @override
  String wordSeparator() => ' ';
}
