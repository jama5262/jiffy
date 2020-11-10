import 'package:jiffy/src/relative_time/lookup_messages.dart';

class PrLocale extends LookUpMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'در';
  @override
  String suffixAgo() => 'پیش';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'چند ثانیه';
  @override
  String aboutAMinute(int minutes) => 'یک دقیقه';
  @override
  String minutes(int minutes) => '$minutes دقیقه';
  @override
  String aboutAnHour(int minutes) => 'یک ساعت';
  @override
  String hours(int hours) => '$hours ساعت';
  @override
  String aDay(int hours) => 'یک روز';
  @override
  String days(int days) => '$days روز';
  @override
  String aboutAMonth(int days) => 'یک ماه';
  @override
  String months(int months) => '$months ماه';
  @override
  String aboutAYear(int year) => 'یک سال';
  @override
  String years(int years) => '$years سال';
  @override
  String wordSeparator() => ' ';
}
