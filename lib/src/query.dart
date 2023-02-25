import 'enums/start_of_week.dart';
import 'enums/unit.dart';
import 'getter.dart';
import 'manipulator.dart';

class Query {
  final Getter _getter;
  final Manipulator _manipulator;

  Query(this._getter, this._manipulator);

  bool isBefore(DateTime firstDateTime, DateTime secondDateTime, Unit unit,
      StartOfWeek startOfWeek) {
    final secondDateTimeMicrosecondsSinceEpoch =
        _getter.microsecondsSinceEpoch(secondDateTime);

    if (unit == Unit.microsecond) {
      return _getter.microsecondsSinceEpoch(firstDateTime) <
          secondDateTimeMicrosecondsSinceEpoch;
    }

    final endOfFirstDateTimeMicrosecondsSinceEpoch =
        _getter.microsecondsSinceEpoch(
            _manipulator.endOf(firstDateTime, unit, startOfWeek));

    return endOfFirstDateTimeMicrosecondsSinceEpoch <
        secondDateTimeMicrosecondsSinceEpoch;
  }

  bool isAfter(DateTime firstDateTime, DateTime secondDateTime, Unit unit,
      StartOfWeek startOfWeek) {
    final secondDateTimeMicrosecondsSinceEpoch =
        _getter.microsecondsSinceEpoch(secondDateTime);

    if (unit == Unit.microsecond) {
      return _getter.microsecondsSinceEpoch(firstDateTime) >
          secondDateTimeMicrosecondsSinceEpoch;
    }

    final startOfFirstDateTimeMicrosecondsSinceEpoch =
        _getter.microsecondsSinceEpoch(
            _manipulator.startOf(firstDateTime, unit, startOfWeek));

    return secondDateTimeMicrosecondsSinceEpoch <
        startOfFirstDateTimeMicrosecondsSinceEpoch;
  }

  bool isSame(DateTime firstDateTime, DateTime secondDateTime, Unit unit,
      StartOfWeek startOfWeek) {
    final secondDateTimeMicrosecondsSinceEpoch =
        _getter.microsecondsSinceEpoch(secondDateTime);

    if (unit == Unit.microsecond) {
      return _getter.microsecondsSinceEpoch(firstDateTime) ==
          secondDateTimeMicrosecondsSinceEpoch;
    }

    final startOfFirstDateTimeMicrosecondsSinceEpoch =
        _getter.microsecondsSinceEpoch(
            _manipulator.startOf(firstDateTime, unit, startOfWeek));
    final endOfFirstDateTimeMicrosecondsSinceEpoch =
        _getter.microsecondsSinceEpoch(
            _manipulator.endOf(firstDateTime, unit, startOfWeek));

    return startOfFirstDateTimeMicrosecondsSinceEpoch <=
            secondDateTimeMicrosecondsSinceEpoch &&
        secondDateTimeMicrosecondsSinceEpoch <=
            endOfFirstDateTimeMicrosecondsSinceEpoch;
  }

  bool isSameOrBefore(DateTime firstDateTime, DateTime secondDateTime,
      Unit unit, StartOfWeek startOfWeek) {
    return isSame(firstDateTime, secondDateTime, unit, startOfWeek) ||
        isBefore(firstDateTime, secondDateTime, unit, startOfWeek);
  }

  bool isSameOrAfter(DateTime firstDateTime, DateTime secondDateTime, Unit unit,
      StartOfWeek startOfWeek) {
    return isSame(firstDateTime, secondDateTime, unit, startOfWeek) ||
        isAfter(firstDateTime, secondDateTime, unit, startOfWeek);
  }

  bool isBetween(DateTime firstDateTime, DateTime secondDateTime,
      DateTime thirdDateTime, Unit unit, StartOfWeek startOfWeek) {
    return isAfter(firstDateTime, secondDateTime, unit, startOfWeek) &&
        isBefore(firstDateTime, thirdDateTime, unit, startOfWeek);
  }

  static bool isUtc(DateTime dateTime) => dateTime.isUtc;

  static bool isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }
}
