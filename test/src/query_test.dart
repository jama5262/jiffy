import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/getter.dart';
import 'package:jiffy/src/manipulator.dart';
import 'package:jiffy/src/query.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final getter = Getter();
  final manipulator = Manipulator(getter);
  final underTest = Query(getter, manipulator);

  group('Test isBefore query', () {
    for (var testData in isBeforeDateTimeTestData()) {
      test('Should successfully return if datetime is before', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualIsBefore = underTest.isBefore(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualIsBefore, testData['expectedIsBefore']);
      });
    }

    for (var testData in isBeforeDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is before with start of week',
          () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualIsBefore = underTest.isBefore(testData['firstDateTime'],
            testData['secondDateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualIsBefore, testData['expectedIsBefore']);
      });
    }
  });

  group('Test isAfter query', () {
    for (var testData in isAfterDateTimeTestData()) {
      test('Should successfully return if datetime is after', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualIsAfter = underTest.isAfter(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualIsAfter, testData['expectedIsAfter']);
      });
    }

    for (var testData in isAfterDateTimeWithStartOfWeekTestData()) {
      test('Should successfully return if datetime is after with start of week',
          () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualIsAfter = underTest.isAfter(testData['firstDateTime'],
            testData['secondDateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualIsAfter, testData['expectedIsAfter']);
      });
    }
  });

  group('Test isSame query', () {
    for (var testData in isSameDateTimeTestData()) {
      test('Should successfully return if datetime is same', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualIsSame = underTest.isSame(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualIsSame, testData['expectedIsSame']);
      });
    }

    for (var testData in isSameDateTimeWithStartOfWeekTestData()) {
      test('Should successfully return if datetime is same with start of week',
          () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualIsSame = underTest.isSame(testData['firstDateTime'],
            testData['secondDateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualIsSame, testData['expectedIsSame']);
      });
    }
  });

  group('Test isSameOrBefore query', () {
    for (var testData in isSameOrBeforeTimeTestData()) {
      test('Should successfully return if datetime is same or before', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualIsSameOrBefore = underTest.isSameOrBefore(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['unit'],
            startOfWeek);

        // Verify
        expect(actualIsSameOrBefore, testData['expectedIsSameOrBefore']);
      });
    }

    for (var testData in isSameOrBeforeDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is same or before with start of week',
          () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualIsSameOrBefore = underTest.isSameOrBefore(
            testData['firstDateTime'],
            testData['secondDateTime'],
            unit,
            testData['startOfWeek']);

        // Verify
        expect(actualIsSameOrBefore, testData['expectedIsSameOrBefore']);
      });
    }
  });

  group('Test isSameOrAfter query', () {
    for (var testData in isSameOrAfterTimeTestData()) {
      test('Should successfully return if datetime is same or after', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualIsSameOrAfter = underTest.isSameOrAfter(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['unit'],
            startOfWeek);

        // Verify
        expect(actualIsSameOrAfter, testData['expectedIsSameOrAfter']);
      });
    }

    for (var testData in isSameOrAfterDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is same or before with start of week',
          () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualIsSameOrAfter = underTest.isSameOrAfter(
            testData['firstDateTime'],
            testData['secondDateTime'],
            unit,
            testData['startOfWeek']);

        // Verify
        expect(actualIsSameOrAfter, testData['expectedIsSameOrAfter']);
      });
    }
  });

  group('Test isBetween query', () {
    for (var testData in isBetweenTimeTestData()) {
      test('Should successfully return if datetime is between', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualIsBetween = underTest.isBetween(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['thirdDateTime'],
            testData['unit'],
            startOfWeek);

        // Verify
        expect(actualIsBetween, testData['expectedIsBetween']);
      });
    }

    for (var testData in isBetweenDateTimeWithStartOfWeekTestData()) {
      test(
          'Should successfully return if datetime is between with start of week',
          () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualIsBetween = underTest.isBetween(
            testData['firstDateTime'],
            testData['secondDateTime'],
            testData['thirdDateTime'],
            unit,
            testData['startOfWeek']);

        // Verify
        expect(actualIsBetween, testData['expectedIsBetween']);
      });
    }
  });

  for (var testData in isUtcDateTimeTestData()) {
    test('Should successfully check if date time is utc', () {
      // Execute
      final actualIsUtc = Query.isUtc(testData['dateTime']);

      // Verify
      expect(actualIsUtc, testData['expectedIsUtc']);
    });
  }

  for (var testData in isLeapYearTestData()) {
    test('Should successfully check if year is a leap year', () {
      // Execute
      final actualIsLeapYear = Query.isLeapYear(testData['year']);

      // Verify
      expect(actualIsLeapYear, testData['expectedIsLeapYear']);
    });
  }
}

List<Map<String, dynamic>> isBeforeDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.week,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.week,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.week,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.week,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsBefore': false
    },
  ];
}

