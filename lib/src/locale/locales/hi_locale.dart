import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class HiLocale extends Locale {
  @override
  String code() => 'hi';

  @override
  List<String> ordinals() => List.from(['', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;

  @override
  RelativeDateTime relativeDateTime() => HiRelativeTime();
}

class HiRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'पहले';
  @override
  String suffixFromNow() => 'में';
  @override
  String lessThanOneMinute(int seconds) => 'कुछ ही क्षण';
  @override
  String aboutAMinute(int minutes) => 'एक मिनट';
  @override
  String minutes(int minutes) => '$minutes मिनट';
  @override
  String aboutAnHour(int minutes) => 'एक घंटा';
  @override
  String hours(int hours) => '$hours घंटे';
  @override
  String aDay(int hours) => 'एक दिन';
  @override
  String days(int days) => '$days दिन';
  @override
  String aboutAMonth(int days) => 'एक महीने';
  @override
  String months(int months) => '$months महीने';
  @override
  String aboutAYear(int year) => 'एक वर्ष';
  @override
  String years(int years) => '$years वर्ष';

  @override
  String wordSeparator() => ' ';
}
