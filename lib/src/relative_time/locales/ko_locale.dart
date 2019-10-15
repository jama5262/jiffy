import 'package:jiffy/src/relative_time/lookup_messages.dart';

class KoLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => '전';
  String suffixFromNow() => '후';
  String lessThanOneMinute(int seconds) => '몇 초';
  String aboutAMinute(int minutes) => '1분';
  String minutes(int minutes) => '${minutes}분';
  String aboutAnHour(int minutes) => '한 시간';
  String hours(int hours) => '${hours}시간';
  String aDay(int hours) => '하루';
  String days(int days) => '${days}일';
  String aboutAMonth(int days) => '한 달';
  String months(int months) => '${months}달';
  String aboutAYear(int year) => '일 년';
  String years(int years) => '${years}년';
  String wordSeparator() => ' ';
}
