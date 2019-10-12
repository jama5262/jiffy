import 'package:intl/intl.dart';

class Jiffy {
  DateTime _dateTime = DateTime.now();

  DateTime get dateTime => _dateTime;


  Jiffy([String time = "", String pattern = ""]);

  Jiffy.unit(num timestamp);

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
  int get year =>_dateTime.year;

//  Manipulate
  String add() {}

  String subtract() {}

  void startOf() {}

  void endOf() {}

  String local() {}

  String utc() {}

//  Display
  String format() {}

  String fromNow() {}

  String from(Jiffy jiffy) {}

  int diff(Jiffy jiffy, [String unit]) {}

  int valueOf() {}

  int unix() {}

}
