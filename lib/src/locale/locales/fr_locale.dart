import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class FrLocale extends Locale {
  @override
  String code() => 'fr';

  @override
  List<String> ordinals() => List.from(['er', '', '', ''], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => FrRelativeTime();
}

class FrChLocale extends FrLocale {
  @override
  String code() => 'fr_ch';
}

class FrCaLocale extends FrLocale {
  @override
  String code() => 'fr_ca';

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;
}

class FrRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'il y a';
  @override
  String prefixFromNow() => 'dans';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'quelques secondes';
  @override
  String aboutAMinute(int minutes) => 'une minute';
  @override
  String minutes(int minutes) => '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => 'une heure';
  @override
  String hours(int hours) => '$hours heures';
  @override
  String aDay(int hours) => 'un jour';
  @override
  String days(int days) => '$days jours';
  @override
  String aboutAMonth(int days) => 'un mois';
  @override
  String months(int months) => '$months mois';
  @override
  String aboutAYear(int year) => 'un an';
  @override
  String years(int years) => '$years ans';
  @override
  String wordSeparator() => ' ';
}
