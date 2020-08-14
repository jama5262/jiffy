import 'package:jiffy/src/relative_time/lookup_messages.dart';

class DaLocale extends LookUpMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'om';
  @override
  String suffixAgo() => 'siden';
  @override
  String suffixFromNow() => 'fra nu';
  @override
  String lessThanOneMinute(int seconds) => 'et øjeblik';
  @override
  String aboutAMinute(int minutes) => 'en minut';
  @override
  String minutes(int minutes) => '$minutes minutter';
  @override
  String aboutAnHour(int minutes) => 'en time';
  @override
  String hours(int hours) => '$hours timer';
  @override
  String aDay(int hours) => 'en dag';
  @override
  String days(int days) => '$days dage';
  @override
  String aboutAMonth(int days) => 'en måned';
  @override
  String months(int months) => '$months måneder';
  @override
  String aboutAYear(int year) => 'en år';
  @override
  String years(int years) => '$years år';
  @override
  String wordSeparator() => ' ';
}
