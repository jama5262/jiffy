import 'dart:math';

import 'getter.dart';
import 'enums/start_of_week.dart';
import 'enums/unit.dart';
import 'query.dart';

class Manipulator {
  final Getter _getter;

  Manipulator(this._getter);

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

  DateTime startOf(DateTime dateTime, Unit unit, StartOfWeek startOfWeek) {
    DateTime newDateTime;
    switch (unit) {
      case Unit.microsecond:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: _getter.second(dateTime),
            millisecond: _getter.millisecond(dateTime),
            microsecond: _getter.microsecond(dateTime));
        break;
      case Unit.millisecond:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: _getter.second(dateTime),
            millisecond: _getter.millisecond(dateTime),
            microsecond: 0);
        break;
      case Unit.second:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: _getter.second(dateTime),
            millisecond: 0,
            microsecond: 0);
        break;
      case Unit.minute:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: 0,
            millisecond: 0,
            microsecond: 0);
        break;
      case Unit.hour:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0);
        break;
      case Unit.day:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0);
        break;
      case Unit.week:
        var newDate = subtractDuration(dateTime,
            Duration(days: _getter.dayOfWeek(dateTime, startOfWeek) - 1));
        newDateTime = dateTime.copyWith(
            year: _getter.year(newDate),
            month: _getter.month(newDate),
            day: _getter.date(newDate),
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0);
        break;
      case Unit.month:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: 1,
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0);
        break;
      case Unit.year:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: 1,
            day: 1,
            hour: 0,
            minute: 0,
            second: 0,
            millisecond: 0,
            microsecond: 0);
        break;
    }
    return newDateTime;
  }

  DateTime endOf(DateTime dateTime, Unit unit, StartOfWeek startOfWeek) {
    DateTime newDateTime;
    switch (unit) {
      case Unit.microsecond:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: _getter.second(dateTime),
            millisecond: _getter.millisecond(dateTime),
            microsecond: _getter.microsecond(dateTime));
        break;
      case Unit.millisecond:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: _getter.second(dateTime),
            millisecond: _getter.millisecond(dateTime),
            microsecond: 999);
        break;
      case Unit.second:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: _getter.second(dateTime),
            millisecond: 999,
            microsecond: 999);
        break;
      case Unit.minute:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: _getter.minute(dateTime),
            second: 59,
            millisecond: 999,
            microsecond: 999);
        break;
      case Unit.hour:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: _getter.hour(dateTime),
            minute: 59,
            second: 59,
            millisecond: 999,
            microsecond: 999);
        break;
      case Unit.day:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: _getter.date(dateTime),
            hour: 23,
            minute: 59,
            second: 59,
            millisecond: 999,
            microsecond: 999);
        break;
      case Unit.week:
        var newDate = addDuration(
            dateTime,
            Duration(
                days: DateTime.daysPerWeek -
                    _getter.dayOfWeek(dateTime, startOfWeek)));
        newDateTime = dateTime.copyWith(
            year: _getter.year(newDate),
            month: _getter.month(newDate),
            day: _getter.date(newDate),
            hour: 23,
            minute: 59,
            second: 59,
            millisecond: 999,
            microsecond: 999);
        break;
      case Unit.month:
        var endMonthDate = Getter.daysInMonthArray[_getter.month(dateTime)];
        if (Query.isLeapYear(_getter.year(dateTime)) &&
            _getter.month(dateTime) == 2) {
          endMonthDate++;
        }
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: _getter.month(dateTime),
            day: endMonthDate,
            hour: 23,
            minute: 59,
            second: 59,
            millisecond: 999,
            microsecond: 999);
        break;
      case Unit.year:
        newDateTime = dateTime.copyWith(
            year: _getter.year(dateTime),
            month: 12,
            day: 31,
            hour: 23,
            minute: 59,
            second: 59,
            millisecond: 999,
            microsecond: 999);
        break;
    }
    return newDateTime;
  }

  DateTime toLocal(DateTime dateTime) => dateTime.toLocal();

  DateTime toUtc(DateTime dateTime) => dateTime.toUtc();

  DateTime _addMonths(DateTime dateTime, int months) {
    final modMonths = months % 12;
    var newYear = _getter.year(dateTime) + ((months - modMonths) ~/ 12);
    var newMonth = _getter.month(dateTime) + modMonths;
    if (newMonth > 12) {
      newYear++;
      newMonth -= 12;
    }
    final newDay = min(_getter.date(dateTime),
        _getter.daysInMonth(DateTime(newYear, newMonth)));
    return dateTime.copyWith(
        year: newYear,
        month: newMonth,
        day: newDay,
        hour: _getter.hour(dateTime),
        minute: _getter.minute(dateTime),
        second: _getter.second(dateTime),
        millisecond: _getter.millisecond(dateTime),
        microsecond: _getter.microsecond(dateTime));
  }
}
