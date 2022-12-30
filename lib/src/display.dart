import 'package:intl/intl.dart';

import 'getter.dart';
import 'enums/units.dart';
import 'locale/locale.dart';
import 'manipulator.dart';
import 'utils/exception.dart';

class Display {
  final Getter getter;
  final Manipulator manipulator;

  Display(this.getter, this.manipulator);

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

  String from(DateTime firstDateTime, DateTime secondDateTime) {
    return '';
  }

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

    return asFloat ? _absFloor(diff) : diff;
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
        getMicrosecondsSinceEpoch(thirdDateTime);

    final diffMicrosecondsSinceEpoch =
        getMicrosecondsSinceEpoch(secondDateTime) -
            thirdDateTimeMicrosecondsSinceEpoch;

    var offset;

    if (diffMicrosecondsSinceEpoch < 0) {
      final fifthDateTime = _addMonths(firstDateTime, monthDiff - 1);
      offset = diffMicrosecondsSinceEpoch /
          (thirdDateTimeMicrosecondsSinceEpoch -
              getMicrosecondsSinceEpoch(fifthDateTime));
    } else {
      final fifthDateTime = _addMonths(firstDateTime, monthDiff + 1);
      offset = diffMicrosecondsSinceEpoch /
          (getMicrosecondsSinceEpoch(fifthDateTime) -
              thirdDateTimeMicrosecondsSinceEpoch);
    }

    return -(monthDiff + offset);
  }

  int _absFloor(num number) => number < 0 ? number.ceil() : number.floor();

  DateTime _addMonths(DateTime dateTime, int months) {
    return manipulator.add(dateTime, 0, 0, 0, 0, 0, 0, 0, months, 0);
  }

  int getMicrosecondsSinceEpoch(DateTime dateTime) {
    return getter.microsecondsSinceEpoch(dateTime);
  }
}
