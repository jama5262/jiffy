import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relative_date_time.dart';

void main() {
  //  EnsureInitialized
  Jiffy.ensureInitialized(locales: {
    'en': CustomEnLocale(),
    'en_us': CustomEnUsLocale(),
  });

  // Relative date time
  // From X
  Jiffy.parse('1997/09/23').from(Jiffy.parse('2002/10/26')); // 5 years Ago
  // From Now
  Jiffy.parse('1997/09/23').fromNow(); // 25 years Ago
}

/// Create CustomEnLocale Class
class CustomEnLocale extends Locale {
  @override
  String code() => 'en';

  @override
  List<String> ordinals() =>
      List.from(['st', 'nd', 'rd', 'th'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;

  @override
  RelativeDateTime relativeDateTime() => EnRelativeTime();
}

class CustomEnUsLocale extends CustomEnLocale {
  @override
  String code() => 'en_us';
}

class EnRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'In';
  @override
  String suffixAgo() => 'Ago';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'a Few Seconds';
  @override
  String aboutAMinute(int minutes) => 'a Minute';
  @override
  String minutes(int minutes) => '$minutes Minutes';
  @override
  String aboutAnHour(int minutes) => 'an Hour';
  @override
  String hours(int hours) => '$hours Hours';
  @override
  String aDay(int hours) => 'a Day';
  @override
  String days(int days) => '$days Days';
  @override
  String aboutAMonth(int days) => 'a Month';
  @override
  String months(int months) => '$months Months';
  @override
  String aboutAYear(int year) => 'a Year';
  @override
  String years(int years) => '$years Years';
  @override
  String wordSeparator() => ' ';
}
