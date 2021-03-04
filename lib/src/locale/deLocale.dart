import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';

class DeLocale extends Locale {
  @override
  RelativeTime relativeTime() => DeRelativeTime();

  @override
  List<String>? ordinals() => ['.', '.', '.', '.'];

}

class DeRelativeTime extends RelativeTime {
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