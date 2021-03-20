import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class AzLocale extends Locale {
  StartOfWeek strtOfWeek;
  AzLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => AzRelativeTime();

  @override
  List<String>? ordinals() => null;

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class AzRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'geri';
  @override
  String suffixFromNow() => 'sonra';
  @override
  String lessThanOneMinute(int seconds) => 'bir neçə saniyə';
  @override
  String aboutAMinute(int minutes) => 'dəqiqə';
  @override
  String minutes(int minutes) => '$minutes ${_convert(minutes, 'minutes')}';
  @override
  String aboutAnHour(int minutes) => 'saat';
  @override
  String hours(int hours) => '$hours ${_convert(hours, 'hours')}';
  @override
  String aDay(int hours) => 'gün';
  @override
  String days(int days) => '$days ${_convert(days, 'days')}';
  @override
  String aboutAMonth(int days) => 'ay';
  @override
  String months(int months) => '$months ${_convert(months, 'months')}';
  @override
  String aboutAYear(int year) => 'il';
  @override
  String years(int years) => '$years ${_convert(years, 'years')}';
  @override
  String wordSeparator() => ' ';
}

String _convert(int number, String type) {
  var mod = number % 10;
  var modH = number % 100;

  if (mod == 1 && modH != 11) {
    switch (type) {
      case 'minutes':
        return 'dəqiqə';
      case 'hours':
        return 'saat';
      case 'days':
        return 'gün';
      case 'months':
        return 'ay';
      case 'years':
        return 'il';
      default:
        return '';
    }
  } else if (<int>[2, 3, 4].contains(mod) &&
      !<int>[12, 13, 14].contains(modH)) {
    switch (type) {
      case 'minutes':
        return 'dəqiqə';
      case 'hours':
        return 'saat';
      case 'days':
        return 'gün';
      case 'months':
        return 'ay';
      case 'years':
        return 'il';
      default:
        return '';
    }
  }
  switch (type) {
    case 'minutes':
      return 'dəqiqə';
    case 'hours':
      return 'saat';
    case 'days':
      return 'gün';
    case 'months':
      return 'ay';
    case 'years':
      return 'il';
    default:
      return '';
  }
}
