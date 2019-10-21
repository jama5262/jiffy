import 'dart:math';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/src/exception/exception.dart';
import 'package:jiffy/src/relative_time/relative_time.dart' as relative;
import 'package:jiffy/src/utils/normalize_units.dart';
import 'package:jiffy/src/utils/regex.dart';

class Jiffy {
  DateTime _dateTime;
  DateTime get dateTime => _dateTime;

  Jiffy([var input, String pattern]) {
    _dateTime = _parse(input, pattern);
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

  DateTime _parse(var input, [String pattern]) {
    var dateTime;
    if (input == null && pattern == null) {
      dateTime = DateTime.now();
    } else if (isDateTime(input)) {
      dateTime = input;
    } else if (isJiffy(input)) {
      dateTime = input.dateTime;
    } else if (input is Map) {
      input.forEach((key, value) {
        validateUnits(key);
      });
      if (input.isEmpty) {
        dateTime = DateTime.now();
      } else {
        dateTime = DateTime(
            input["year"] ??
                input["years"] ??
                input["y"] ??
                DateTime.now().year,
            input["month"] ?? input["months"] ?? input["M"] ?? 1,
            input["day"] ?? input["days"] ?? input["d"] ?? 1,
            input["hour"] ?? input["hours"] ?? input["h"] ?? 0,
            input["minute"] ?? input["minutes"] ?? input["m"] ?? 0,
            input["second"] ?? input["seconds"] ?? input["s"] ?? 0,
            input["millisecond"] ?? input["milliseconds"] ?? input["ms"] ?? 0);
      }
    } else if (input is List) {
      if (input.isEmpty) {
        dateTime = DateTime.now();
      } else {
        dateTime = DateTime(
            input[0],
            input.length > 1 ? input[1] : 1,
            input.length > 2 ? input[2] : 1,
            input.length > 3 ? input[3] : 0,
            input.length > 4 ? input[4] : 0,
            input.length > 5 ? input[5] : 0,
            input.length > 6 ? input[6] : 0);
      }
    } else if (input is String) {
      if (matchStringDateTime(input)) {
        dateTime = DateFormat("yyyy-MM-dd").parse(input);
      } else if (pattern != null) {
        dateTime = DateFormat(pattern)
            .parse(input.replaceFirst(' pm', ' PM').replaceFirst(' am', ' AM'));
      } else if (pattern == null) {
        throw JiffyException(
                "Date time not recognized, a pattern must be passed, e.g. Jiffy('12, Oct', 'dd, MMM')")
            .cause;
      }
    }
    return dateTime;
  }

  static String _defaultLocale = "en";
  static Future<String> locale([String locale]) async {
    if (locale != null) {
      await initializeDateFormatting();
      Intl.defaultLocale = locale;
      _defaultLocale = locale;
    }
    return Future.value(_defaultLocale);
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
  DateTime add(int input, String units) {
    units = validateUnits(units);
    switch (units) {
      case "ms":
        _dateTime = _dateTime.add(Duration(milliseconds: input));
        break;
      case "s":
        _dateTime = _dateTime.add(Duration(seconds: input));
        break;
      case "m":
        _dateTime = _dateTime.add(Duration(minutes: input));
        break;
      case "h":
        _dateTime = _dateTime.add(Duration(hours: input));
        break;
      case "d":
        _dateTime = _dateTime.add(Duration(days: input));
        break;
      case "w":
        _dateTime = _dateTime.add(Duration(days: input * 7));
        break;
      case "M":
        _dateTime = _addMonths(_dateTime, input);
        break;
      case "y":
        _dateTime = _addMonths(_dateTime, input * 12);
        break;
    }
    return _dateTime;
  }

  DateTime subtract(int input, String units) {
    units = validateUnits(units);
    switch (units) {
      case "ms":
        _dateTime = _dateTime.subtract(Duration(milliseconds: input));
        break;
      case "s":
        _dateTime = _dateTime.subtract(Duration(seconds: input));
        break;
      case "m":
        _dateTime = _dateTime.subtract(Duration(minutes: input));
        break;
      case "h":
        _dateTime = _dateTime.subtract(Duration(hours: input));
        break;
      case "d":
        _dateTime = _dateTime.subtract(Duration(days: input));
        break;
      case "w":
        _dateTime = _dateTime.subtract(Duration(days: input * 7));
        break;
      case "M":
        _dateTime = _addMonths(_dateTime, -input);
        break;
      case "y":
        _dateTime = _addMonths(_dateTime, -input * 12);
        break;
    }
    return _dateTime;
  }

  DateTime startOf(String units) {
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
    return _dateTime;
  }

  DateTime endOf(String units) {
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
        int date = _daysInMonthArray[_dateTime.month];
        if (_isLeapYear(_dateTime.year) && _dateTime.month == 2) {
          date = 29;
        }
        _dateTime =
            DateTime(_dateTime.year, _dateTime.month, date, 23, 59, 59, 999);
        break;
      case "y":
        _dateTime = DateTime(_dateTime.year, 12, 31, 23, 59, 59, 999);
        break;
    }
    return _dateTime;
  }

  DateTime local() {
    return _dateTime = _dateTime.toLocal();
  }

  DateTime utc() {
    return _dateTime = _dateTime.toUtc();
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
    if (month == 2 && _isLeapYear(year)) result++;
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
  String format([String pattern]) {
    if (pattern == null) return _dateTime.toIso8601String();
    return DateFormat(pattern).format(_dateTime);
  }

  String get E => DateFormat.E().format(_dateTime);
  String get EEEE => DateFormat.EEEE().format(_dateTime);
  String get LLL => DateFormat.LLL().format(_dateTime);
  String get LLLL => DateFormat.LLLL().format(_dateTime);
  String get Md => DateFormat.Md().format(_dateTime);
  String get MEd => DateFormat.MEd().format(_dateTime);
  String get MMM => DateFormat.MMM().format(_dateTime);
  String get MMMd => DateFormat.MMMd().format(_dateTime);
  String get MMMEd => DateFormat.MMMEd().format(_dateTime);
  String get MMMM => DateFormat.MMMM().format(_dateTime);
  String get MMMMd => DateFormat.MMMMd().format(_dateTime);
  String get MMMMEEEEd => DateFormat.MMMMEEEEd().format(_dateTime);
  String get QQQ => DateFormat.QQQ().format(_dateTime);
  String get QQQQ => DateFormat.QQQQ().format(_dateTime);
  String get yM => DateFormat.yM().format(_dateTime);
  String get yMd => DateFormat.yMd().format(_dateTime);
  String get yMEd => DateFormat.yMEd().format(_dateTime);
  String get yMMM => DateFormat.yMMM().format(_dateTime);
  String get yMMMd => DateFormat.yMMMd().format(_dateTime);
  String get yMMMdjm => DateFormat.yMMMd().add_jm().format(_dateTime);
  String get yMMMEd => DateFormat.yMMMEd().format(_dateTime);
  String get yMMMEdjm => DateFormat.yMMMEd().add_jm().format(_dateTime);
  String get yMMMM => DateFormat.yMMMM().format(_dateTime);
  String get yMMMMd => DateFormat.yMMMMd().format(_dateTime);
  String get yMMMMdjm => DateFormat.yMMMMd().add_jm().format(_dateTime);
  String get yMMMMEEEEd => DateFormat.yMMMMEEEEd().format(_dateTime);
  String get yMMMMEEEEdjm => DateFormat.yMMMMEEEEd().add_jm().format(_dateTime);
  String get yQQQ => DateFormat.yQQQ().format(_dateTime);
  String get yQQQQ => DateFormat.yQQQQ().format(_dateTime);
  String get Hm => DateFormat.Hm().format(_dateTime);
  String get Hms => DateFormat.Hms().format(_dateTime);
  String get j => DateFormat.j().format(_dateTime);
  String get jm => DateFormat.jm().format(_dateTime);
  String get jms => DateFormat.jms().format(_dateTime);

  String fromNow() {
    return relative.format(_defaultLocale, _dateTime);
  }

  String from(var input) {
    var dateTime = _parse(input);
    return relative.format(_defaultLocale, _dateTime, dateTime);
  }

  num diff(var input, [String units = "ms", bool asFloat = false]) {
    var dateTime = _parse(input);
    units = validateUnits(units);
    num diff;
    switch (units) {
      case "ms":
        diff = _dateTime.difference(dateTime).inMilliseconds;
        break;
      case "s":
        diff = _dateTime.difference(dateTime).inSeconds;
        break;
      case "m":
        diff = _dateTime.difference(dateTime).inMinutes;
        break;
      case "h":
        diff = _dateTime.difference(dateTime).inHours;
        break;
      case "d":
        diff = _dateTime.difference(dateTime).inDays;
        break;
      case "w":
        diff = _dateTime.difference(dateTime).inDays / 7;
        break;
      case "M":
        diff = _monthDiff(_dateTime, dateTime);
        break;
      case "y":
        diff = _monthDiff(_dateTime, dateTime) / 12;
        break;
    }
    if (!asFloat) return _absFloor(diff);
    return diff;
  }

  num _monthDiff(DateTime a, DateTime b) {
    int wholeMonthDiff = ((b.year - a.year) * 12) + (b.month - a.month);
    DateTime anchor = _addMonths(a, wholeMonthDiff);
    DateTime anchor2;
    var adjust;

    if (b.millisecondsSinceEpoch - anchor.millisecondsSinceEpoch < 0) {
      anchor2 = _addMonths(a, wholeMonthDiff - 1);
      adjust = (b.millisecondsSinceEpoch - anchor.millisecondsSinceEpoch) /
          (anchor.millisecondsSinceEpoch - anchor2.millisecondsSinceEpoch);
    } else {
      anchor2 = _addMonths(a, wholeMonthDiff + 1);
      adjust = (b.millisecondsSinceEpoch - anchor.millisecondsSinceEpoch) /
          (anchor2.millisecondsSinceEpoch - anchor.millisecondsSinceEpoch);
    }
    return -(wholeMonthDiff + adjust) ?? 0;
  }

  int _absFloor(num number) {
    if (number < 0) {
      return number.ceil() ?? 0;
    } else {
      return number.floor();
    }
  }

  int valueOf() {
    return _dateTime.millisecondsSinceEpoch;
  }

  int unix() {
    return (_dateTime.millisecondsSinceEpoch / 1000).round();
  }

//  QUERY
  bool isBefore(var input, [String units = "ms"]) {
    var dateTime = _parse(input);
    units = validateUnits(units);
    if (units == "ms") {
      return valueOf() < dateTime.millisecondsSinceEpoch;
    }
    endOf(units);
    return valueOf() < dateTime.millisecondsSinceEpoch;
  }

  bool isAfter(var input, [String units = "ms"]) {
    var dateTime = _parse(input);
    units = validateUnits(units);
    if (units == "ms") {
      return valueOf() > dateTime.millisecondsSinceEpoch;
    }
    startOf(units);
    return dateTime.millisecondsSinceEpoch < valueOf();
  }

  bool isSame(var input, [String units = "ms"]) {
    var dateTime = _parse(input);
    units = validateUnits(units);
    if (units == "ms") {
      return valueOf() == dateTime.millisecondsSinceEpoch;
    }
    int jiffyMs = dateTime.millisecondsSinceEpoch;
    return startOf(units).millisecondsSinceEpoch <= jiffyMs &&
        jiffyMs <= endOf(units).millisecondsSinceEpoch;
  }

  bool isSameOrBefore(var input, [String units = "ms"]) {
    var dateTime = _parse(input);
    return isSame(dateTime, units) || isBefore(dateTime, units);
  }

  bool isSameOrAfter(var input, [String units = "ms"]) {
    var dateTime = _parse(input);
    return isSame(dateTime, units) || isAfter(dateTime, units);
  }

  bool isBetween(var inputFrom, var inputTo, [String units = "ms"]) {
    var dateTimeFrom = _parse(inputFrom);
    var dateTimeTo = _parse(inputTo);
    return isAfter(dateTimeFrom, units) && isBefore(dateTimeTo, units);
  }

  bool _isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  bool get isLeapYear => _isLeapYear(_dateTime.year);

  static bool isJiffy(var input) => input is Jiffy;

  static bool isDateTime(var input) => input is DateTime;
}
