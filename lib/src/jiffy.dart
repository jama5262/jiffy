import 'package:intl/intl.dart';
import 'package:jiffy/src/exception/exception.dart';

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

//  PARSE
  void parse() {}

//  MANIPULATE
//  String add() {}
//
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
//  bool _isLeapYear() {}
//
//  bool get isLeapYear => _isLeapYear();
//
//  bool isJiffy(var input) {}
//
//  bool isDateTime(var input) {}

}
