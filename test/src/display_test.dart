import 'package:jiffy/src/display.dart';
import 'package:jiffy/src/enums/units.dart';
import 'package:jiffy/src/getter.dart';
import 'package:jiffy/src/manipulator.dart';
import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

void main() {
  final getter = Getter();
  final manipulator = Manipulator(getter);

  final underTest = Display(getter, manipulator);

  group('Test diff', () {
    for (var testData in diffDateTimeTestData()) {
      test('Should successfully get difference between two datetime', () {
        // Setup
        final asFloat = true;

        // Execute
        final actualDifference = underTest.diff(testData['firstDateTime'],
            testData['secondDateTime'], testData['unit'], asFloat);

        // Verify
        expect(actualDifference, testData['expectedDifference']);
      });
    }

    test('Should successfully get difference when float is disabled', () {
      // Setup
      final firstDateTime = DateTime(2022, 12, 5);
      final secondDateTime = DateTime(2022, 12, 8);
      final unit = Units.WEEK;
      final asFloat = false;

      final expectedDifference = -0.42857142857142855;

      // Execute
      final actualDifference =
          underTest.diff(firstDateTime, secondDateTime, unit, asFloat);

      // Verify
      expect(actualDifference, expectedDifference);
    });
  });
}

List<Map<String, dynamic>> diffDateTimeTestData() {
  return [
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 24),
      'unit': Units.MICROSECOND,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 10),
      'unit': Units.MICROSECOND,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 2),
      'unit': Units.MICROSECOND,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 24),
      'unit': Units.MILLISECOND,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 10),
      'unit': Units.MILLISECOND,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 22, 2),
      'unit': Units.MILLISECOND,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 24),
      'unit': Units.SECOND,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 10),
      'unit': Units.SECOND,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 11, 2),
      'unit': Units.SECOND,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 10),
      'secondDateTime': DateTime(1997, 9, 23, 12, 24),
      'unit': Units.MINUTE,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 24),
      'secondDateTime': DateTime(1997, 9, 23, 12, 10),
      'unit': Units.MINUTE,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 12, 2),
      'secondDateTime': DateTime(1997, 9, 23, 12, 2),
      'unit': Units.MINUTE,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 10),
      'secondDateTime': DateTime(1997, 9, 23, 24),
      'unit': Units.HOUR,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 24),
      'secondDateTime': DateTime(1997, 9, 23, 10),
      'unit': Units.HOUR,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 23, 2),
      'secondDateTime': DateTime(1997, 9, 23, 2),
      'unit': Units.HOUR,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(1997, 9, 10),
      'secondDateTime': DateTime(1997, 9, 24),
      'unit': Units.DAY,
      'expectedDifference': -14
    },
    {
      'firstDateTime': DateTime(1997, 9, 24),
      'secondDateTime': DateTime(1997, 9, 10),
      'unit': Units.DAY,
      'expectedDifference': 14
    },
    {
      'firstDateTime': DateTime(1997, 9, 2),
      'secondDateTime': DateTime(1997, 9, 2),
      'unit': Units.DAY,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 20),
      'unit': Units.WEEK,
      'expectedDifference': -2
    },
    {
      'firstDateTime': DateTime(2022, 12, 22),
      'secondDateTime': DateTime(2022, 12, 6),
      'unit': Units.WEEK,
      'expectedDifference': 2
    },
    {
      'firstDateTime': DateTime(2022, 12, 5),
      'secondDateTime': DateTime(2022, 12, 8),
      'unit': Units.WEEK,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(2022, 5),
      'secondDateTime': DateTime(2022, 7),
      'unit': Units.MONTH,
      'expectedDifference': -2
    },
    {
      'firstDateTime': DateTime(2022, 7),
      'secondDateTime': DateTime(2022, 5),
      'unit': Units.MONTH,
      'expectedDifference': 2
    },
    {
      'firstDateTime': DateTime(2022, 5),
      'secondDateTime': DateTime(2022, 5),
      'unit': Units.MONTH,
      'expectedDifference': 0
    },
    {
      'firstDateTime': DateTime(2016, 2, 29),
      'secondDateTime': DateTime(2016, 1, 30),
      'unit': Units.MONTH,
      'expectedDifference': 1
    },
    {
      'firstDateTime': DateTime(2016, 2, 29),
      'secondDateTime': DateTime(2016, 1, 31),
      'unit': Units.MONTH,
      'expectedDifference': 1
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1999),
      'unit': Units.YEAR,
      'expectedDifference': -2
    },
    {
      'firstDateTime': DateTime(1999),
      'secondDateTime': DateTime(1997),
      'unit': Units.YEAR,
      'expectedDifference': 2
    },
    {
      'firstDateTime': DateTime(1997),
      'secondDateTime': DateTime(1997),
      'unit': Units.YEAR,
      'expectedDifference': 0
    },
  ];
}
