import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/enums/units.dart';
import 'package:jiffy/src/locale/enLocale.dart';
import 'package:jiffy/src/parser.dart';
import 'package:jiffy/src/utils/exception.dart';
import 'package:test/test.dart';

void main() {
  final underTest = Parser();

  group('Test parsing datetime from string', () {
    test('Should successfully parse datetime without a pattern', () {});

    for (var testData in validParseToStringWithPatternTestData()) {
      test('Should successfully parse datetime from pattern', () {
        // Setup
        final locale = EnLocale(StartOfWeek.MONDAY);

        // Execute
        final actualDateTime = underTest.fromString(
            testData['input'], testData['pattern'], locale);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    test('Should throw JiffyException if pattern is provided and is empty', () {
      // Setup
      final input = '2022-12-25';
      final pattern = '';
      final locale = EnLocale(StartOfWeek.MONDAY);

      final expectedExceptionMessage = 'The provided pattern for `$input` '
          'cannot be empty';

      // Execute and Verify
      expect(
          () => underTest.fromString(input, pattern, locale),
          throwsA(isA<JiffyException>().having((e) => e.message, 'message',
              contains(expectedExceptionMessage))));
    });

    test('Should throw JiffyException if datetime cannot be parsed', () {
      // Setup
      final input = '2022-12-25';
      final pattern = 'invalid-pattern';
      final locale = EnLocale(StartOfWeek.MONDAY);

      final expectedExceptionMessage = 'JiffyException: ';

      // Execute and Verify
      expect(
          () => underTest.fromString(input, pattern, locale),
          throwsA(isA<JiffyException>().having((e) => e.message, 'message',
              contains(expectedExceptionMessage))));
    });

    for (var testData in validParseToStringWithBasicDateTimeTestData()) {
      test('Should successfully parse basic datetime format', () {
        // Setup
        final pattern = null;
        final locale = EnLocale(StartOfWeek.MONDAY);

        // Execute
        final actualDateTime =
            underTest.fromString(testData['input'], pattern, locale);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    for (var testData in validParseToStringWithDateTimeAndISOTestData()) {
      test('Should successfully parse DateTime and ISO datetime format', () {
        // Setup
        final pattern = null;
        final locale = EnLocale(StartOfWeek.MONDAY);

        // Execute
        final actualDateTime =
            underTest.fromString(testData['input'], pattern, locale);

        // Verify
        expect(actualDateTime, testData['expected']);
      });
    }

    test('Should throw JiffyException if input datetime cannot be parsed', () {
      // Setup
      final input = 'invalid-input-date-time';
      final pattern = null;
      final locale = EnLocale(StartOfWeek.MONDAY);

      final expectedExceptionMessage = 'Could not read date time `$input`, '
          'try using a pattern, e.g. Jiffy("12, Oct", "dd, MMM")';

      // Execute and Verify
      expect(
          () => underTest.fromString(input, pattern, locale),
          throwsA(isA<JiffyException>().having((e) => e.message, 'message',
              contains(expectedExceptionMessage))));
    });
  });

  group('Test parsing datetime from list', () {
    for (var testData in validParseToListTestData()) {
      test('Should successfully parse datetime as list', () {
        // Execute
        final actualDateTime = underTest.fromList(testData['input']);

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
          () => underTest.fromList(input),
          throwsA(isA<JiffyException>().having((e) => e.message, 'message',
              contains(expectedExceptionMessage))));
    });
  });

  group('Test parsing datetime from map', () {
    test('Should successfully parse datetime as map', () {
      // Setup
      final input = {
        Units.YEAR: 1997,
        Units.MONTH: 9,
        Units.DAY: 23,
        Units.HOUR: 12,
        Units.MINUTE: 22,
        Units.SECOND: 11,
        Units.MILLISECOND: 123,
        Units.MICROSECOND: 456,
      };

      final expectedDateTime = DateTime(1997, 9, 23, 12, 22, 11, 123, 456);
      // Execute
      final actualDateTime = underTest.fromMap(input);

      // Verify
      expect(actualDateTime, expectedDateTime);
    });

    test('Should throw JiffyException if datetime map is empty', () {
      // Setup
      final input = <Units, int>{};

      final expectedExceptionMessage = 'The provided datetime map cannot '
          'be empty';

      // Execute and Verify
      expect(
          () => underTest.fromMap(input),
          throwsA(isA<JiffyException>().having((e) => e.message, 'message',
              contains(expectedExceptionMessage))));
    });
  });
}

List<Map<String, dynamic>> validParseToStringWithPatternTestData() {
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

List<Map<String, dynamic>> validParseToStringWithBasicDateTimeTestData() {
  return [
    {'input': '1997-09-23', 'expected': DateTime(1997, 9, 23)},
    {'input': '1997-9-02', 'expected': DateTime(1997, 9, 2)},
    {'input': '1997-12-2', 'expected': DateTime(1997, 12, 2)},
    {'input': '2022/02/25', 'expected': DateTime(2022, 2, 25)},
    {'input': '2022/5/05', 'expected': DateTime(2022, 5, 5)},
    {'input': '2022/10/5', 'expected': DateTime(2022, 10, 5)}
  ];
}

List<Map<String, dynamic>> validParseToStringWithDateTimeAndISOTestData() {
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

List<Map<String, dynamic>> validParseToListTestData() {
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
