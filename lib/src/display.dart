import 'package:intl/intl.dart';

import 'getter.dart';
import 'enums/units.dart';
import 'locale/locale.dart';
import 'manipulator.dart';
import 'query.dart';
import 'utils/exception.dart';

class Display {
  final Getter getter;
  final Manipulator manipulator;
  final Query query;

  Display(this.getter, this.manipulator, this.query);

  String formatToISO8601(DateTime dateTime) => dateTime.toIso8601String();

  String format(DateTime dateTime, String pattern, Locale locale) {
    if (pattern.trim().isEmpty) {
      throw JiffyException('The provided pattern for datetime `$dateTime` '
          'cannot be blank');
    }
    try {
      final escapedPattern = _replaceEscapePattern(pattern);
      final ordinal = locale.ordinal(getter.date(dateTime));
      final newPattern = _replaceOrdinalDatePattern(escapedPattern, ordinal);
      return DateFormat(newPattern).format(dateTime);
    } catch (error, stackTrace) {
      throw JiffyException('The pattern `$pattern` might be invalid: \n'
          'Error: $error'
          'Stack Trace: $stackTrace');
    }
  }

  String fromAsRelativeDateTime(
      DateTime firstDateTime, DateTime secondDateTime, Locale locale) {
    final isSecondDateTimeNowOrInTheFuture = query.isSameOrBefore(
        firstDateTime, secondDateTime, Units.MICROSECOND, locale.startOfWeek());

    final relativeTime = locale.relativeTime();
    var prefix, suffix;

    if (isSecondDateTimeNowOrInTheFuture) {
      prefix = relativeTime.prefixFromNow();
      suffix = relativeTime.suffixFromNow();
    } else {
      prefix = relativeTime.prefixAgo();
      suffix = relativeTime.suffixAgo();
    }

    final seconds =
        diff(firstDateTime, secondDateTime, Units.SECOND, false).abs();
    final minutes =
        diff(firstDateTime, secondDateTime, Units.MINUTE, false).abs();
    final hours = diff(firstDateTime, secondDateTime, Units.HOUR, false).abs();
    final days = diff(firstDateTime, secondDateTime, Units.DAY, false).abs();
    final months =
        diff(firstDateTime, secondDateTime, Units.MONTH, false).abs();
    final years = diff(firstDateTime, secondDateTime, Units.YEAR, false).abs();

    var result;

    if (seconds < 45) {
      result = relativeTime.lessThanOneMinute(seconds.round());
    } else if (seconds < 90) {
      result = relativeTime.aboutAMinute(minutes.round());
    } else if (minutes < 45) {
      result = relativeTime.minutes(minutes.round());
    } else if (minutes < 90) {
      result = relativeTime.aboutAnHour(minutes.round());
    } else if (hours < 24) {
      result = relativeTime.hours(hours.round());
    } else if (hours < 48) {
      result = relativeTime.aDay(hours.round());
    } else if (days < 30) {
      result = relativeTime.days(days.round());
    } else if (days < 60) {
      result = relativeTime.aboutAMonth(days.round());
    } else if (days < 365) {
      result = relativeTime.months(months.round());
    } else if (years < 2) {
      result = relativeTime.aboutAYear(months.round());
    } else {
      result = relativeTime.years(years.round());
    }

    return [prefix, result, suffix]
        .where((str) => str.isNotEmpty)
        .join(relativeTime.wordSeparator());
  }

  // String fromAsAbsolute(DateTime firstDateTime, DateTime secondDateTime,
  //     Units unit, Locale locale) {
  //   var result;
  //
  //   final isSecondDateTimeNowOrInTheFuture = query.isSameOrBefore(
  //       firstDateTime, secondDateTime, unit, locale.startOfWeek());
  //   var prefix = '';
  //   var suffix = '';
  //
  //   if (isSecondDateTimeNowOrInTheFuture) {
  //     prefix = 'in';
  //   } else {
  //     suffix = 'ago';
  //   }
  //
  //   final difference = diff(firstDateTime, secondDateTime, unit, true).abs();
  //
  //   switch (unit) {
  //     case Units.MICROSECOND:
  //       result = '$difference microseconds';
  //       break;
  //     case Units.MILLISECOND:
  //       result = '$difference milliseconds';
  //       break;
  //     case Units.SECOND:
  //       result = '$difference seconds';
  //       break;
  //     case Units.MINUTE:
  //       result = '$difference minutes';
  //       break;
  //     case Units.HOUR:
  //       result = '$difference hours';
  //       break;
  //     case Units.DAY:
  //       result = '$difference days';
  //       break;
  //     case Units.WEEK:
  //       result = '$difference weeks';
  //       break;
  //     case Units.MONTH:
  //       result = '$difference months';
  //       break;
  //     case Units.YEAR:
  //       result = '$difference years';
  //       break;
  //   }
  //
  //   return [prefix, result, suffix].where((str) => str.isNotEmpty).join(' ');
  // }

