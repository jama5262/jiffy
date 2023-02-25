import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class HuLocale extends Locale {
  @override
  String code() => 'hu';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => HuRelativeTime();
}

class HuHuLocale extends HuLocale {
  @override
  String code() => 'hu_hu';
}

class HuRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'ezelőtt';
  @override
  String suffixFromNow() => 'ezután';
  @override
  String lessThanOneMinute(int seconds) => 'néhány másodperccel';
  @override
  String aboutAMinute(int minutes) => 'egy perccel';
  @override
  String minutes(int minutes) => '$minutes perccel';
  @override
  String aboutAnHour(int minutes) => 'egy órával';
  @override
  String hours(int hours) => '$hours órával';
  @override
  String aDay(int hours) => 'egy nappal';
  @override
  String days(int days) => '$days nappal';
  @override
  String aboutAMonth(int days) => 'egy hónappal';
  @override
  String months(int months) => '$months hónappal';
  @override
  String aboutAYear(int year) => 'egy évvel';
  @override
  String years(int years) => '$years évvel';
  @override
  String wordSeparator() => ' ';
}