List<Map<String, dynamic>> isBeforeDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 9),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBefore': false
    },
  ];
}

List<Map<String, dynamic>> isAfterDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.week,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.week,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.week,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.week,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsAfter': false
    },
  ];
}

List<Map<String, dynamic>> isAfterDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsAfter': false
    },
  ];
}

List<Map<String, dynamic>> isSameDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.week,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.week,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.week,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.week,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSame': true
    },
  ];
}

List<Map<String, dynamic>> isSameDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSame': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSame': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSame': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrBeforeTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.week,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.week,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.week,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.week,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSameOrBefore': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrBeforeDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrBefore': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrBefore': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrBefore': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrAfterTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'unit': Unit.week,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 5),
      'unit': Unit.week,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.week,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 3),
      'unit': Unit.week,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 2),
      'unit': Unit.month,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1996),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedIsSameOrAfter': true
    },
  ];
}

List<Map<String, dynamic>> isSameOrAfterDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 4),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrAfter': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 2),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrAfter': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 6),
      'secondDateTime': DateTime(2022, 12, 3),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsSameOrAfter': true
    },
  ];
}

List<Map<String, dynamic>> isBetweenTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.microsecond,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.microsecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.microsecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.microsecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 3),
      'unit': Unit.microsecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.millisecond,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.millisecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.millisecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.millisecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.millisecond,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.second,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.second,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.second,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 3),
      'unit': Unit.second,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 11, 22, 3),
      'unit': Unit.second,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.minute,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 0),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.minute,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 4),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.minute,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 1),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.minute,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 3),
      'secondDateTime': DateTime(1997, 9, 23, 12, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 12, 3),
      'unit': Unit.minute,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.hour,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 0),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.hour,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 4),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.hour,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 1),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.hour,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 3),
      'secondDateTime': DateTime(1997, 9, 23, 1),
      'thirdDateTime': DateTime(1997, 9, 23, 3),
      'unit': Unit.hour,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.day,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 9, 0),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.day,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 4),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.day,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 1),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.day,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 9, 3),
      'secondDateTime': DateTime(1997, 9, 1),
      'thirdDateTime': DateTime(1997, 9, 3),
      'unit': Unit.day,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 2),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.month,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 2),
      'thirdDateTime': DateTime(1997, 4),
      'unit': Unit.month,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 4),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.month,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 1),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.month,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1997, 3),
      'secondDateTime': DateTime(1997, 1),
      'thirdDateTime': DateTime(1997, 3),
      'unit': Unit.month,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1992),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.year,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(1991),
      'secondDateTime': DateTime(1992),
      'thirdDateTime': DateTime(1994),
      'unit': Unit.year,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1994),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.year,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1991),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.year,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(1993),
      'secondDateTime': DateTime(1991),
      'thirdDateTime': DateTime(1993),
      'unit': Unit.year,
      'expectedIsBetween': false
    },
  ];
}

List<Map<String, dynamic>> isBetweenDateTimeWithStartOfWeekTestData() {
  return [
    {
      'firstDateTime': DateTime(2022, 12, 14),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 19),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 8),
      'secondDateTime': DateTime(2022, 12, 12),
      'thirdDateTime': DateTime(2022, 12, 19),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 20),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 7),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 15),
      'secondDateTime': DateTime(2022, 12, 5),
      'thirdDateTime': DateTime(2022, 12, 12),
      'startOfWeek': StartOfWeek.monday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 14),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 18),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 8),
      'secondDateTime': DateTime(2022, 12, 11),
      'thirdDateTime': DateTime(2022, 12, 18),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 20),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 7),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 15),
      'secondDateTime': DateTime(2022, 12, 4),
      'thirdDateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 14),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 17),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBetween': true
    },
    {
      'firstDateTime': DateTime(2022, 12, 8),
      'secondDateTime': DateTime(2022, 12, 10),
      'thirdDateTime': DateTime(2022, 12, 17),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 20),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 7),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBetween': false
    },
    {
      'firstDateTime': DateTime(2022, 12, 15),
      'secondDateTime': DateTime(2022, 12, 3),
      'thirdDateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedIsBetween': false
    },
  ];
}

List<Map<String, dynamic>> isUtcDateTimeTestData() {
  return [
    {'dateTime': DateTime.now(), 'expectedIsUtc': false},
    {'dateTime': DateTime.now().toUtc(), 'expectedIsUtc': true},
  ];
}

List<Map<String, dynamic>> isLeapYearTestData() {
  return [
    {'year': 1997, 'expectedIsLeapYear': false},
    {'year': 2022, 'expectedIsLeapYear': false},
    {'year': 2020, 'expectedIsLeapYear': true},
    {'year': 2018, 'expectedIsLeapYear': false},
    {'year': 2016, 'expectedIsLeapYear': true},
  ];
}
