import 'package:jiffy/src/enums/start_of_week.dart';
import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relative_date_time.dart';

class SkLocale extends Locale {
  @override
  String code() => 'sk';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => SkRelativeTime();
}

class SkRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'pred';

  @override
  String prefixFromNow() => 'za';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'pár sekundami';

  @override
  String aboutAMinute(int minutes) => 'minútou';

  @override
  String minutes(int minutes) => '$minutes minútami';

  @override
  String aboutAnHour(int minutes) => 'hodinou';

  @override
  String hours(int hours) => '$hours hodinami';

  @override
  String aDay(int hours) => 'dňom';

  @override
  String days(int days) => '$days dňami';

  @override
  String aboutAMonth(int days) => 'mesiacom';

  @override
  String months(int months) => '$months mesiacmi';

  @override
  String aboutAYear(int year) => 'rokom';

  @override
  String years(int years) => '$years rokmi';

  @override
  String wordSeparator() => ' ';
}
