import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/locale/relativeTime.dart';

abstract class Locale {
  late String code;

  // If a locale does not have ordinals return null
  List<String>? ordinals();

  RelativeTime relativeTime();

  StartOfWeek startOfWeek();

  String getRelativeTime(DateTime date1, [DateTime? date2]) {
    final relative = relativeTime();
    final _date2 = date2 ?? DateTime.now();
    final _allowFromNow = _date2.isBefore(date1);
    var elapsed = _date2.millisecondsSinceEpoch - date1.millisecondsSinceEpoch;

    String prefix, suffix;

    if (_allowFromNow && elapsed < 0) {
      elapsed = date1.isBefore(_date2) ? elapsed : elapsed.abs();
      prefix = relative.prefixFromNow();
      suffix = relative.suffixFromNow();
    } else {
      prefix = relative.prefixAgo();
      suffix = relative.suffixAgo();
    }

    final num seconds = elapsed / 1000;
    final num minutes = seconds / 60;
    final num hours = minutes / 60;
    final num days = hours / 24;
    final num months = days / 30;
    final num years = days / 365;

    String result;
    if (seconds < 45) {
      result = relative.lessThanOneMinute(seconds.round());
    } else if (seconds < 90) {
      result = relative.aboutAMinute(minutes.round());
    } else if (minutes < 45) {
      result = relative.minutes(minutes.round());
    } else if (minutes < 90) {
      result = relative.aboutAnHour(minutes.round());
    } else if (hours < 24) {
      result = relative.hours(hours.round());
    } else if (hours < 48) {
      result = relative.aDay(hours.round());
    } else if (days < 30) {
      result = relative.days(days.round());
    } else if (days < 60) {
      result = relative.aboutAMonth(days.round());
    } else if (days < 365) {
      result = relative.months(months.round());
    } else if (years < 2) {
      result = relative.aboutAYear(months.round());
    } else {
      result = relative.years(years.round());
    }

    return [prefix, result, suffix]
        .where((str) => str.isNotEmpty)
        .join(relative.wordSeparator());
  }

  String ordinal(int day) {
    if (ordinals() == null) return '';
    var suffix = ordinals()!.last;
    var digit = day % 10;
    if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
      suffix = ordinals()![digit - 1];
    }
    return suffix;
  }
}
