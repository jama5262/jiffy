import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class PtLocale extends Locale {
  @override
  String code() => 'pt';

  @override
  List<String> ordinals() => List.from(['º', 'º', 'º', 'º'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => PtRelativeTime();
}

class PtBrLocale extends PtLocale {
  @override
  String code() => 'pt_br';

  @override
  StartOfWeek startOfWeek() => StartOfWeek.sunday;
}

class PtRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'há';
  @override
  String prefixFromNow() => 'em';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'segundos';
  @override
  String aboutAMinute(int minutes) => 'um minuto';
  @override
  String minutes(int minutes) => '$minutes minutos';
  @override
  String aboutAnHour(int minutes) => 'uma hora';
  @override
  String hours(int hours) => '$hours horas';
  @override
  String aDay(int hours) => 'um dia';
  @override
  String days(int days) => '$days dias';
  @override
  String aboutAMonth(int days) => 'um mês';
  @override
  String months(int months) => '$months meses';
  @override
  String aboutAYear(int year) => 'um ano';
  @override
  String years(int years) => '$years anos';
  @override
  String wordSeparator() => ' ';
}
