import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/display.dart';
import 'package:jiffy/src/enums/unit.dart';
import 'package:jiffy/src/getter.dart';
import 'package:jiffy/src/locale/locales/en_locale.dart';
import 'package:jiffy/src/manipulator.dart';
import 'package:jiffy/src/query.dart';
import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:test/test.dart';

void main() {
  final getter = Getter();
  final manipulator = Manipulator(getter);
  final query = Query(getter, manipulator);

  final underTest = Display(getter, manipulator, query);

  test('Should successfully format datetime is iso when pattern not provided',
      () {
    // Setup
    final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);

    final expectedFormat = '1997-09-23T12:11:22.123456';

    // Execute
    final actualFormat = underTest.formatToISO8601(dateTime);

    // Verify
    expect(actualFormat, expectedFormat);
  });

  group('Test format with pattern', () {
    for (var testData in formatWithPatternDateTimeTestData()) {
      test('Should successfully format datetime when pattern is provided', () {
        // Setup
        final locale = EnLocale();

        // Execute
        final actualFormat =
            underTest.format(testData['dateTime'], testData['pattern'], locale);

        // Verify
        expect(actualFormat, testData['expectedFormat']);
      });
    }

    for (var testData in formatWithEscapedPatternDateTimeTestData()) {
      test('Should successfully format datetime with escaped pattern', () {
        // Setup
        final locale = EnLocale();

        // Execute
        final actualFormat =
            underTest.format(testData['dateTime'], testData['pattern'], locale);

        // Verify
        expect(actualFormat, testData['expectedFormat']);
      });
    }

    for (var testData in formatWithOrdinalPatternDateTimeTestData()) {
      test('Should successfully format datetime with ordinal pattern', () {
        // Setup
        final locale = EnLocale();

        // Execute
        final actualFormat =
            underTest.format(testData['dateTime'], testData['pattern'], locale);

        // Verify
        expect(actualFormat, testData['expectedFormat']);
      });
    }

    test('Should throw JiffyException if provided pattern in blank', () {
      // Setup
      final dateTime = DateTime(1997, 9, 23, 12, 11, 22, 123, 456);
      final pattern = '';
      final locale = EnLocale();

      final expectedExceptionMessage = 'The provided pattern for datetime '
          '`$dateTime` cannot be blank';

      // Execute and Verify
      expect(
          () => underTest.format(dateTime, pattern, locale),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains(expectedExceptionMessage))));
    });
  });

  group('Test from as relative between two datetime', () {
    for (var testData in fromAsRelativeDateTimeTestData()) {
      test('Should successfully get from as relative datetime', () {
        final locale = EnLocale();

        final actualFromAsRelativeDateTime = underTest.fromAsRelativeDateTime(
            testData['firstDateTime'],
            testData['secondDateTime'],
            locale,
            true);

        expect(actualFromAsRelativeDateTime,
            testData['expectedFromAsRelativeDateTime']);
      });
    }

    test(
        'Should successfully get from as relative datetime without prefix and suffix',
        () {
      final locale = EnLocale();
      final firstDateTime = DateTime(1997, 10, 23, 12, 11, 22, 123, 456);
      final secondDateTime = DateTime(1998, 10, 23, 12, 11, 22, 123, 457);
      final withPrefixAndSuffix = false;

      final expectedFromAsRelativeDateTime = 'a year';

      final actualFromAsRelativeDateTime = underTest.fromAsRelativeDateTime(
          firstDateTime, secondDateTime, locale, withPrefixAndSuffix);

      expect(actualFromAsRelativeDateTime, expectedFromAsRelativeDateTime);
    });

    for (var testData in toAsRelativeDateTimeTestData()) {
      test('Should successfully get to as relative datetime', () {
        final locale = EnLocale();

        final actualToAsRelativeDateTime = underTest.toAsRelativeDateTime(
            testData['firstDateTime'],
            testData['secondDateTime'],
            locale,
            true);

        expect(actualToAsRelativeDateTime,
            testData['expectedToAsRelativeDateTime']);
      });
    }

    test(
        'Should successfully get to as relative datetime without prefix and suffix',
        () {
      final locale = EnLocale();
      final firstDateTime = DateTime(1997, 10, 23, 12, 11, 22, 123, 456);
      final secondDateTime = DateTime(1998, 10, 23, 12, 11, 22, 123, 457);
      final withPrefixAndSuffix = false;

      final expectedFromAsRelativeDateTime = 'a year';

      final actualFromAsRelativeDateTime = underTest.toAsRelativeDateTime(
          firstDateTime, secondDateTime, locale, withPrefixAndSuffix);

      expect(actualFromAsRelativeDateTime, expectedFromAsRelativeDateTime);
    });
  });

  group('Test diff between two datetime', () {
    for (var testData in diffDateTimeTestData()) {
      test('Should successfully get difference when float is disabled', () {
        // Setup
        final asFloat = false;

        // Execute
        final actualDifference = underTest.diff(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], asFloat);

        // Verify
        expect(actualDifference, testData['expectedDifference']);
      });
    }

    test('Should successfully get difference between two datetime', () {
      // Setup
      final firstDateTime = DateTime(2022, 12, 5);
      final secondDateTime = DateTime(2022, 12, 8);
      final unit = Unit.week;
      final asFloat = true;

      final expectedDifference = -0.42857142857142855;

      // Execute
      final actualDifference =
          underTest.diff(firstDateTime, secondDateTime, unit, asFloat);

      // Verify
      expect(actualDifference, expectedDifference);
    });
  });
}

