import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class UrLocale extends Locale {
  @override
  String code() => 'ur';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => UrRelativeTime();
}

class UrRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'اب سے';
  @override
  String suffixAgo() => 'پہلے';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'چند سیکنڈ پہلے';
  @override
  String aboutAMinute(int minutes) => 'ایک منٹ';
  @override
  String minutes(int minutes) => '$minutes منٹ';
  @override
  String aboutAnHour(int minutes) => 'ایک گھنٹہ';
  @override
  String hours(int hours) => '$hours گھنٹے';
  @override
  String aDay(int hours) => 'ایک دن';
  @override
  String days(int days) => '$days دن';
  @override
  String aboutAMonth(int days) => 'ایک مہینہ';
  @override
  String months(int months) => '$months مہینے';
  @override
  String aboutAYear(int year) => 'ایک سال';
  @override
  String years(int years) => '$years سال';
  @override
  String wordSeparator() => ' ';
}
