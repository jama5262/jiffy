import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class UkLocale extends Locale {
  StartOfWeek strtOfWeek;
  UkLocale(this.strtOfWeek);

  @override
  RelativeTime relativeTime() => UkRelativeTime();

  @override
  List<String>? ordinals() => null;

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class UkRelativeTime extends RelativeTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'через';
  @override
  String suffixAgo() => 'тому';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'декілька секунд';
  @override
  String aboutAMinute(int minutes) => 'хвилину';
  @override
  String minutes(int minutes) => '$minutes ${_convert(minutes, 'minutes')}';
  @override
  String aboutAnHour(int minutes) => 'годину';
  @override
  String hours(int hours) => '$hours ${_convert(hours, 'hours')}';
  @override
  String aDay(int hours) => 'день';
  @override
  String days(int days) => '$days ${_convert(days, 'days')}';
  @override
  String aboutAMonth(int days) => 'місяць';
  @override
  String months(int months) => '$months ${_convert(months, 'months')}';
  @override
  String aboutAYear(int year) => 'рік';
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
        return 'хвилину';
      case 'hours':
        return 'годину';
      case 'days':
        return 'день';
      case 'months':
        return 'місяць';
      case 'years':
        return 'рік';
      default:
        return '';
    }
  } else if (<int>[2, 3, 4].contains(mod) &&
      !<int>[12, 13, 14].contains(modH)) {
    switch (type) {
      case 'minutes':
        return 'хвилини';
      case 'hours':
        return 'години';
      case 'days':
        return 'дні';
      case 'months':
        return 'місяці';
      case 'years':
        return 'роки';
      default:
        return '';
    }
  }
  switch (type) {
    case 'minutes':
      return 'хвилин';
    case 'hours':
      return 'годин';
    case 'days':
      return 'днів';
    case 'months':
      return 'місяців';
    case 'years':
      return 'років';
    default:
      return '';
  }
}