List<Map<String, dynamic>> formatWithPatternDateTimeTestData() {
  return [
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'pattern': 'yyyy MMM dd hh:mm:ss',
      'expectedFormat': '1997 Sep 23 12:11:22'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'pattern': 'yyyy MMM, dd hh:mm a',
      'expectedFormat': '1997 Sep, 23 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 11, 11, 22, 123, 456),
      'pattern': 'yyyy MMM dd hh:mm a',
      'expectedFormat': '1997 Sep 23 11:11 AM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 11, 11, 22, 123, 456),
      'pattern': 'do MMMM',
      'expectedFormat': '23rd September'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 11, 11, 22, 123, 456),
      'pattern': 'EEEE',
      'expectedFormat': 'Tuesday'
    }
  ];
}

List<Map<String, dynamic>> formatWithEscapedPatternDateTimeTestData() {
  return [
    {
      'dateTime': DateTime(1969, 7, 20, 20, 18, 04),
      'pattern': '[The moon landing was on] do MMMM, yyyy',
      'expectedFormat': 'The moon landing was on 20th July, 1969'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'pattern': '[Today\'s date is] do [in the month of] MMMM',
      'expectedFormat': 'Today\'s date is 23rd in the month of September'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'pattern': '[It\'s] hh [o\'clock]',
      'expectedFormat': 'It\'s 12 o\'clock'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'pattern': "[It's] hh [o'clock]",
      'expectedFormat': "It's 12 o'clock"
    }
  ];
}

List<Map<String, dynamic>> formatWithOrdinalPatternDateTimeTestData() {
  return [
    {
      'dateTime': DateTime(2022, 1, 1),
      'pattern': 'do',
      'expectedFormat': '1st'
    },
    {
      'dateTime': DateTime(2022, 1, 12),
      'pattern': 'do',
      'expectedFormat': '12th'
    },
    {
      'dateTime': DateTime(2022, 1, 21),
      'pattern': 'do',
      'expectedFormat': '21st'
    },
    {
      'dateTime': DateTime(2022, 1, 2),
      'pattern': 'do',
      'expectedFormat': '2nd'
    },
    {
      'dateTime': DateTime(2022, 1, 3),
      'pattern': 'do',
      'expectedFormat': '3rd'
    },
    {
      'dateTime': DateTime(2022, 1, 4),
      'pattern': 'do',
      'expectedFormat': '4th'
    },
    {
      'dateTime': DateTime(2022, 1, 11),
      'pattern': 'do',
      'expectedFormat': '11th'
    }
  ];
}