  num diff(DateTime firstDateTime, DateTime secondDateTime, Units unit,
      bool asFloat) {
    final firstDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(firstDateTime);
    final secondDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(secondDateTime);
    final diffMicrosecondsSinceEpoch = firstDateTimeMicrosecondsSinceEpoch -
        secondDateTimeMicrosecondsSinceEpoch;

    var diff;

    switch (unit) {
      case Units.MICROSECOND:
        diff = diffMicrosecondsSinceEpoch;
        break;
      case Units.MILLISECOND:
        diff = diffMicrosecondsSinceEpoch / Duration.microsecondsPerMillisecond;
        break;
      case Units.SECOND:
        diff = diffMicrosecondsSinceEpoch / Duration.microsecondsPerSecond;
        break;
      case Units.MINUTE:
        diff = diffMicrosecondsSinceEpoch / Duration.microsecondsPerMinute;
        break;
      case Units.HOUR:
        diff = diffMicrosecondsSinceEpoch / Duration.microsecondsPerHour;
        break;
      case Units.DAY:
        diff = diffMicrosecondsSinceEpoch / Duration.microsecondsPerDay;
        break;
      case Units.WEEK:
        diff = (diffMicrosecondsSinceEpoch / Duration.microsecondsPerDay) / 7;
        break;
      case Units.MONTH:
        diff = _monthDiff(firstDateTime, secondDateTime);
        break;
      case Units.YEAR:
        diff = _monthDiff(firstDateTime, secondDateTime) / 12;
        break;
    }

    return asFloat ? _asFloor(diff) : diff;
  }

  String _replaceEscapePattern(String input) {
    return input
        .replaceAll('\'', '\'\'')
        .replaceAll('[', '\'')
        .replaceAll(']', '\'');
  }

  String _replaceOrdinalDatePattern(String input, String ordinal) {
    var matches = _matchesOrdinalDatePattern(input);
    var pattern = input;

    while (matches.isNotEmpty) {
      final match = matches.first;
      pattern = pattern.replaceRange(
          match.start, match.end, 'd${ordinal.isNotEmpty ? "'$ordinal'" : ''}');
      matches = _matchesOrdinalDatePattern(pattern);
    }
    return pattern;
  }

  List<Match> _matchesOrdinalDatePattern(String input) {
    return RegExp('''\'[^\']*\'|(do)''')
        .allMatches(input)
        .where((match) => match.group(1) == 'do')
        .toList();
  }

  num _monthDiff(DateTime firstDateTime, DateTime secondDateTime) {
    if (getter.date(firstDateTime) < getter.date(secondDateTime)) {
      return -(_monthDiff(secondDateTime, firstDateTime));
    }

    final monthDiff =
        ((getter.year(secondDateTime) - getter.year(firstDateTime)) * 12) +
            (getter.month(secondDateTime) - getter.month(firstDateTime));

    final thirdDateTime = _addMonths(firstDateTime, monthDiff);
    final thirdDateTimeMicrosecondsSinceEpoch =
        _getMicrosecondsSinceEpoch(thirdDateTime);

    final diffMicrosecondsSinceEpoch =
        _getMicrosecondsSinceEpoch(secondDateTime) -
            thirdDateTimeMicrosecondsSinceEpoch;

    var offset;

    if (diffMicrosecondsSinceEpoch < 0) {
      final fifthDateTime = _addMonths(firstDateTime, monthDiff - 1);
      offset = diffMicrosecondsSinceEpoch /
          (thirdDateTimeMicrosecondsSinceEpoch -
              _getMicrosecondsSinceEpoch(fifthDateTime));
    } else {
      final fifthDateTime = _addMonths(firstDateTime, monthDiff + 1);
      offset = diffMicrosecondsSinceEpoch /
          (_getMicrosecondsSinceEpoch(fifthDateTime) -
              thirdDateTimeMicrosecondsSinceEpoch);
    }

    return -(monthDiff + offset);
  }

  int _asFloor(num number) => number < 0 ? number.ceil() : number.floor();

  DateTime _addMonths(DateTime dateTime, int months) {
    return manipulator.add(dateTime, 0, 0, 0, 0, 0, 0, 0, months, 0);
  }

  int _getMicrosecondsSinceEpoch(DateTime dateTime) {
    return getter.microsecondsSinceEpoch(dateTime);
  }
}
