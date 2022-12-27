import 'package:jiffy/src/enums/startOfWeek.dart';

import 'enums/units.dart';
import 'getter.dart';
import 'manipulator.dart';

class Query {
  final Getter getter;
  final Manipulator manipulator;

  Query(this.getter, this.manipulator);

  bool isBefore(
      DateTime firstDateTime, DateTime secondDateTime, StartOfWeek startOfWeek,
      [Units unit = Units.MICROSECOND]) {
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

  bool isAfter(
      DateTime firstDateTime, DateTime secondDateTime, StartOfWeek startOfWeek,
      [Units unit = Units.MICROSECOND]) {
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

  bool isSame(
      DateTime firstDateTime, DateTime secondDateTime, StartOfWeek startOfWeek,
      [Units unit = Units.MICROSECOND]) {
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

  bool isSameOrBefore(
      DateTime firstDateTime, DateTime secondDateTime, StartOfWeek startOfWeek,
      [Units unit = Units.MICROSECOND]) {
    return isSame(firstDateTime, secondDateTime, startOfWeek, unit) ||
        isBefore(firstDateTime, secondDateTime, startOfWeek, unit);
  }

  bool isSameOrAfter(
      DateTime firstDateTime, DateTime secondDateTime, StartOfWeek startOfWeek,
      [Units unit = Units.MICROSECOND]) {
    return isSame(firstDateTime, secondDateTime, startOfWeek, unit) ||
        isAfter(firstDateTime, secondDateTime, startOfWeek, unit);
  }

  bool isBetween(DateTime firstDateTime, DateTime secondDateTime,
      DateTime thirdDateTime, StartOfWeek startOfWeek,
      [Units unit = Units.MICROSECOND]) {
    return isAfter(firstDateTime, secondDateTime, startOfWeek, unit) &&
        isBefore(firstDateTime, thirdDateTime, startOfWeek, unit);
  }

  static bool isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }
}
