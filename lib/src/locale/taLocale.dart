import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class TaLocale extends Locale {
  StartOfWeek strtOfWeek;
  TaLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => TaRelativeTime();

  @override
  List<String>? ordinals() => ['வது', 'வது', 'வது', 'வது'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class TaRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'முன்';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'சில வினாடிகள்';
  @override
  String aboutAMinute(int minutes) => 'ஒரு நிமிடம்';
  @override
  String minutes(int minutes) => '$minutes நிமிடங்கள்';
  @override
  String aboutAnHour(int minutes) => 'ஒரு மணி நேரம்';
  @override
  String hours(int hours) => '$hours மணி நேரம்';
  @override
  String aDay(int hours) => 'ஒரு நாள்';
  @override
  String days(int days) => '$days நாட்கள்';
  @override
  String aboutAMonth(int days) => 'ஒரு மாதம்';
  @override
  String months(int months) => '$months மாதங்கள்';
  @override
  String aboutAYear(int year) => 'ஒரு வருடம்';
  @override
  String years(int years) => '$years ஆண்டுகள்';
  @override
  String wordSeparator() => ' ';
}
