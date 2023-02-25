import 'package:intl/intl.dart';

import 'enums/start_of_week.dart';
import 'query.dart';

class Getter {
  DateTime dateTime(DateTime dateTime) => dateTime.copyWith();

  int microsecond(DateTime dateTime) => dateTime.microsecond;

  int microsecondsSinceEpoch(DateTime dateTime) {
    return dateTime.microsecondsSinceEpoch;
  }

  int millisecond(DateTime dateTime) => dateTime.millisecond;

  int millisecondsSinceEpoch(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  int second(DateTime dateTime) => dateTime.second;

  int minute(DateTime dateTime) => dateTime.minute;

  int hour(DateTime dateTime) => dateTime.hour;

  int date(DateTime dateTime) => dateTime.day;

  int dayOfWeek(DateTime dateTime, StartOfWeek startOfWeek) {
    var weekDays = [1, 2, 3, 4, 5, 6, 7, 1, 2];
    var weekDayIndex = dateTime.weekday - 1;

    switch (startOfWeek) {
      case StartOfWeek.monday:
        break;
      case StartOfWeek.sunday:
        weekDayIndex += 1;
        break;
      case StartOfWeek.saturday:
        weekDayIndex += 2;
        break;
    }

    return weekDays[weekDayIndex];
  }

  int daysInMonth(DateTime dateTime) =>
      _daysInMonth(dateTime.year, dateTime.month);

  int weekOfYear(DateTime dateTime, StartOfWeek startOfWeek) {
    return ((dayOfYear(dateTime) - dayOfWeek(dateTime, startOfWeek) + 10) / 7)
        .floor();
  }

  int month(DateTime dateTime) => dateTime.month;

  int quarterOfYear(DateTime dateTime) {
    return int.parse(DateFormat('Q').format(dateTime));
  }

  int dayOfYear(DateTime dateTime) {
    return int.parse(DateFormat('D').format(dateTime));
  }

  int year(DateTime dateTime) => dateTime.year;

  int _daysInMonth(int year, int month) {
    var result = daysInMonthArray[month];
    if (month == 2 && Query.isLeapYear(year)) result++;
    return result;
  }

  static final List<int> daysInMonthArray = List.from(
      [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],
      growable: false);
}
