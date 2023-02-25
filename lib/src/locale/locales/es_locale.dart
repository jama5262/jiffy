import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class EsLocale extends Locale {
  @override
  String code() => 'es';

  @override
  List<String> ordinals() => List.from(['º', 'º', 'º', 'º'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => EsRelativeTime();
}

class EsDoLocale extends EsLocale {
  @override
  String code() => 'es_do';
}

class EsUsLocale extends EsLocale {
  @override
  String code() => 'es_us';

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;
}

class EsRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'hace';
  @override
  String prefixFromNow() => 'en';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'un momento';
  @override
  String aboutAMinute(int minutes) => 'un minuto';
  @override
  String minutes(int minutes) => '$minutes minutos';
  @override
  String aboutAnHour(int minutes) => 'una hora';
  @override
  String hours(int hours) => '$hours horas';
  @override
  String aDay(int hours) => 'un día';
  @override
  String days(int days) => '$days días';
  @override
  String aboutAMonth(int days) => 'un mes';
  @override
  String months(int months) => '$months meses';
  @override
  String aboutAYear(int year) => 'un año';
  @override
  String years(int years) => '$years años';
  @override
  String wordSeparator() => ' ';
}
