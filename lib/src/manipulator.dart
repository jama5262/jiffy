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
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime),
            getter.second(dateTime),
            getter.millisecond(dateTime),
            getter.microsecond(dateTime));
        break;
      case Units.MILLISECOND:
        newDateTime = DateTime(
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime),
            getter.second(dateTime),
            getter.millisecond(dateTime));
        break;
      case Units.SECOND:
        newDateTime = DateTime(
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime),
            getter.second(dateTime));
        break;
      case Units.MINUTE:
        newDateTime = DateTime(
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime));
        break;
      case Units.HOUR:
        newDateTime = DateTime(getter.year(dateTime), getter.month(dateTime),
            getter.date(dateTime), getter.hour(dateTime));
        break;
      case Units.DAY:
        newDateTime = DateTime(getter.year(dateTime), getter.month(dateTime),
            getter.date(dateTime));
        break;
      case Units.WEEK:
        var newDate = subtractDuration(dateTime,
            Duration(days: getter.dayOfWeek(dateTime, startOfWeek) - 1));
        newDateTime = DateTime(
            getter.year(newDate), getter.month(newDate), getter.date(newDate));
        break;
      case Units.MONTH:
        newDateTime = DateTime(getter.year(dateTime), getter.month(dateTime));
        break;
      case Units.YEAR:
        newDateTime = DateTime(getter.year(dateTime));
        break;
    }
    return newDateTime;
  }

  DateTime endOf(DateTime dateTime, Units unit, StartOfWeek startOfWeek) {
    var newDateTime;
    switch (unit) {
      case Units.MICROSECOND:
        newDateTime = DateTime(
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime),
            getter.second(dateTime),
            getter.millisecond(dateTime),
            getter.microsecond(dateTime));
        break;
      case Units.MILLISECOND:
        newDateTime = DateTime(
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime),
            getter.second(dateTime),
            getter.millisecond(dateTime),
            999);
        break;
      case Units.SECOND:
        newDateTime = DateTime(
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime),
            getter.second(dateTime),
            999,
            999);
        break;
      case Units.MINUTE:
        newDateTime = DateTime(
            getter.year(dateTime),
            getter.month(dateTime),
            getter.date(dateTime),
            getter.hour(dateTime),
            getter.minute(dateTime),
            59,
            999,
            999);
        break;
      case Units.HOUR:
        newDateTime = DateTime(getter.year(dateTime), getter.month(dateTime),
            getter.date(dateTime), getter.hour(dateTime), 59, 59, 999, 999);
        break;
      case Units.DAY:
        newDateTime = DateTime(getter.year(dateTime), getter.month(dateTime),
            getter.date(dateTime), 23, 59, 59, 999, 999);
        break;
      case Units.WEEK:
        var newDate = addDuration(
            dateTime,
            Duration(
                days: DateTime.daysPerWeek -
                    getter.dayOfWeek(dateTime, startOfWeek)));
        newDateTime = DateTime(getter.year(newDate), getter.month(newDate),
            getter.date(newDate), 23, 59, 59, 999, 999);
        break;
      case Units.MONTH:
        var endMonthDate = Getter.daysInMonthArray[getter.month(dateTime)];
        if (Query.isLeapYear(getter.year(dateTime)) &&
            getter.month(dateTime) == 2) {
          endMonthDate = 29;
        }
        newDateTime = DateTime(getter.year(dateTime), getter.month(dateTime),
            endMonthDate, 23, 59, 59, 999, 999);
        break;
      case Units.YEAR:
        newDateTime =
            DateTime(getter.year(dateTime), 12, 31, 23, 59, 59, 999, 999);
        break;
    }
    return newDateTime;
  }

  DateTime toLocal(DateTime dateTime) => dateTime.toLocal();

  DateTime toUtc(DateTime dateTime) => dateTime.toUtc();

  DateTime _addMonths(DateTime dateTime, int months) {
    final modMonths = months % 12;
    var newYear = getter.year(dateTime) + ((months - modMonths) ~/ 12);
    var newMonth = getter.month(dateTime) + modMonths;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    final newDay = min(
        getter.date(dateTime), getter.daysInMonth(DateTime(newYear, newMonth)));
    return DateTime(
        newYear,
        newMonth,
        newDay,
        getter.hour(dateTime),
        getter.minute(dateTime),
        getter.second(dateTime),
        getter.millisecond(dateTime),
        getter.microsecond(dateTime));
  }
}
