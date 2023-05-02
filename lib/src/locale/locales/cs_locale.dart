import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class CsLocale extends Locale {
  @override
  String code() => 'cs';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => CsRelativeTime();
}

class CsRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'před';

  @override
  String prefixFromNow() => 'za';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'pár sekundami';

  @override
  String aboutAMinute(int minutes) => 'minutou';

  @override
  String minutes(int minutes) => '$minutes minutami';

  @override
  String aboutAnHour(int minutes) => 'hodinou';

  @override
  String hours(int hours) => '$hours hodinami';

  @override
  String aDay(int hours) => 'dnem';

  @override
  String days(int days) => '$days dny';

  @override
  String aboutAMonth(int days) => 'měsícem';

  @override
  String months(int months) => '$months měsíci';

  @override
  String aboutAYear(int year) => 'rokem';

  @override
  String years(int years) => '$years lety';

  @override
  String wordSeparator() => ' ';
}
