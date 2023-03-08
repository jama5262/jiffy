import 'package:jiffy/src/enums/unit.dart';
import 'package:jiffy/src/getter.dart';
import 'package:jiffy/src/locale/locales/en_locale.dart';
import 'package:jiffy/src/parser.dart';
import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:test/test.dart';

void main() {
  final getter = Getter();
  final underTest = Parser(getter);

  final locale = EnLocale();

  group('Test parsing datetime from string', () {
    for (var testData in fromStringWithPatternTestData()) {
      test('Should successfully parse datetime from pattern', () {
        // Execute
        final actualDateTime = underTest.fromString(
            testData['input'], testData['pattern'], locale, false);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    for (var testData in fromStringWithPatternAMAndPMTestData()) {
      test('Should successfully parse datetime if pattern contains am pm', () {
        // Execute
        final actualDateTime = underTest.fromString(
            testData['input'], testData['pattern'], locale, false);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    test('Should throw JiffyException if pattern is provided and is empty', () {
      // Setup
      final input = '2022-12-25';
      final pattern = '';

      final expectedExceptionMessage = 'The provided pattern for input '
          '`$input` cannot be blank';

      // Execute and Verify
      expect(
          () => underTest.fromString(input, pattern, locale, false),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains(expectedExceptionMessage))));
    });

    test('Should throw JiffyException if datetime cannot be parsed', () {
      // Setup
      final input = '2022-12-25';
      final pattern = 'invalid-pattern';

      final expectedExceptionMessage = 'JiffyException: Could not parse input '
          '`$input`, failed with the following error:';

      // Execute and Verify
      expect(
          () => underTest.fromString(input, pattern, locale, false),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains(expectedExceptionMessage))));
    });

    for (var testData in fromStringWithBasicDateTimeTestData()) {
      test('Should successfully parse basic datetime format', () {
        // Setup
        final pattern = null;

        // Execute
        final actualDateTime =
            underTest.fromString(testData['input'], pattern, locale, false);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    for (var testData in fromStringWithDateTimeAndISOTestData()) {
      test('Should successfully parse DateTime and ISO datetime format', () {
        // Setup
        final pattern = null;

        // Execute
        final actualDateTime =
            underTest.fromString(testData['input'], pattern, locale, false);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    test('Should throw JiffyException if input datetime cannot be parsed', () {
      // Setup
      final input = 'invalid-input-date-time';
      final pattern = null;

      final expectedExceptionMessage = 'Could not read date time of input'
          ' `$input`, try using a pattern, e.g. '
          'input: "12, Oct", pattern: "dd, MMM"';

      // Execute and Verify
      expect(
          () => underTest.fromString(input, pattern, locale, false),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains(expectedExceptionMessage))));
    });

    test('Should successfully pass date time if it is in Utc', () {
      // Setup
      final input = '1997 Sep 23th';
      final pattern = 'yyyy MMM do';

      final expected = DateTime.utc(1997, 9, 23);

      // Execute
      final actual = underTest.fromString(input, pattern, locale, true);

      // Verify
      expect(actual, expected);
    });
  });

  group('Test parsing datetime from list', () {
    for (var testData in fromListTestData()) {
      test('Should successfully parse datetime as list', () {
        // Execute
        final actualDateTime = underTest.fromList(testData['input'], false);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    test('Should throw JiffyException if datetime list is empty', () {
      // Setup
      final input = <int>[];

      final expectedExceptionMessage = 'The provided datetime list cannot '
          'be empty';

      // Execute and Verify
      expect(
          () => underTest.fromList(input, false),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains(expectedExceptionMessage))));
    });

    test('Should successfully pass date time as list if it is in Utc', () {
      // Setup
      final list = [1997, 9, 23];

      final expected = DateTime.utc(1997, 9, 23);

      // Execute
      final actual = underTest.fromList(list, true);

      // Verify
      expect(actual, expected);
    });
  });

  group('Test parsing datetime from map', () {
    test('Should successfully parse datetime as map', () {
      // Setup
      final input = {
        Unit.year: 1997,
        Unit.month: 9,
        Unit.day: 23,
        Unit.hour: 12,
        Unit.minute: 22,
        Unit.second: 11,
        Unit.millisecond: 123,
        Unit.microsecond: 456,
      };

      final expectedDateTime = DateTime(1997, 9, 23, 12, 22, 11, 123, 456);
      // Execute
      final actualDateTime = underTest.fromMap(input, false);

      // Verify
      expect(actualDateTime, expectedDateTime);
    });

    test('Should throw JiffyException if datetime map is empty', () {
      // Setup
      final input = <Unit, int>{};

      final expectedExceptionMessage = 'The provided datetime map cannot '
          'be empty';

      // Execute and Verify
      expect(
          () => underTest.fromMap(input, false),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains(expectedExceptionMessage))));
    });

    test('Should successfully pass date time as map if it is in Utc', () {
      // Setup
      final map = {
        Unit.year: 1997,
        Unit.month: 9,
        Unit.day: 23,
        Unit.hour: 12,
        Unit.minute: 22,
        Unit.second: 11,
        Unit.millisecond: 123,
        Unit.microsecond: 456,
      };

      final expected = DateTime.utc(1997, 9, 23, 12, 22, 11, 123, 456);

      // Execute
      final actual = underTest.fromMap(map, true);

      // Verify
      expect(actual, expected);
    });
  });
}

List<Map<String, dynamic>> fromStringWithPatternTestData() {
  return [
    {
      'input': '1997 Sep 23th',
      'pattern': 'yyyy MMM do',
      'expected': DateTime(1997, 9, 23)
    },
    {
      'input': '2022 12 25',
      'pattern': 'yyyy MM d',
      'expected': DateTime(2022, 12, 25)
    },
    {
      'input': 'January 1st 2021, 12:00:00 AM',
      'pattern': 'MMMM do yyyy, HH:mm:ss a',
      'expected': DateTime(2021, 1, 1, 12)
    }
  ];
}

List<Map<String, dynamic>> fromStringWithPatternAMAndPMTestData() {
  return [
    {
      'input': '1997 Sep 23rd 3:14 pm',
      'pattern': 'yyyy MMM do h:mm a',
      'expected': DateTime(1997, 9, 23, 15, 14)
    },
    {
      'input': '1997 Sep 23rd 3 pm',
      'pattern': 'yyyy MMM do h a',
      'expected': DateTime(1997, 9, 23, 15, 0)
    },
    {
      'input': '1997 Sep 23rd 3:14 am',
      'pattern': 'yyyy MMM do h:mm a',
      'expected': DateTime(1997, 9, 23, 3, 14)
    },
    {
      'input': '1997 Sep 23rd 3 am',
      'pattern': 'yyyy MMM do h a',
      'expected': DateTime(1997, 9, 23, 3, 0)
    },
  ];
}

List<Map<String, dynamic>> fromStringWithBasicDateTimeTestData() {
  return [
    {'input': '1997-09-23', 'expected': DateTime(1997, 9, 23)},
    {'input': '1997-9-02', 'expected': DateTime(1997, 9, 2)},
    {'input': '1997-12-2', 'expected': DateTime(1997, 12, 2)},
    {'input': '2022/02/25', 'expected': DateTime(2022, 2, 25)},
    {'input': '2022/5/05', 'expected': DateTime(2022, 5, 5)},
    {'input': '2022/10/5', 'expected': DateTime(2022, 10, 5)}
  ];
}

List<Map<String, dynamic>> fromStringWithDateTimeAndISOTestData() {
  return [
    {
      'input': '2022-12-26 11:18:12.946621',
      'expected': DateTime(2022, 12, 26, 11, 18, 12, 946, 621)
    },
    {
      'input': '2022-12-26T11:18:12.947031',
      'expected': DateTime(2022, 12, 26, 11, 18, 12, 947, 031)
    }
  ];
}

List<Map<String, dynamic>> fromListTestData() {
  return [
    {
      'input': [1997],
      'expected': DateTime(1997)
    },
    {
      'input': [1997, 9],
      'expected': DateTime(1997, 9)
    },
    {
      'input': [1997, 9, 23],
      'expected': DateTime(1997, 9, 23)
    },
    {
      'input': [1997, 9, 23, 12],
      'expected': DateTime(1997, 9, 23, 12)
    },
    {
      'input': [1997, 9, 23, 12, 11],
      'expected': DateTime(1997, 9, 23, 12, 11)
    },
    {
      'input': [1997, 9, 23, 12, 11, 22],
      'expected': DateTime(1997, 9, 23, 12, 11, 22)
    },
    {
      'input': [1997, 9, 23, 12, 11, 22, 123],
      'expected': DateTime(1997, 9, 23, 12, 11, 22, 123)
    },
    {
      'input': [1997, 9, 23, 12, 11, 22, 123, 456],
      'expected': DateTime(1997, 9, 23, 12, 11, 22, 123, 456)
    },
  ];
}
