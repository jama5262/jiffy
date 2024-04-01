import 'package:jiffy/src/enums/start_of_week.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relative_date_time.dart';

class SkLocale extends Locale {
  @override
  String code() => 'sw';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => SkRelativeTime();
}

class SkRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'kabla ya';

  @override
  String prefixFromNow() => 'kutoka sasa';

  @override
  String suffixAgo() => 'iliyopita';

  @override
  String suffixFromNow() => 'kuanzia sasa';

  @override
  String lessThanOneMinute(int seconds) => 'sekunde chache zilizopita';

  @override
  String aboutAMinute(int minutes) => 'dakika moja iliyopita';

  @override
  String minutes(int minutes) => 'dakika $minutes zilizopita';

  @override
  String aboutAnHour(int minutes) => 'saa moja iliyopita';

  @override
  String hours(int hours) => 'masaa $hours yaliyopita';

  @override
  String aDay(int hours) => 'siku moja iliyopita';

  @override
  String days(int days) => 'siku $days zilizopita';

  @override
  String aboutAMonth(int days) => 'mwezi moja uliopita';

  @override
  String months(int months) => 'miezi $months iliyopita';

  @override
  String aboutAYear(int year) => 'mwaka moja uliopita';

  @override
  String years(int years) => 'miaka $years iliyopita';

  @override
  String wordSeparator() => ' ';
}
