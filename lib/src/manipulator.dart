import 'dart:math';

import 'getter.dart';
import 'enums/startOfWeek.dart';
import 'enums/units.dart';
import 'query.dart';

class Manipulator {
  final Getter getter;

  Manipulator(this.getter);

  DateTime addDuration(DateTime dateTime, Duration duration) {
    return dateTime.add(duration);
  }

  DateTime add(
      DateTime dateTime,
      int microseconds,
      int milliseconds,
      int seconds,
      int minutes,
      int hours,
      int days,
      int weeks,
      int months,
      int years) {
    var newDateTime = dateTime.add(Duration(
      days: days + (weeks * 7),
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    ));
    newDateTime = _addMonths(newDateTime, months);
    newDateTime = _addMonths(newDateTime, years * 12);
    return newDateTime;
  }

  DateTime subtractDuration(DateTime dateTime, Duration duration) {
    return dateTime.subtract(duration);
  }

  DateTime subtract(
      DateTime dateTime,
      int microseconds,
      int milliseconds,
      int seconds,
      int minutes,
      int hours,
      int days,
      int weeks,
      int months,
      int years) {
    var newDateTime = dateTime.subtract(Duration(
      days: days + (weeks * 7),
      hours: hours,
      minutes: minutes,
      seconds: seconds,
      milliseconds: milliseconds,
      microseconds: microseconds,
    ));
    newDateTime = _addMonths(newDateTime, -months);
    newDateTime = _addMonths(newDateTime, -years * 12);
    return newDateTime;
  }

  DateTime startOf(DateTime dateTime, Units unit, StartOfWeek startOfWeek) {
    var newDateTime;
    switch (unit) {
      case Units.MICROSECOND:
        newDateTime = DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
            dateTime.millisecond,
            dateTime.microsecond);
        break;
      case Units.MILLISECOND:
        newDateTime = DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
            dateTime.millisecond);
        break;
      case Units.SECOND:
        newDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
            dateTime.hour, dateTime.minute, dateTime.second);
        break;
      case Units.MINUTE:
        newDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
            dateTime.hour, dateTime.minute);
        break;
      case Units.HOUR:
        newDateTime = DateTime(
            dateTime.year, dateTime.month, dateTime.day, dateTime.hour);
        break;
      case Units.DAY:
        newDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day);
        break;
      case Units.WEEK:
        var newDate = subtractDuration(dateTime,
            Duration(days: getter.dayOfWeek(dateTime, startOfWeek) - 1));
        newDateTime = DateTime(newDate.year, newDate.month, newDate.day);
        break;
      case Units.MONTH:
        newDateTime = DateTime(dateTime.year, dateTime.month);
        break;
      case Units.YEAR:
        newDateTime = DateTime(dateTime.year);
        break;
    }
    return newDateTime;
  }

  DateTime endOf(DateTime dateTime, Units unit, StartOfWeek startOfWeek) {
    var newDateTime;
    switch (unit) {
      case Units.MICROSECOND:
        newDateTime = DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
            dateTime.millisecond,
            dateTime.microsecond);
        break;
      case Units.MILLISECOND:
        newDateTime = DateTime(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
            dateTime.millisecond,
            999);
        break;
      case Units.SECOND:
        newDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
            dateTime.hour, dateTime.minute, dateTime.second, 999, 999);
        break;
      case Units.MINUTE:
        newDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
            dateTime.hour, dateTime.minute, 59, 999, 999);
        break;
      case Units.HOUR:
        newDateTime = DateTime(dateTime.year, dateTime.month, dateTime.day,
            dateTime.hour, 59, 59, 999, 999);
        break;
      case Units.DAY:
        newDateTime = DateTime(
            dateTime.year, dateTime.month, dateTime.day, 23, 59, 59, 999, 999);
        break;
      case Units.WEEK:
        var newDate = addDuration(
            dateTime,
            Duration(
                days: DateTime.daysPerWeek -
                    getter.dayOfWeek(dateTime, startOfWeek)));
        newDateTime = DateTime(
            newDate.year, newDate.month, newDate.day, 23, 59, 59, 999, 999);
        break;
      case Units.MONTH:
        var endMonthDate = Getter.daysInMonthArray[dateTime.month];
        if (Query.isLeapYear(dateTime.year) && dateTime.month == 2) {
          endMonthDate = 29;
        }
        newDateTime = DateTime(
            dateTime.year, dateTime.month, endMonthDate, 23, 59, 59, 999, 999);
        break;
      case Units.YEAR:
        newDateTime = DateTime(dateTime.year, 12, 31, 23, 59, 59, 999, 999);
        break;
    }
    return newDateTime;
  }

  DateTime toLocal(DateTime dateTime) => dateTime.toLocal();

  DateTime toUtc(DateTime dateTime) => dateTime.toUtc();

  DateTime _addMonths(DateTime dateTime, int months) {
    final modMonths = months % 12;
    var newYear = dateTime.year + ((months - modMonths) ~/ 12);
    var newMonth = dateTime.month + modMonths;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    final newDay =
        min(dateTime.day, getter.daysInMonth(DateTime(newYear, newMonth)));
    return DateTime(newYear, newMonth, newDay, dateTime.hour, dateTime.minute,
        dateTime.second, dateTime.millisecond, dateTime.microsecond);
  }
}