List<Map<String, dynamic>> toAsRelativeDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 457),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 457),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'expectedToAsRelativeDateTime': 'a few seconds ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 124),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 124),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'expectedToAsRelativeDateTime': 'a few seconds ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedToAsRelativeDateTime': 'a minute ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedToAsRelativeDateTime': 'in a minute'
    },
    {
      'firstDateTime': DateTime(2024, 1, 1, 2, 0, 0),
      'secondDateTime': DateTime(2024, 1, 1, 1, 58, 5),
      'expectedToAsRelativeDateTime': '2 minutes ago'
    },
    {
      'firstDateTime': DateTime(2024, 1, 1, 2, 0, 0),
      'secondDateTime': DateTime(2024, 1, 1, 1, 58, 31),
      'expectedToAsRelativeDateTime': 'a minute ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedToAsRelativeDateTime': 'a few seconds ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 40),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedToAsRelativeDateTime': '40 minutes ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 40),
      'expectedToAsRelativeDateTime': 'in 40 minutes'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedToAsRelativeDateTime': 'an hour ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedToAsRelativeDateTime': 'in an hour'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 12),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11),
      'expectedToAsRelativeDateTime': 'a minute ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 10),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11),
      'expectedToAsRelativeDateTime': 'in a minute'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 23),
      'secondDateTime': DateTime(1997, 10, 23, 0),
      'expectedToAsRelativeDateTime': '23 hours ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 0),
      'secondDateTime': DateTime(1997, 10, 23, 23),
      'expectedToAsRelativeDateTime': 'in 23 hours'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 13),
      'secondDateTime': DateTime(1997, 10, 23, 12),
      'expectedToAsRelativeDateTime': 'an hour ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12),
      'secondDateTime': DateTime(1997, 10, 23, 12),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 11),
      'secondDateTime': DateTime(1997, 10, 23, 12),
      'expectedToAsRelativeDateTime': 'in an hour'
    },
    {
      'firstDateTime': DateTime(1997, 10, 24),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedToAsRelativeDateTime': 'a day ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 24),
      'expectedToAsRelativeDateTime': 'in a day'
    },
    {
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 24),
      'expectedToAsRelativeDateTime': 'in 4 days'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedToAsRelativeDateTime': '3 days ago'
    },
    {
      'firstDateTime': DateTime(1997, 11),
      'secondDateTime': DateTime(1997, 10),
      'expectedToAsRelativeDateTime': 'a month ago'
    },
    {
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 10),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 11),
      'expectedToAsRelativeDateTime': 'in a month'
    },
    {
      'firstDateTime': DateTime(1997, 8),
      'secondDateTime': DateTime(1997, 11),
      'expectedToAsRelativeDateTime': 'in 3 months'
    },
    {
      'firstDateTime': DateTime(1997, 11),
      'secondDateTime': DateTime(1997, 8),
      'expectedToAsRelativeDateTime': '3 months ago'
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedToAsRelativeDateTime': 'a year ago'
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'expectedToAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedToAsRelativeDateTime': 'in a year'
    },
    {
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedToAsRelativeDateTime': 'in 3 years'
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedToAsRelativeDateTime': '3 years ago'
    }
  ];
}

