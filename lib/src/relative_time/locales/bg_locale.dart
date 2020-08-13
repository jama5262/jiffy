import 'package:jiffy/src/relative_time/lookup_messages.dart';

class BgLocale extends LookUpMessages {
  @override
  String prefixAgo() => 'преди';
  @override
  String prefixFromNow() => 'след';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'няколко секунди';
  @override
  String aboutAMinute(int minutes) => 'минута';
  @override
  String minutes(int minutes) => '$minutes минути';
  @override
  String aboutAnHour(int minutes) => 'час';
  @override
  String hours(int hours) => '$hours часа';
  @override
  String aDay(int hours) => 'ден';
  @override
  String days(int days) => '$days дни';
  @override
  String aboutAMonth(int days) => 'месец';
  @override
  String months(int months) => '$months месеца';
  @override
  String aboutAYear(int year) => 'a година';
  @override
  String years(int years) => '$years години';
  @override
  String wordSeparator() => ' ';
}
