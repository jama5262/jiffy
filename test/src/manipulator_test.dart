import 'package:jiffy/src/getter.dart';
import 'package:jiffy/src/enums/start_of_week.dart';
import 'package:jiffy/src/enums/unit.dart';
import 'package:jiffy/src/manipulator.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final getter = Getter();
  final underTest = Manipulator(getter);

  group('Test adding and subtracting datetime using Durations', () {
    test('Should successfully add datetime using durations', () {
      // Setup
      final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);
      final duration = Duration(
          microseconds: 100,
          milliseconds: 200,
          seconds: 3,
          minutes: 4,
          hours: 2,
          days: 3);

      final expectedDateTime = DateTime(1997, 9, 26, 14, 15, 25, 323, 556);

      // Execute
      final actualDateTime = underTest.addDuration(dateTime, duration);

      // Verify
      expect(actualDateTime.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully add datetime when duration is set to zero', () {
      // Setup
      final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);
      final duration = Duration.zero;

      // Execute
      final actualDateTime = underTest.addDuration(dateTime, duration);

      // Verify
      expect(actualDateTime.microsecondsSinceEpoch,
          dateTime.microsecondsSinceEpoch);
    });

    test('Should successfully subtract datetime using durations', () {
      // Setup
      final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);
      final duration = Duration(
          microseconds: 100,
          milliseconds: 100,
          seconds: 3,
          minutes: 4,
          hours: 2,
          days: 3);

      final expectedDateTime = DateTime(1997, 9, 20, 10, 7, 19, 23, 356);

      // Execute
      final actualDateTime = underTest.subtractDuration(dateTime, duration);

      // Verify
      expect(actualDateTime.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully subtract datetime when duration is set to zero',
        () {
      // Setup
      final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);
      final duration = Duration.zero;

      // Execute
      final actualDateTime = underTest.subtractDuration(dateTime, duration);

      // Verify
      expect(actualDateTime.microsecondsSinceEpoch,
          dateTime.microsecondsSinceEpoch);
    });
  });

  group('Test adding and subtracting datetime using values', () {
    test('Should successfully add datetime', () {
      // Setup
      final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);
      final microseconds = 100;
      final milliseconds = 200;
      final seconds = 3;
      final minutes = 4;
      final hours = 2;
      final days = 3;
      final weeks = 1;
      final months = 4;
      final years = 2;

      final expectedDateTime = DateTime(2000, 2, 3, 14, 15, 25, 323, 556);

      // Execute
      final actualDateTime = underTest.add(dateTime, microseconds, milliseconds,
          seconds, minutes, hours, days, weeks, months, years);

      // Verify
      expect(actualDateTime.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully subtract datetime', () {
      // Setup
      final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);
      final microseconds = 100;
      final milliseconds = 100;
      final seconds = 3;
      final minutes = 4;
      final hours = 2;
      final days = 3;
      final weeks = 1;
      final months = 4;
      final years = 2;

      final expectedDateTime = DateTime(1995, 5, 13, 10, 7, 19, 23, 356);

      // Execute
      final actualDateTime = underTest.subtract(dateTime, microseconds,
          milliseconds, seconds, minutes, hours, days, weeks, months, years);

      // Verify
      expect(actualDateTime.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });
  });

  // test adding and subtracting weeks

  group('Test startOf datetime', () {
    for (var testData in startOfDateTimeTestData()) {
      test('Should successfully get start of datetime', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualDateTime = underTest.startOf(
            testData['dateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualDateTime.microsecondsSinceEpoch,
            testData['expectedDateTime'].microsecondsSinceEpoch);
      });
    }

    for (var testData in startOfWeekWithLocaleDateTimeTestData()) {
      test('Should successfully get start of week base in local datetime', () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualDateTime = underTest.startOf(
            testData['dateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualDateTime.microsecondsSinceEpoch,
            testData['expectedDateTime'].microsecondsSinceEpoch);
      });
    }
  });

  group('Test endOf datetime', () {
    for (var testData in endOfDateTimeTestData()) {
      test('Should successfully get end of datetime', () {
        // Setup
        final startOfWeek = StartOfWeek.monday;

        // Execute
        final actualDateTime = underTest.endOf(
            testData['dateTime'], testData['unit'], startOfWeek);

        // Verify
        expect(actualDateTime.microsecondsSinceEpoch,
            testData['expectedDateTime'].microsecondsSinceEpoch);
      });
    }

    for (var testData in endOfWeekWithLocaleDateTimeTestData()) {
      test('Should successfully get end of week base in local datetime', () {
        // Setup
        final unit = Unit.week;

        // Execute
        final actualDateTime = underTest.endOf(
            testData['dateTime'], unit, testData['startOfWeek']);

        // Verify
        expect(actualDateTime, testData['expectedDateTime']);
      });
    }
  });

  group('Test toLocal and toUtc', () {
    test('Should successfully convert utc datetime to local', () {
      // Setup
      final utcDateTime = DateTime(1997, 9, 23);

      final expectedLocalDateTime = utcDateTime.toLocal();

      // Execute
      final actualDateTime = underTest.toLocal(utcDateTime);

      // Verify
      expect(actualDateTime.isUtc, expectedLocalDateTime.isUtc);
      expect(actualDateTime.microsecondsSinceEpoch,
          expectedLocalDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully convert local datetime to utc', () {
      // Setup
      final localDateTime = DateTime(1997, 9, 23);

      final expectedUTCDateTime = localDateTime.toUtc();

      // Execute
      final actualDateTime = underTest.toUtc(localDateTime);

      // Verify
      expect(actualDateTime.isUtc, expectedUTCDateTime.isUtc);
      expect(actualDateTime.microsecondsSinceEpoch,
          expectedUTCDateTime.microsecondsSinceEpoch);
    });
  });
}