List<Map<String, dynamic>> fromAsRelativeDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 457),
      'expectedFromAsRelativeDateTime': 'a few seconds ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 457),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123, 456),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 124),
      'expectedFromAsRelativeDateTime': 'a few seconds ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22, 124),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22, 123),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'expectedFromAsRelativeDateTime': 'in a minute'
    },
    {
      'firstDateTime': DateTime(2024, 1, 1, 2, 0, 0),
      'secondDateTime': DateTime(2024, 1, 1, 1, 58, 5),
      'expectedFromAsRelativeDateTime': 'in 2 minutes'
    },
    {
      'firstDateTime': DateTime(2024, 1, 1, 2, 0, 0),
      'secondDateTime': DateTime(2024, 1, 1, 1, 58, 31),
      'expectedFromAsRelativeDateTime': 'in a minute'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 45),
      'expectedFromAsRelativeDateTime': 'a minute ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11, 22),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11, 23),
      'expectedFromAsRelativeDateTime': 'a few seconds ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 40),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedFromAsRelativeDateTime': 'in 40 minutes'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 40),
      'expectedFromAsRelativeDateTime': '40 minutes ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 45),
      'secondDateTime': DateTime(1997, 10, 23, 12, 0),
      'expectedFromAsRelativeDateTime': 'in an hour'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 0),
      'secondDateTime': DateTime(1997, 10, 23, 12, 45),
      'expectedFromAsRelativeDateTime': 'an hour ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 12),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11),
      'expectedFromAsRelativeDateTime': 'in a minute'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 11),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12, 10),
      'secondDateTime': DateTime(1997, 10, 23, 12, 11),
      'expectedFromAsRelativeDateTime': 'a minute ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 23),
      'secondDateTime': DateTime(1997, 10, 23, 0),
      'expectedFromAsRelativeDateTime': 'in 23 hours'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 0),
      'secondDateTime': DateTime(1997, 10, 23, 23),
      'expectedFromAsRelativeDateTime': '23 hours ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 13),
      'secondDateTime': DateTime(1997, 10, 23, 12),
      'expectedFromAsRelativeDateTime': 'in an hour'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 12),
      'secondDateTime': DateTime(1997, 10, 23, 12),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23, 11),
      'secondDateTime': DateTime(1997, 10, 23, 12),
      'expectedFromAsRelativeDateTime': 'an hour ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 24),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedFromAsRelativeDateTime': 'in a day'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 23),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 24),
      'expectedFromAsRelativeDateTime': 'a day ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 20),
      'secondDateTime': DateTime(1997, 10, 24),
      'expectedFromAsRelativeDateTime': '4 days ago'
    },
    {
      'firstDateTime': DateTime(1997, 10, 23),
      'secondDateTime': DateTime(1997, 10, 20),
      'expectedFromAsRelativeDateTime': 'in 3 days'
    },
    {
      'firstDateTime': DateTime(1997, 11),
      'secondDateTime': DateTime(1997, 10),
      'expectedFromAsRelativeDateTime': 'in a month'
    },
    {
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 10),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997, 10),
      'secondDateTime': DateTime(1997, 11),
      'expectedFromAsRelativeDateTime': 'a month ago'
    },
    {
      'firstDateTime': DateTime(1997, 8),
      'secondDateTime': DateTime(1997, 11),
      'expectedFromAsRelativeDateTime': '3 months ago'
    },
    {
      'firstDateTime': DateTime(1997, 11),
      'secondDateTime': DateTime(1997, 8),
      'expectedFromAsRelativeDateTime': 'in 3 months'
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1997),
      'expectedFromAsRelativeDateTime': 'in a year'
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'expectedFromAsRelativeDateTime': 'in a few seconds'
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1998),
      'expectedFromAsRelativeDateTime': 'a year ago'
    },
    {
      'firstDateTime': DateTime(1995),
      'secondDateTime': DateTime(1998),
      'expectedFromAsRelativeDateTime': '3 years ago'
    },
    {
      'firstDateTime': DateTime(1998),
      'secondDateTime': DateTime(1995),
      'expectedFromAsRelativeDateTime': 'in 3 years'
    }
  ];
}

List<Map<String, dynamic>> diffDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 24),
      'unit': Unit.microsecond,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 10),
      'unit': Unit.microsecond,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Unit.microsecond,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 24),
      'unit': Unit.millisecond,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 10),
      'unit': Unit.millisecond,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Unit.millisecond,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 24),
      'unit': Unit.second,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 10),
      'unit': Unit.second,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Unit.second,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 24),
      'unit': Unit.minute,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 10),
      'unit': Unit.minute,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Unit.minute,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 10),
      'secondDateTime': DateTime(1997, 9, 23, 24),
      'unit': Unit.hour,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 24),
      'secondDateTime': DateTime(1997, 9, 23, 10),
      'unit': Unit.hour,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Unit.hour,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 10),
      'secondDateTime': DateTime(1997, 9, 24),
      'unit': Unit.day,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 24),
      'secondDateTime': DateTime(1997, 9, 10),
      'unit': Unit.day,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Unit.day,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 20),
      'unit': Unit.week,
      'expectedDifference': -2
    },
    {
      'firstDateTime': DateTime(2022, 12, 22),
      'secondDateTime': DateTime(2022, 12, 6),
      'unit': Unit.week,
      'expectedDifference': 2
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Unit.week,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(2022, 5),
      'secondDateTime': DateTime(2022, 7),
      'unit': Unit.month,
      'expectedDifference': -2
    },
    {
      'firstDateTime': DateTime(2022, 7),
      'secondDateTime': DateTime(2022, 5),
      'unit': Unit.month,
      'expectedDifference': 2
    },
    {
      'firstDateTime': DateTime(2022, 5),
      'secondDateTime': DateTime(2022, 5),
      'unit': Unit.month,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(2016, 2, 29),
      'secondDateTime': DateTime(2016, 1, 30),
      'unit': Unit.month,
      'expectedDifference': 1
    },
    {
      'firstDateTime': DateTime(2016, 2, 29),
      'secondDateTime': DateTime(2016, 1, 31),
      'unit': Unit.month,
      'expectedDifference': 1
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1999),
      'unit': Unit.year,
      'expectedDifference': -2
    },
    {
      'firstDateTime': DateTime(1999),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedDifference': 2
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Unit.year,
      'expectedDifference': 0
    },
  ];
}
