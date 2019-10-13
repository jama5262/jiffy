import 'dart:math';

import 'package:intl/intl.dart';
import 'package:jiffy/src/exception/exception.dart';
import 'package:jiffy/src/utils/normalizeUnits.dart';

class Jiffy {
  DateTime _dateTime;

  DateTime get dateTime => _dateTime;

  Jiffy([String time, String pattern]) {
    if (time != null && pattern == null) {
      throw JiffyException(
              "When passing time, a pattern must also be passed, e.g. Jiffy('12, Oct', 'dd, MMM')")
          .cause;
    }
    if (time == null && pattern == null) {
      _dateTime = DateTime.now();
    } else {
      _dateTime = DateFormat(pattern).parse(time);
    }
  }

  Jiffy.unit(int timestamp) {
    int timestampLength = timestamp.toString().length;
    if (timestampLength != 10 && timestampLength != 13) {
      throw JiffyException(
              "The timestamp passed must be in seconds or millisecods e.g. 1570963450 or 1570963450123")
          .cause;
    }
    if (timestampLength == 10) timestamp *= 1000;
    _dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  }

//  GET
  int get milliseconds => _dateTime.millisecond;
  int get seconds => _dateTime.second;
  int get minute => _dateTime.minute;
  int get hour => _dateTime.hour;
  int get date => _dateTime.day;
  int get day => _dateTime.weekday;
  int get dayOfYear => int.parse(DateFormat("D").format(_dateTime));
  int get week => ((dayOfYear - _dateTime.weekday + 10) / 7).floor();
  int get month => _dateTime.month;
  int get quarter => int.parse(DateFormat("Q").format(_dateTime));
  int get year => _dateTime.year;

//  MANIPULATE
  DateTime add(int input, String unit) {
    unit = unit == "M" ? unit : normalizeUnits(unit);
    if (unit == "0") {
      throw JiffyException(
              "Invalid unit passed, please visit to see all available units")
          .cause;
//      TODO: ADD GITHUB README URL DOC TO UNITS
    }
    if (unit == "ms") _dateTime = _dateTime.add(Duration(milliseconds: input));
    if (unit == "s") _dateTime = _dateTime.add(Duration(seconds: input));
    if (unit == "m") _dateTime = _dateTime.add(Duration(minutes: input));
    if (unit == "h") _dateTime = _dateTime.add(Duration(hours: input));
    if (unit == "d") _dateTime = _dateTime.add(Duration(days: input));
    if (unit == "w") _dateTime = _dateTime.add(Duration(days: input * 7));
    if (unit == "M") _dateTime = _addMonths(_dateTime, input);
    if (unit == "y") _dateTime = _addMonths(_dateTime, input * 12);
    return _dateTime;
  }

  static const _daysInMonthArray = [
    0,
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
  ];

  int _daysInMonth(int year, int month) {
    var result = _daysInMonthArray[month];
    if (month == 2 && isLeapYear(year)) result++;
    return result;
  }

  DateTime _addMonths(DateTime dt, int value) {
    var r = value % 12;
    var q = (value - r) ~/ 12;
    var newYear = dt.year + q;
    var newMonth = dt.month + r;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    var newDay = min(dt.day, _daysInMonth(newYear, newMonth));
    if (dt.isUtc) {
      return DateTime.utc(newYear, newMonth, newDay, dt.hour, dt.minute,
          dt.second, dt.millisecond, dt.microsecond);
    } else {
      return DateTime(newYear, newMonth, newDay, dt.hour, dt.minute, dt.second,
          dt.millisecond, dt.microsecond);
    }
  }

//  String subtract() {}
//
//  void startOf() {}
//
//  void endOf() {}
//
//  String local() {}
//
//  String utc() {}

//  DISPLAY
//  String format() {}
//
//  String fromNow() {}
//
//  String from(Jiffy jiffy) {}
//
//  int diff(Jiffy jiffy, [String unit]) {}
//
//  int valueOf() {}
//
//  int unix() {}

//  QUERY
//  bool isBefore(Jiffy jiffy) {}
//
//  bool isAfter(Jiffy jiffy) {}
//
//  bool isSame(Jiffy jiffy) {}
//
//  bool isSameOrBefore(Jiffy jiffy) {}
//
//  bool isSameOrAfter(Jiffy jiffy) {}
//
  bool isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
//
//  bool get isLeapYear => _isLeapYear();
//
//  bool isJiffy(var input) {}
//
//  bool isDateTime(var input) {}

}
