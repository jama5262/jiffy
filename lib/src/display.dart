import 'package:intl/intl.dart';

import 'getter.dart';
import 'enums/units.dart';
import 'manipulator.dart';
import 'utils/exception.dart';

class Display {
  final Getter getter;
  final Manipulator manipulator;

  Display(this.getter, this.manipulator);

  String formatToISO8601(DateTime dateTime) => dateTime.toIso8601String();

  String format(DateTime dateTime, String pattern, String ordinal) {
    final escapedPattern = _replaceEscapePattern(pattern);
    final newPattern = _replaceOrdinalDatePattern(escapedPattern, ordinal);
    try {
      return DateFormat(newPattern).format(dateTime);
    } on Exception catch (e) {
      throw JiffyException(e.toString());
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
    return input.replaceAll('[', '\'').replaceAll(']', '\'');
  }

  String _replaceOrdinalDatePattern(String input, String suffix) {
    final regex = _matchesOrdinalDatePattern().allMatches(input);
    var pattern = input;
    regex.forEach((match) {
      if (match.group(1) == 'do') {
        pattern = input.replaceRange(
            match.start, match.end, 'd${suffix.isNotEmpty ? "'$suffix'" : ''}');
      }
    });
    return pattern;
  }

  // todo understand what this regex pattern does
  Pattern _matchesOrdinalDatePattern() {
    return RegExp(
        '''(?<unquote>[^"'\\s]\\w*)|(?:["][^"]+?["])|(?:['][^']+?['])''');
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

  int _absFloor(num number) {
    if (number < 0) {
      return number.ceil();
    } else {
      return number.floor();
    }
  }

  DateTime _addMonths(DateTime dateTime, int months) {
    return manipulator.add(dateTime, 0, 0, 0, 0, 0, 0, 0, months, 0);
  }

  int getMicrosecondsSinceEpoch(DateTime dateTime) {
    return getter.microsecondsSinceEpoch(dateTime);
  }
}
