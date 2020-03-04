import 'package:jiffy/src/relative_time/lookup_messages.dart';

class IdLocale extends LookUpMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'dalam';
  @override
  String suffixAgo() => 'yang lalu';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'beberapa detik';
  @override
  String aboutAMinute(int minutes) => 'satu menit';
  @override
  String minutes(int minutes) => '$minutes menit';
  @override
  String aboutAnHour(int minutes) => 'satu jam';
  @override
  String hours(int hours) => '$hours jam';
  @override
  String aDay(int hours) => 'satu hari';
  @override
  String days(int days) => '$days hari';
  @override
  String aboutAMonth(int days) => 'satu bulan';
  @override
  String months(int months) => '$months bulan';
  @override
  String aboutAYear(int year) => 'satu tahun';
  @override
  String years(int years) => '$years tahun';
  @override
  String wordSeparator() => ' ';
}
