import 'package:jiffy/src/enums/startOfWeek.dart';

import 'enums/units.dart';
import 'getter.dart';
import 'manipulator.dart';

class Query {
  final Getter getter;
  final Manipulator manipulator;

  Query(this.getter, this.manipulator);

  bool isBefore(DateTime firstDateTime, DateTime secondDateTime, Units unit,
      StartOfWeek startOfWeek) {
    final secondDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(secondDateTime);

    if (unit == Units.MICROSECOND) {
      return getter.microsecondsSinceEpoch(firstDateTime) <
          secondDateTimeMicrosecondsSinceEpoch;
    }

    final endOfFirstDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(
            manipulator.endOf(firstDateTime, unit, startOfWeek));

    return endOfFirstDateTimeMicrosecondsSinceEpoch <
        secondDateTimeMicrosecondsSinceEpoch;
  }

  bool isAfter(DateTime firstDateTime, DateTime secondDateTime, Units unit,
      StartOfWeek startOfWeek) {
    final secondDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(secondDateTime);

    if (unit == Units.MICROSECOND) {
      return getter.microsecondsSinceEpoch(firstDateTime) >
          secondDateTimeMicrosecondsSinceEpoch;
    }

    final startOfFirstDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(
            manipulator.startOf(firstDateTime, unit, startOfWeek));

    return secondDateTimeMicrosecondsSinceEpoch <
        startOfFirstDateTimeMicrosecondsSinceEpoch;
  }

  bool isSame(DateTime firstDateTime, DateTime secondDateTime, Units unit,
      StartOfWeek startOfWeek) {
    final secondDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(secondDateTime);

    if (unit == Units.MICROSECOND) {
      return getter.microsecondsSinceEpoch(firstDateTime) ==
          secondDateTimeMicrosecondsSinceEpoch;
    }

    final startOfFirstDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(
            manipulator.startOf(firstDateTime, unit, startOfWeek));
    final endOfFirstDateTimeMicrosecondsSinceEpoch =
        getter.microsecondsSinceEpoch(
            manipulator.endOf(firstDateTime, unit, startOfWeek));

    return startOfFirstDateTimeMicrosecondsSinceEpoch <=
            secondDateTimeMicrosecondsSinceEpoch &&
        secondDateTimeMicrosecondsSinceEpoch <=
            endOfFirstDateTimeMicrosecondsSinceEpoch;
  }

  bool isSameOrBefore(DateTime firstDateTime, DateTime secondDateTime,
      Units unit, StartOfWeek startOfWeek) {
    return isSame(firstDateTime, secondDateTime, unit, startOfWeek) ||
        isBefore(firstDateTime, secondDateTime, unit, startOfWeek);
  }

  bool isSameOrAfter(DateTime firstDateTime, DateTime secondDateTime,
      Units unit, StartOfWeek startOfWeek) {
    return isSame(firstDateTime, secondDateTime, unit, startOfWeek) ||
        isAfter(firstDateTime, secondDateTime, unit, startOfWeek);
  }

  bool isBetween(DateTime firstDateTime, DateTime secondDateTime,
      DateTime thirdDateTime, Units unit, StartOfWeek startOfWeek) {
    return isAfter(firstDateTime, secondDateTime, unit, startOfWeek) &&
        isBefore(firstDateTime, thirdDateTime, unit, startOfWeek);
  }

  static bool isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }
}
