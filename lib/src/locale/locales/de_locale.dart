import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class DeLocale extends Locale {
  @override
  String code() => 'de';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => DeRelativeTime();
}

class DeDeLocale extends DeLocale {
  @override
  String code() => 'de_de';
}

class DeAtLocale extends DeLocale {
  @override
  String code() => 'de_at';
}

class DeChLocale extends DeLocale {
  @override
  String code() => 'de_ch';
}

class DeRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'vor';
  @override
  String prefixFromNow() => 'in';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'ein paar Sekunden';
  @override
  String aboutAMinute(int minutes) => 'einer Minute';
  @override
  String minutes(int minutes) => '$minutes Minuten';
  @override
  String aboutAnHour(int minutes) => 'einer Stunde';
  @override
  String hours(int hours) => '$hours Stunden';
  @override
  String aDay(int hours) => 'einem Tag';
  @override
  String days(int days) => '$days Tagen';
  @override
  String aboutAMonth(int days) => 'einem Monat';
  @override
  String months(int months) => '$months Monaten';
  @override
  String aboutAYear(int year) => 'einem Jahr';
  @override
  String years(int years) => '$years Jahren';
  @override
  String wordSeparator() => ' ';
}
