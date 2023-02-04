import 'dart:math';

import 'getter.dart';
import 'enums/startOfWeek.dart';
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
    var newDateTime;
    switch (unit) {
      case Unit.MICROSECOND:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime),
            _getter.second(dateTime),
            _getter.millisecond(dateTime),
            _getter.microsecond(dateTime));
        break;
      case Unit.MILLISECOND:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime),
            _getter.second(dateTime),
            _getter.millisecond(dateTime));
        break;
      case Unit.SECOND:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime),
            _getter.second(dateTime));
        break;
      case Unit.MINUTE:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime));
        break;
      case Unit.HOUR:
        newDateTime = DateTime(_getter.year(dateTime), _getter.month(dateTime),
            _getter.date(dateTime), _getter.hour(dateTime));
        break;
      case Unit.DAY:
        newDateTime = DateTime(_getter.year(dateTime), _getter.month(dateTime),
            _getter.date(dateTime));
        break;
      case Unit.WEEK:
        var newDate = subtractDuration(dateTime,
            Duration(days: _getter.dayOfWeek(dateTime, startOfWeek) - 1));
        newDateTime = DateTime(_getter.year(newDate), _getter.month(newDate),
            _getter.date(newDate));
        break;
      case Unit.MONTH:
        newDateTime = DateTime(_getter.year(dateTime), _getter.month(dateTime));
        break;
      case Unit.YEAR:
        newDateTime = DateTime(_getter.year(dateTime));
        break;
    }
    return newDateTime;
  }

  DateTime endOf(DateTime dateTime, Unit unit, StartOfWeek startOfWeek) {
    var newDateTime;
    switch (unit) {
      case Unit.MICROSECOND:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime),
            _getter.second(dateTime),
            _getter.millisecond(dateTime),
            _getter.microsecond(dateTime));
        break;
      case Unit.MILLISECOND:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime),
            _getter.second(dateTime),
            _getter.millisecond(dateTime),
            999);
        break;
      case Unit.SECOND:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime),
            _getter.second(dateTime),
            999,
            999);
        break;
      case Unit.MINUTE:
        newDateTime = DateTime(
            _getter.year(dateTime),
            _getter.month(dateTime),
            _getter.date(dateTime),
            _getter.hour(dateTime),
            _getter.minute(dateTime),
            59,
            999,
            999);
        break;
      case Unit.HOUR:
        newDateTime = DateTime(_getter.year(dateTime), _getter.month(dateTime),
            _getter.date(dateTime), _getter.hour(dateTime), 59, 59, 999, 999);
        break;
      case Unit.DAY:
        newDateTime = DateTime(_getter.year(dateTime), _getter.month(dateTime),
            _getter.date(dateTime), 23, 59, 59, 999, 999);
        break;
      case Unit.WEEK:
        var newDate = addDuration(
            dateTime,
            Duration(
                days: DateTime.daysPerWeek -
                    _getter.dayOfWeek(dateTime, startOfWeek)));
        newDateTime = DateTime(_getter.year(newDate), _getter.month(newDate),
            _getter.date(newDate), 23, 59, 59, 999, 999);
        break;
      case Unit.MONTH:
        var endMonthDate = Getter.daysInMonthArray[_getter.month(dateTime)];
        if (Query.isLeapYear(_getter.year(dateTime)) &&
            _getter.month(dateTime) == 2) {
          endMonthDate = 29;
        }
        newDateTime = DateTime(_getter.year(dateTime), _getter.month(dateTime),
            endMonthDate, 23, 59, 59, 999, 999);
        break;
      case Unit.YEAR:
        newDateTime =
            DateTime(_getter.year(dateTime), 12, 31, 23, 59, 59, 999, 999);
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
    return DateTime(
        newYear,
        newMonth,
        newDay,
        _getter.hour(dateTime),
        _getter.minute(dateTime),
        _getter.second(dateTime),
        _getter.millisecond(dateTime),
        _getter.microsecond(dateTime));
  }
}