List<Map<String, dynamic>> startOfDateTimeTestData() {
  return [
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.microsecond,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.millisecond,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 0)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.second,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 22, 0, 0)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.minute,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 0, 0, 0)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.hour,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 0, 0, 0, 0, 0),
      'unit': Unit.day,
      'expectedDateTime': DateTime(1997, 9, 23, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.week,
      'expectedDateTime': DateTime(1997, 9, 22, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.month,
      'expectedDateTime': DateTime(1997, 9, 1, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.year,
      'expectedDateTime': DateTime(1997, 1, 1, 0, 0, 0, 0, 0)
    }
  ];
}

List<Map<String, dynamic>> startOfWeekWithLocaleDateTimeTestData() {
  return [
    {
      'dateTime': DateTime(2022, 12, 6, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.monday,
      'expectedDateTime': DateTime(2022, 12, 5, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 12, 5, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.monday,
      'expectedDateTime': DateTime(2022, 12, 5, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 2, 28, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.monday,
      'expectedDateTime': DateTime(2022, 2, 28, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 3, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.monday,
      'expectedDateTime': DateTime(2022, 2, 28, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 12, 6, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDateTime': DateTime(2022, 12, 4, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 12, 4, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDateTime': DateTime(2022, 12, 4, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 3, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDateTime': DateTime(2022, 2, 27, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 12, 6, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDateTime': DateTime(2022, 12, 3, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 12, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDateTime': DateTime(2022, 12, 3, 0, 0, 0, 0, 0)
    },
    {
      'dateTime': DateTime(2022, 3, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDateTime': DateTime(2022, 2, 26, 0, 0, 0, 0, 0)
    },
  ];
}

List<Map<String, dynamic>> endOfDateTimeTestData() {
  return [
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.microsecond,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.millisecond,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 999)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.second,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 22, 999, 999)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.minute,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 11, 59, 999, 999)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.hour,
      'expectedDateTime': DateTime(1997, 9, 23, 12, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.day,
      'expectedDateTime': DateTime(1997, 9, 23, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.week,
      'expectedDateTime': DateTime(1997, 9, 28, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.month,
      'expectedDateTime': DateTime(1997, 9, 30, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2020, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.month,
      'expectedDateTime': DateTime(2020, 9, 30, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2020, 2, 23, 12, 11, 22, 123, 456),
      'unit': Unit.month,
      'expectedDateTime': DateTime(2020, 2, 29, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'unit': Unit.year,
      'expectedDateTime': DateTime(1997, 12, 31, 23, 59, 59, 999, 999),
    }
  ];
}

List<Map<String, dynamic>> endOfWeekWithLocaleDateTimeTestData() {
  return [
    {
      'dateTime': DateTime(2022, 12, 6, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.monday,
      'expectedDateTime': DateTime(2022, 12, 11, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 12, 5, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.monday,
      'expectedDateTime': DateTime(2022, 12, 11, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 3, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.monday,
      'expectedDateTime': DateTime(2022, 3, 6, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 12, 6, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDateTime': DateTime(2022, 12, 10, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 12, 4, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDateTime': DateTime(2022, 12, 10, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 3, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDateTime': DateTime(2022, 3, 5, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 12, 6, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDateTime': DateTime(2022, 12, 9, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 12, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDateTime': DateTime(2022, 12, 9, 23, 59, 59, 999, 999)
    },
    {
      'dateTime': DateTime(2022, 3, 3, 12, 11, 22, 123, 456),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDateTime': DateTime(2022, 3, 4, 23, 59, 59, 999, 999)
    },
  ];
}
