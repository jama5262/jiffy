import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/getter.dart';
import 'package:test/test.dart';

final underTest = Getter();

late Locale locale;

void main() {
  setUp(() async {
    Jiffy.setLocale("en_US");
    locale = Jiffy.now().locale;
  });

  group('Test basic datetime getters', () {
    final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);

    test('Should successfully get date time', () {
      // Setup
      final expectedDateTime = dateTime;

      // Expected
      final actualDateTime = underTest.dateTime(dateTime);

      // Verify
      expect(actualDateTime, expectedDateTime);
    });

    test('Should successfully get microsecond', () {
      // Setup
      final expectedMicrosecond = dateTime.microsecond;

      // Execute
      final actualMicrosecond = underTest.microsecond(dateTime);

      // Verify
      expect(actualMicrosecond, expectedMicrosecond);
    });

    test('Should successfully get microsecondsSinceEpoch', () {
      // Setup
      final expectedMicrosecondsSinceEpoch = dateTime.microsecondsSinceEpoch;

      // Execute
      final actualMicrosecondsSinceEpoch =
          underTest.microsecondsSinceEpoch(dateTime);

      // Verify
      expect(actualMicrosecondsSinceEpoch, expectedMicrosecondsSinceEpoch);
    });

    test('Should successfully get millisecond', () {
      // Setup
      final expectedMillisecond = dateTime.millisecond;

      // Execute
      final actualMillisecond = underTest.millisecond(dateTime);

      // Verify
      expect(actualMillisecond, expectedMillisecond);
    });

    test('Should successfully get millisecondsSinceEpoch', () {
      // Setup
      final expectedMillisecondsSinceEpoch = dateTime.millisecondsSinceEpoch;

      // Execute
      final actualMillisecondsSinceEpoch =
          underTest.millisecondsSinceEpoch(dateTime);

      // Verify
      expect(actualMillisecondsSinceEpoch, expectedMillisecondsSinceEpoch);
    });

    test('Should successfully get second', () {
      // Setup
      final expectedSecond = dateTime.second;

      // Execute
      final actualSecond = underTest.second(dateTime);

      // Verify
      expect(actualSecond, expectedSecond);
    });

    test('Should successfully get minute', () {
      // Setup
      final expectedMinute = dateTime.minute;

      // Execute
      final actualMinute = underTest.minute(dateTime);

      // Verify
      expect(actualMinute, expectedMinute);
    });

    test('Should successfully get hour', () {
      // Setup
      final expectedHour = dateTime.hour;

      // Execute
      final actualHour = underTest.hour(dateTime);

      // Verify
      expect(actualHour, expectedHour);
    });

    test('Should successfully get date', () {
      // Setup
      final expectedDate = dateTime.day;

      // Execute
      final actualDate = underTest.date(dateTime);

      // Verify
      expect(actualDate, expectedDate);
    });

    test('Should successfully get month', () {
      // Setup
      final expectedMonth = dateTime.month;

      // Execute
      final actualMonth = underTest.month(dateTime);

      // Verify
      expect(actualMonth, expectedMonth);
    });

    test('Should successfully get year', () {
      // Setup
      final expectedYear = dateTime.year;

      // Execute
      final actualYear = underTest.year(dateTime);

      // Verify
      expect(actualYear, expectedYear);
    });
  });

  group('Test getting datetime of', () {
    for (var testData in dayOfWeekTestData()) {
      test('Should successfully get day of week', () {
        // Setup
        final startOfWeek = testData['startOfWeek'];

        // Execute
        final actualDayOfWeek =
            underTest.dayOfWeek(testData['dateTime'], startOfWeek);

        // Verify
        expect(actualDayOfWeek, testData['expectedDayOfWeek']);
      });
    }

    for (var testData in dayOfYearTestData()) {
      test('Should successfully get day of year', () {
        // Execute
        final actualDayOfYear =
            underTest.dayOfYear(testData['dateTime'], locale);

        // Verify
        expect(actualDayOfYear, testData['expectedDayOfYear']);
      });
    }

    test('Should successfully get day of year for non-standard number symbols',
        () async {
      // Setup
      await Jiffy.setLocale('bn');
      final newLocale = Jiffy.now().locale;

      // Execute
      final actualDayOfYear =
          underTest.dayOfYear(DateTime(1997, 9, 23), newLocale);

      // Verify
      expect(actualDayOfYear, 266);
    });

    for (var testData in weekOfYearTestData()) {
      test('Should successfully get week of year', () {
        // Setup
        Jiffy.setLocale(locale.code, startOfWeek: testData['startOfWeek']);
        final newLocale = Jiffy.now().locale;

        // Execute
        final actualWeekOfYear =
            underTest.weekOfYear(testData['dateTime'], newLocale);

        // Verify
        expect(actualWeekOfYear, testData['expectedWeekOfYear']);
      });
    }

    for (var testData in quarterOfYearTestData()) {
      test('Should successfully get quarter of year', () {
        // Execute
        final actualQuarterOfYear =
            underTest.quarterOfYear(testData['dateTime'], locale);

        // Verify
        expect(actualQuarterOfYear, testData['expectedQuarterOfYear']);
      });
    }

    test('Should successfully get quarter for non-standard number symbols',
        () async {
      // Setup
      await Jiffy.setLocale('bn');
      final newLocale = Jiffy.now().locale;

      // Execute
      final actualDayOfYear =
          underTest.quarterOfYear(DateTime(2022, 4, 1), newLocale);

      // Verify
      expect(actualDayOfYear, 2);
    });
  });

  for (var testData in daysInMonthTestData()) {
    test('Should successfully get days in a month', () {
      // Execute
      final actualDayInMonth = underTest.daysInMonth(testData['dateTime']);

      // Verify
      expect(actualDayInMonth, testData['expectedDayInMonth']);
    });
  }

  test('Should successfully get all days in month', () {
    // Setup
    final underTest = Getter.daysInMonthArray;

    // Verify
    expect(underTest.length, 13);
  });
}

