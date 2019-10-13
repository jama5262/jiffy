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

  Jiffy.unix(int timestamp) {
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
  void add(int input, String units) {
    units = validateUnits(units);
    if (units == "ms") _dateTime = _dateTime.add(Duration(milliseconds: input));
    if (units == "s") _dateTime = _dateTime.add(Duration(seconds: input));
    if (units == "m") _dateTime = _dateTime.add(Duration(minutes: input));
    if (units == "h") _dateTime = _dateTime.add(Duration(hours: input));
    if (units == "d") _dateTime = _dateTime.add(Duration(days: input));
    if (units == "w") _dateTime = _dateTime.add(Duration(days: input * 7));
    if (units == "M") _dateTime = _addMonths(_dateTime, input);
    if (units == "y") _dateTime = _addMonths(_dateTime, input * 12);
  }

  void subtract(int input, String units) {
    units = validateUnits(units);
    if (units == "ms") {
      _dateTime = _dateTime.subtract(Duration(milliseconds: input));
    }
    if (units == "s") _dateTime = _dateTime.subtract(Duration(seconds: input));
    if (units == "m") _dateTime = _dateTime.subtract(Duration(minutes: input));
    if (units == "h") _dateTime = _dateTime.subtract(Duration(hours: input));
    if (units == "d") _dateTime = _dateTime.subtract(Duration(days: input));
    if (units == "w") _dateTime = _dateTime.subtract(Duration(days: input * 7));
    if (units == "M") _dateTime = _addMonths(_dateTime, -input);
    if (units == "y") _dateTime = _addMonths(_dateTime, -input * 12);
  }

  void startOf(String units) {
    units = validateUnits(units);
    switch (units) {
      case "ms":
        _dateTime = DateTime(
            _dateTime.year,
            _dateTime.month,
            _dateTime.day,
            _dateTime.hour,
            _dateTime.minute,
            _dateTime.second,
            _dateTime.millisecond);
        break;
      case "s":
        _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute, _dateTime.second);
        break;
      case "m":
        _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute);
        break;
      case "h":
        _dateTime = DateTime(
            _dateTime.year, _dateTime.month, _dateTime.day, _dateTime.hour);
        break;
      case "d":
        _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day);
        break;
      case "w":
        int weekDay = _dateTime.weekday;
        if (weekDay == DateTime.daysPerWeek) weekDay -= DateTime.daysPerWeek;
        var newDate = _dateTime.subtract(Duration(days: weekDay));
        _dateTime = DateTime(newDate.year, newDate.month, newDate.day);
        break;
      case "M":
        _dateTime = DateTime(_dateTime.year, _dateTime.month, 1);
        break;
      case "y":
        _dateTime = DateTime(_dateTime.year);
        break;
    }
  }

  void endOf(String units) {
    units = validateUnits(units);
    switch (units) {
      case "ms":
        _dateTime = DateTime(
            _dateTime.year,
            _dateTime.month,
            _dateTime.day,
            _dateTime.hour,
            _dateTime.minute,
            _dateTime.second,
            _dateTime.millisecond);
        break;
      case "s":
        _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute, _dateTime.second, 999);
        break;
      case "m":
        _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, _dateTime.minute, 59, 999);
        break;
      case "h":
        _dateTime = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,
            _dateTime.hour, 59, 59, 999);
        break;
      case "d":
        _dateTime = DateTime(
            _dateTime.year, _dateTime.month, _dateTime.day, 23, 59, 59, 999);
        break;
      case "w":
        int weekDay = _dateTime.weekday;
        if (weekDay == DateTime.daysPerWeek) weekDay -= DateTime.daysPerWeek;
        var newDate =
            _dateTime.add(Duration(days: DateTime.daysPerWeek - weekDay - 1));
        _dateTime =
            DateTime(newDate.year, newDate.month, newDate.day, 23, 59, 59, 999);
        break;
      case "M":
        _dateTime = DateTime(_dateTime.year, _dateTime.month,
            _daysInMonthArray[_dateTime.month], 23, 59, 59, 999);
        break;
      case "y":
        _dateTime = DateTime(_dateTime.year, 12, 31, 23, 59, 59, 999);
        break;
    }
  }
//
//  String local() {}
//
//  String utc() {}

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

//  DISPLAY
//  String format() {}
//
//  String fromNow() {}
//
//  String from(Jiffy jiffy) {}
//
//  int diff(Jiffy jiffy, [String units]) {}
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
