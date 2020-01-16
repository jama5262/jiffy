import 'package:jiffy/src/relative_time/lookup_messages.dart';

class IdLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => 'dalam';
  String suffixAgo() => 'yang lalu';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'beberapa detik';
  String aboutAMinute(int minutes) => 'satu menit';
  String minutes(int minutes) => '$minutes menit';
  String aboutAnHour(int minutes) => 'satu jam';
  String hours(int hours) => '$hours jam';
  String aDay(int hours) => 'satu hari';
  String days(int days) => '$days hari';
  String aboutAMonth(int days) => 'satu bulan';
  String months(int months) => '$months bulan';
  String aboutAYear(int year) => 'satu tahun';
  String years(int years) => '$years tahun';
  String wordSeparator() => ' ';
}