List<Map<String, dynamic>> dayOfWeekTestData() {
  return [
    {
      'dateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDayOfWeek': 3
    },
    {
      'dateTime': DateTime(2022, 12, 6),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDayOfWeek': 4
    },
    {
      'dateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDayOfWeek': 5
    },
    {
      'dateTime': DateTime(2022, 12, 8),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDayOfWeek': 6
    },
    {
      'dateTime': DateTime(2022, 12, 9),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDayOfWeek': 7
    },
    {
      'dateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDayOfWeek': 1
    },
    {
      'dateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.saturday,
      'expectedDayOfWeek': 2
    },
    {
      'dateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDayOfWeek': 2
    },
    {
      'dateTime': DateTime(2022, 12, 6),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDayOfWeek': 3
    },
    {
      'dateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDayOfWeek': 4
    },
    {
      'dateTime': DateTime(2022, 12, 8),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDayOfWeek': 5
    },
    {
      'dateTime': DateTime(2022, 12, 9),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDayOfWeek': 6
    },
    {
      'dateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDayOfWeek': 7
    },
    {
      'dateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.sunday,
      'expectedDayOfWeek': 1
    },
    {
      'dateTime': DateTime(2022, 12, 5),
      'startOfWeek': StartOfWeek.monday,
      'expectedDayOfWeek': 1
    },
    {
      'dateTime': DateTime(2022, 12, 6),
      'startOfWeek': StartOfWeek.monday,
      'expectedDayOfWeek': 2
    },
    {
      'dateTime': DateTime(2022, 12, 7),
      'startOfWeek': StartOfWeek.monday,
      'expectedDayOfWeek': 3
    },
    {
      'dateTime': DateTime(2022, 12, 8),
      'startOfWeek': StartOfWeek.monday,
      'expectedDayOfWeek': 4
    },
    {
      'dateTime': DateTime(2022, 12, 9),
      'startOfWeek': StartOfWeek.monday,
      'expectedDayOfWeek': 5
    },
    {
      'dateTime': DateTime(2022, 12, 10),
      'startOfWeek': StartOfWeek.monday,
      'expectedDayOfWeek': 6
    },
    {
      'dateTime': DateTime(2022, 12, 11),
      'startOfWeek': StartOfWeek.monday,
      'expectedDayOfWeek': 7
    }
  ];
}

List<Map<String, dynamic>> dayOfYearTestData() {
  return [
    {'dateTime': DateTime(1997, 9, 23), 'expectedDayOfYear': 266},
    {'dateTime': DateTime(2020, 3, 1), 'expectedDayOfYear': 61},
    {'dateTime': DateTime(2022, 12, 25), 'expectedDayOfYear': 359}
  ];
}

List<Map<String, dynamic>> weekOfYearTestData() {
  return [
    {
      'dateTime': DateTime(1997, 9, 23),
      'startOfWeek': StartOfWeek.monday,
      'expectedWeekOfYear': 39
    },
    {
      'dateTime': DateTime(2020, 3, 1),
      'startOfWeek': StartOfWeek.sunday,
      'expectedWeekOfYear': 10
    },
    {
      'dateTime': DateTime(2022, 12, 25),
      'startOfWeek': StartOfWeek.saturday,
      'expectedWeekOfYear': 52
    }
  ];
}

List<Map<String, dynamic>> quarterOfYearTestData() {
  return [
    {'dateTime': DateTime(2022, 1, 1), 'expectedQuarterOfYear': 1},
    {'dateTime': DateTime(2022, 4, 1), 'expectedQuarterOfYear': 2},
    {'dateTime': DateTime(2022, 7, 1), 'expectedQuarterOfYear': 3},
    {'dateTime': DateTime(2022, 10, 1), 'expectedQuarterOfYear': 4}
  ];
}

List<Map<String, dynamic>> daysInMonthTestData() {
  return [
    {'dateTime': DateTime(2022, 1), 'expectedDayInMonth': 31},
    {'dateTime': DateTime(2022, 2), 'expectedDayInMonth': 28},
    {'dateTime': DateTime(2020, 2), 'expectedDayInMonth': 29},
    {'dateTime': DateTime(2022, 3), 'expectedDayInMonth': 31},
    {'dateTime': DateTime(2022, 4), 'expectedDayInMonth': 30},
    {'dateTime': DateTime(2022, 5), 'expectedDayInMonth': 31},
    {'dateTime': DateTime(2022, 6), 'expectedDayInMonth': 30},
    {'dateTime': DateTime(2022, 7), 'expectedDayInMonth': 31},
    {'dateTime': DateTime(2022, 8), 'expectedDayInMonth': 31},
    {'dateTime': DateTime(2022, 9), 'expectedDayInMonth': 30},
    {'dateTime': DateTime(2022, 10), 'expectedDayInMonth': 31},
    {'dateTime': DateTime(2022, 11), 'expectedDayInMonth': 30},
    {'dateTime': DateTime(2022, 12), 'expectedDayInMonth': 31},
  ];
}
