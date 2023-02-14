import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/locale/locales/arLocale.dart';
import 'package:jiffy/src/locale/locales/azLocale.dart';
import 'package:jiffy/src/locale/locales/bnLocale.dart';
import 'package:jiffy/src/locale/locales/deLocale.dart';
import 'package:jiffy/src/locale/locales/enLocale.dart';
import 'package:jiffy/src/locale/locales/esLocale.dart';
import 'package:jiffy/src/locale/locales/faLocale.dart';
import 'package:jiffy/src/locale/locales/frLocale.dart';
import 'package:jiffy/src/locale/locales/hiLocale.dart';
import 'package:jiffy/src/locale/locales/huLocale.dart';
import 'package:jiffy/src/locale/locales/idLocale.dart';
import 'package:jiffy/src/locale/locales/itLocale.dart';
import 'package:jiffy/src/locale/locales/jaLocale.dart';
import 'package:jiffy/src/locale/locales/koLocale.dart';
import 'package:jiffy/src/locale/locales/nbLocale.dart';
import 'package:jiffy/src/locale/locales/nlLocale.dart';
import 'package:jiffy/src/locale/locales/plLocale.dart';
import 'package:jiffy/src/locale/locales/ptLocale.dart';
import 'package:jiffy/src/locale/locales/ruLocale.dart';
import 'package:jiffy/src/locale/locales/svLocale.dart';
import 'package:jiffy/src/locale/locales/thLocale.dart';
import 'package:jiffy/src/locale/locales/trLocale.dart';
import 'package:jiffy/src/locale/locales/ukLocale.dart';
import 'package:jiffy/src/locale/locales/zhLocale.dart';
import 'package:jiffy/src/utils/exception.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Test parsing and creating a Jiffy instance', () {
    test('Should successfully parse from string', () {
      // Setup
      final dateTime = '1997-09-23';
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy = Jiffy.parse(dateTime);

      // Verify
      expect(actualJiffy.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully parse from string using pattern', () {
      // Setup
      final dateTime = '23 Sep 97';
      final pattern = 'dd MMM yy';
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy = Jiffy.parse(dateTime, pattern: pattern);

      // Verify
      expect(actualJiffy.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully parse from DateTime', () {
      // Setup
      final dateTime = DateTime(1997, 9, 23);
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy = Jiffy.parseFromDateTime(dateTime);

      // Verify
      expect(actualJiffy.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully parse from Jiffy', () {
      // Setup
      final jiffy = Jiffy.parseFromDateTime(DateTime(1997, 9, 23));
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy = Jiffy.parseFromJiffy(jiffy);

      // Verify
      expect(actualJiffy.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully parse from List', () {
      // Setup
      final list = [1997, 9, 23];
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy = Jiffy.parseFromList(list);

      // Verify
      expect(actualJiffy.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully parse from Map', () {
      // Setup
      final map = {Unit.YEAR: 1997, Unit.MONTH: 9, Unit.DAY: 23};
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy = Jiffy.parseFromMap(map);

      // Verify
      expect(actualJiffy.year, expectedDateTime.year);
      expect(actualJiffy.month, expectedDateTime.month);
      expect(actualJiffy.date, expectedDateTime.day);
    });

    test('Should successfully parse from Microseconds since epoch', () {
      // Setup
      final microsecondsSinceEpoch =
          DateTime(1997, 9, 23).microsecondsSinceEpoch;
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy =
          Jiffy.parseFromMicrosecondsSinceEpoch(microsecondsSinceEpoch);

      // Verify
      expect(actualJiffy.microsecondsSinceEpoch,
          expectedDateTime.microsecondsSinceEpoch);
    });

    test('Should successfully parse from Milliseconds since epoch', () {
      // Setup
      final millisecondsSinceEpoch =
          DateTime(1997, 9, 23).millisecondsSinceEpoch;
      final expectedDateTime = DateTime(1997, 9, 23);

      // Execute
      final actualJiffy =
          Jiffy.parseFromMillisecondsSinceEpoch(millisecondsSinceEpoch);

      // Verify
      expect(actualJiffy.millisecondsSinceEpoch,
          expectedDateTime.millisecondsSinceEpoch);
    });

    test('Should successfully get date time now', () {
      // Setup
      final expectedDateTime = DateTime.now();

      // Execute
      final actualJiffy = Jiffy.now();

      // Verify
      expect(actualJiffy.year, expectedDateTime.year);
      expect(actualJiffy.month, expectedDateTime.month);
      expect(actualJiffy.date, expectedDateTime.day);
    });
  });

  group('Test getting and setting locales', () {
    test('Should successfully get locale', () async {
      // Setup
      final jiffy = Jiffy.now();
      await jiffy.setLocale('ja');

      final expectedLocaleCode = 'ja';

      // Execute
      final actualLocaleCode = jiffy.locale.code();

      // Verify
      expect(actualLocaleCode, expectedLocaleCode);
    });

    for (var testData in localeTestData()) {
      test('Should successfully set expectedLocale', () async {
        // Setup
        final jiffy = Jiffy.now();

        // Execute
        await jiffy.setLocale(testData['localeCode']);

        // Verify
        final actualLocale = jiffy.locale;
        expect(actualLocale.code(), testData['expectedLocale'].code());
      });
    }

    test('Should throw Jiffy exception if locale is not supported', () async {
      // Setup
      final jiffy = Jiffy.now();
      final unknownLocaleCode = 'unknown_locale';
      final expectedExceptionMessage = 'The locale `$unknownLocaleCode` is not '
          'supported, please check here for a list of supported locales';

      // Execute and Verify
      expect(
          () async => await jiffy.setLocale(unknownLocaleCode),
          throwsA(isA<JiffyException>().having((e) => e.message, 'message',
              contains(expectedExceptionMessage))));
    });
  });

  group('Test cloning Jiffy instance', () {
    test('Should successfully clone a Jiffy instance', () {
      // Setup
      final jiffy = Jiffy.now();

      // Execute
      final newJiffy = jiffy.clone();

      // Verify
      expect(newJiffy, isNot(jiffy));
      expect(newJiffy.microsecondsSinceEpoch, jiffy.microsecondsSinceEpoch);
    });
  });

  group('Test date time getters', () {
    final dateTime = DateTime.now();
    final jiffy = Jiffy.parseFromDateTime(dateTime);

    test('Should successfully get date time', () {
      // Setup
      final expectedDateTime = dateTime;

      // Expected
      final actualDateTime = jiffy.dateTime;

      // Verify
      expect(actualDateTime, expectedDateTime);
    });

    test('Should successfully get microsecond', () {
      // Setup
      final expectedMicrosecond = dateTime.microsecond;

      // Execute
      final actualMicrosecond = jiffy.microsecond;

      // Verify
      expect(actualMicrosecond, expectedMicrosecond);
    });

    test('Should successfully get microsecondsSinceEpoch', () {
      // Setup
      final expectedMicrosecondsSinceEpoch = dateTime.microsecondsSinceEpoch;

      // Execute
      final actualMicrosecondsSinceEpoch = jiffy.microsecondsSinceEpoch;

      // Verify
      expect(actualMicrosecondsSinceEpoch, expectedMicrosecondsSinceEpoch);
    });

    test('Should successfully get millisecond', () {
      // Setup
      final expectedMillisecond = dateTime.millisecond;

      // Execute
      final actualMillisecond = jiffy.millisecond;

      // Verify
      expect(actualMillisecond, expectedMillisecond);
    });

    test('Should successfully get millisecondsSinceEpoch', () {
      // Setup
      final expectedMillisecondsSinceEpoch = dateTime.millisecondsSinceEpoch;

      // Execute
      final actualMillisecondsSinceEpoch = jiffy.millisecondsSinceEpoch;

      // Verify
      expect(actualMillisecondsSinceEpoch, expectedMillisecondsSinceEpoch);
    });

    test('Should successfully get second', () {
      // Setup
      final expectedSecond = dateTime.second;

      // Execute
      final actualSecond = jiffy.second;

      // Verify
      expect(actualSecond, expectedSecond);
    });

    test('Should successfully get minute', () {
      // Setup
      final expectedMinute = dateTime.minute;

      // Execute
      final actualMinute = jiffy.minute;

      // Verify
      expect(actualMinute, expectedMinute);
    });

    test('Should successfully get hour', () {
      // Setup
      final expectedHour = dateTime.hour;

      // Execute
      final actualHour = jiffy.hour;

      // Verify
      expect(actualHour, expectedHour);
    });

    test('Should successfully get date', () {
      // Setup
      final expectedDate = dateTime.day;

      // Execute
      final actualDate = jiffy.date;

      // Verify
      expect(actualDate, expectedDate);
    });

    test('Should successfully get day of week', () async {
      // Setup
      final jiffy = Jiffy.parseFromList([2022, 12, 5]);
      await jiffy.setLocale('en_us');

      final expectedDayOfWeek = 2;

      // Execute
      final actualDayOfWeek = jiffy.dayOfWeek;

      // Verify
      expect(actualDayOfWeek, expectedDayOfWeek);
    });

    test('Should successfully get days in month', () {
      // Setup
      final jiffy = Jiffy.parseFromList([1997, 9]);

      final expectedDaysInMonth = 30;

      // Execute
      final actualDaysInMonth = jiffy.daysInMonth;

      // Verify
      expect(actualDaysInMonth, expectedDaysInMonth);
    });

    test('Should successfully get day of year', () {
      // Setup
      final jiffy = Jiffy.parseFromList([1997, 9, 23]);

      final expectedDayOfYear = 266;

      // Execute
      final actualDayOfYear = jiffy.dayOfYear;

      // Verify
      expect(actualDayOfYear, expectedDayOfYear);
    });

    test('Should successfully get day of year', () {
      // Setup
      final jiffy = Jiffy.parseFromList([1997, 9, 23]);

      final expectedWeek = 39;

      // Execute
      final actualWeek = jiffy.week;

      // Verify
      expect(actualWeek, expectedWeek);
    });

    test('Should successfully get month', () {
      // Setup
      final expectedMonth = dateTime.month;

      // Execute
      final actualMonth = jiffy.month;

      // Verify
      expect(actualMonth, expectedMonth);
    });

    test('Should successfully get quarter', () {
      // Setup
      final jiffy = Jiffy.parseFromList([1997, 9]);

      final expectedQuarter = 3;

      // Execute
      final actualDayOfQuarter = jiffy.quarter;

      // Verify
      expect(actualDayOfQuarter, expectedQuarter);
    });

    test('Should successfully get year', () {
      // Setup
      final expectedYear = dateTime.year;

      // Execute
      final actualYear = jiffy.year;

      // Verify
      expect(actualYear, expectedYear);
    });
  });

  group('Test date time manipulation', () {
    group('Test add and subtract', () {
      test('Should successfully add date time using duration', () {
        // Setup
        final underTest =
            Jiffy.parseFromList([1997, 9, 23, 12, 11, 22, 123, 456]);
        final duration = Duration(
            microseconds: 100,
            milliseconds: 200,
            seconds: 3,
            minutes: 4,
            hours: 2,
            days: 3);

        final expectedJiffy =
            Jiffy.parseFromList([1997, 9, 26, 14, 15, 25, 323, 556]);

        // Execute
        final actualJiffy = underTest.addDuration(duration);

        // Verify
        expect(actualJiffy.microsecondsSinceEpoch,
            expectedJiffy.microsecondsSinceEpoch);
      });

      test('Should successfully add date time', () {
        // Setup
        final underTest =
            Jiffy.parseFromList([1997, 9, 23, 12, 11, 22, 123, 456]);
        final microseconds = 100;
        final milliseconds = 200;
        final seconds = 3;
        final minutes = 4;
        final hours = 2;
        final days = 3;
        final weeks = 1;
        final months = 4;
        final years = 2;

        final expectedJiffy =
            Jiffy.parseFromList([2000, 2, 3, 14, 15, 25, 323, 556]);

        // Execute
        final actualJiffy = underTest.add(
            microseconds: microseconds,
            milliseconds: milliseconds,
            seconds: seconds,
            minutes: minutes,
            hours: hours,
            days: days,
            weeks: weeks,
            months: months,
            years: years);

        // Verify
        expect(actualJiffy.microsecondsSinceEpoch,
            expectedJiffy.microsecondsSinceEpoch);
      });

      test('Should successfully subtract date time using duration', () {
        // Setup
        final underTest =
            Jiffy.parseFromList([1997, 9, 23, 12, 11, 22, 123, 456]);
        final duration = Duration(
            microseconds: 100,
            milliseconds: 100,
            seconds: 3,
            minutes: 4,
            hours: 2,
            days: 3);

        final expectedJiffy =
            Jiffy.parseFromList([1997, 9, 20, 10, 7, 19, 23, 356]);

        // Execute
        final actualJiffy = underTest.subtractDuration(duration);

        // Verify
        expect(actualJiffy.microsecondsSinceEpoch,
            expectedJiffy.microsecondsSinceEpoch);
      });

      test('Should successfully subtract date time', () {
        // Setup
        final underTest =
            Jiffy.parseFromList([1997, 9, 23, 12, 11, 22, 123, 456]);
        final microseconds = 100;
        final milliseconds = 100;
        final seconds = 3;
        final minutes = 4;
        final hours = 2;
        final days = 3;
        final weeks = 1;
        final months = 4;
        final years = 2;

        final expectedJiffy =
            Jiffy.parseFromList([1995, 5, 13, 10, 7, 19, 23, 356]);

        // Execute
        final actualJiffy = underTest.subtract(
            microseconds: microseconds,
            milliseconds: milliseconds,
            seconds: seconds,
            minutes: minutes,
            hours: hours,
            days: days,
            weeks: weeks,
            months: months,
            years: years);

        // Verify
        expect(actualJiffy.microsecondsSinceEpoch,
            expectedJiffy.microsecondsSinceEpoch);
      });
    });

    group('Test startOf and endOf', () {
      test('Should successfully get startOf date time', () {
        // Setup
        final underTest = Jiffy.parseFromList([1997, 9, 23, 11, 30, 22]);

        final expectedJiffy = Jiffy.parseFromList([1997, 9, 23, 0, 0, 0, 0, 0]);

        // Execute
        final actualJiffy = underTest.startOf(Unit.DAY);

        // Verify
        expect(actualJiffy.microsecondsSinceEpoch,
            expectedJiffy.microsecondsSinceEpoch);
      });

      test('Should successfully get endOf date time', () {
        // Setup
        final underTest = Jiffy.parseFromList([1997, 9, 23, 11, 30, 22]);

        final expectedJiffy =
            Jiffy.parseFromList([1997, 9, 23, 23, 59, 59, 999, 999]);

        // Execute
        final actualJiffy = underTest.endOf(Unit.DAY);

        // Verify
        expect(actualJiffy.microsecondsSinceEpoch,
            expectedJiffy.microsecondsSinceEpoch);
      });
    });

    group('Test toLocal and toUtc', () {
      test('Should successfully convert utc date time to local', () {
        // Setup
        final underTest = Jiffy.now().toUtc();

        final expectedIsLocal = true;

        // Execute
        final actualJiffy = underTest.toLocal();

        // Verify
        expect(actualJiffy.isLocal, expectedIsLocal);
      });

      test('Should successfully convert local date time to utc', () {
        // Setup
        final underTest = Jiffy.now().toLocal();

        final expectedIsUtc = true;

        // Execute
        final actualJiffy = underTest.toUtc();

        // Verify
        expect(actualJiffy.isUtc, expectedIsUtc);
      });
    });
  });

  group('Test date time displaying', () {
    group('Test date time format', () {
      test('Should successfully format to ISO8601 if pattern is not passed',
          () {
        // Setup
        final underTest =
            Jiffy.parseFromList([1997, 9, 23, 11, 30, 22, 345, 222]);

        final expectedFormat = '1997-09-23T11:30:22.345222';

        // Execute
        final actualFormat = underTest.format();

        // Verify
        expect(actualFormat, expectedFormat);
      });

      test('Should successfully format based on pattern', () {
        // Setup
        final underTest =
            Jiffy.parseFromList([1997, 9, 23, 11, 30, 22, 345, 222]);
        final pattern = 'yyyy, do MMM [at] HH:mm a';

        final expectedFormat = '1997, 23rd Sep at 11:30 AM';

        // Execute
        final actualFormat = underTest.format(pattern: pattern);

        // Verify
        expect(actualFormat, expectedFormat);
      });
    });

    group('Test date time default format', () {
      for (var testData in defaultDisplayDateTimeFormatsTestData()) {
        test('Should successfully display date time using prebuilt formats',
            () {
          // Setup
          final jiffy =
              Jiffy.parseFromDateTime((testData['dateTime'] as DateTime));

          // Execute
          final actualFormat =
              (testData['function'] as Function(Jiffy)).call(jiffy);

          // Verify
          expect(actualFormat, testData['expectedFormat']);
        });
      }
    });

    group('Test displaying relative date time', () {
      test('Should successfully get relative date time from', () {
        // Setup
        final underTest = Jiffy.parseFromList([1997]);
        final jiffyFrom = Jiffy.parseFromList([2022]);

        final expectedRelativeDateTime = '25 years ago';

        // Execute
        final actualRelativeDateTime = underTest.from(jiffyFrom);

        // Verify
        expect(actualRelativeDateTime, expectedRelativeDateTime);
      });

      test('Should successfully get relative date time fromNow', () {
        // Setup
        final underTest = Jiffy.now().subtract(years: 25);

        final expectedRelativeDateTime = '25 years ago';

        // Execute
        final actualRelativeDateTime = underTest.fromNow();

        // Verify
        expect(actualRelativeDateTime, expectedRelativeDateTime);
      });

      test('Should successfully get relative date time to', () {
        // Setup
        final underTest = Jiffy.parseFromList([1997]);
        final jiffyTo = Jiffy.parseFromList([2022]);

        final expectedRelativeDateTime = 'in 25 years';

        // Execute
        final actualRelativeDateTime = underTest.to(jiffyTo);

        // Verify
        expect(actualRelativeDateTime, expectedRelativeDateTime);
      });

      test('Should successfully get relative date time toNow', () {
        // Setup
        final underTest = Jiffy.now().subtract(years: 25);

        final expectedRelativeDateTime = 'in 25 years';

        // Execute
        final actualRelativeDateTime = underTest.toNow();

        // Verify
        expect(actualRelativeDateTime, expectedRelativeDateTime);
      });
    });

    group('Test displaying diff', () {
      test('Should successfully get diff between two date times', () {
        // Setup
        final underTest = Jiffy.parseFromList([1997, 9, 23]);
        final jiffyFrom = Jiffy.parseFromList([2022]);

        final expectedDifference = -291.2903225806452;

        // Execute
        final actualDifference = underTest.diff(jiffyFrom, unit: Unit.MONTH);

        // Verify
        expect(actualDifference, expectedDifference);
      });

      test('Should successfully get diff between two date times as float', () {
        // Setup
        final underTest = Jiffy.parseFromList([1997, 9, 23]);
        final jiffyFrom = Jiffy.parseFromList([2022]);

        final expectedDifference = -291;

        // Execute
        final actualDifference =
            underTest.diff(jiffyFrom, unit: Unit.MONTH, asFloat: true);

        // Verify
        expect(actualDifference, expectedDifference);
      });
    });
  });

  group('Test date time querying', () {
    for (var testData in isBeforeTestData()) {
      test('Should successfully check if date time is before another', () {
        // Setup
        final firstJiffy = testData['firstJiffy'] as Jiffy;
        final secondJiffy = testData['secondJiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = firstJiffy.isBefore(secondJiffy);

        // Verify
        expect(actual, expected);
      });
    }

    for (var testData in isAfterTestData()) {
      test('Should successfully check if date time is after another', () {
        // Setup
        final firstJiffy = testData['firstJiffy'] as Jiffy;
        final secondJiffy = testData['secondJiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = firstJiffy.isAfter(secondJiffy);

        // Verify
        expect(actual, expected);
      });
    }

    for (var testData in isSameTestData()) {
      test('Should successfully check if date time is same', () {
        // Setup
        final firstJiffy = testData['firstJiffy'] as Jiffy;
        final secondJiffy = testData['secondJiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = firstJiffy.isSame(secondJiffy);

        // Verify
        expect(actual, expected);
      });
    }

    for (var testData in isSameOrBeforeTestData()) {
      test('Should successfully check if date time is same or before', () {
        // Setup
        final firstJiffy = testData['firstJiffy'] as Jiffy;
        final secondJiffy = testData['secondJiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = firstJiffy.isSameOrBefore(secondJiffy);

        // Verify
        expect(actual, expected);
      });
    }

    for (var testData in isSameOrAfterTestData()) {
      test('Should successfully check if date time is same or after', () {
        // Setup
        final firstJiffy = testData['firstJiffy'] as Jiffy;
        final secondJiffy = testData['secondJiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = firstJiffy.isSameOrAfter(secondJiffy);

        // Verify
        expect(actual, expected);
      });
    }

    for (var testData in isBetweenTestData()) {
      test('Should successfully check if date time is same or after', () {
        // Setup
        final firstJiffy = testData['firstJiffy'] as Jiffy;
        final secondJiffy = testData['secondJiffy'] as Jiffy;
        final thirdJiffy = testData['thirdJiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = firstJiffy.isBetween(secondJiffy, thirdJiffy);

        // Verify
        expect(actual, expected);
      });
    }

    for (var testData in isJiffyLocalTestData()) {
      test('Should successfully check if jiffy is local', () {
        // Setup
        final jiffy = testData['jiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = jiffy.isLocal;

        // Verify
        expect(actual, expected);
      });
    }

    for (var testData in isJiffyUtcTestData()) {
      test('Should successfully check if jiffy is utc', () {
        // Setup
        final jiffy = testData['jiffy'] as Jiffy;

        final expected = testData['expected'];

        // Execute
        final actual = jiffy.isUtc;

        // Verify
        expect(actual, expected);
      });
    }
  });

  for (var testData in isLeapYearTestData()) {
    test('Should successfully check if jiffy year is leap year', () {
      // Setup
      final jiffy = testData['jiffy'] as Jiffy;

      final expected = testData['expectedIsLeapYear'];

      // Execute
      final actualIsLeapYear = jiffy.isLeapYear;

      // Verify
      expect(actualIsLeapYear, expected);
    });
  }
}

List<Map<String, dynamic>> localeTestData() {
  return [
    {
      'localeCode': 'en',
      'expectedLocale': EnLocale(),
    },
    {
      'localeCode': 'en_us',
      'expectedLocale': EnUsLocale(),
    },
    {
      'localeCode': 'en_sg',
      'expectedLocale': EnSgLocale(),
    },
    {
      'localeCode': 'en_au',
      'expectedLocale': EnAuLocale(),
    },
    {
      'localeCode': 'en_ca',
      'expectedLocale': EnCaLocale(),
    },
    {
      'localeCode': 'en_gb',
      'expectedLocale': EnGbLocale(),
    },
    {
      'localeCode': 'en_ie',
      'expectedLocale': EnIeLocale(),
    },
    {
      'localeCode': 'en_il',
      'expectedLocale': EnIlLocale(),
    },
    {
      'localeCode': 'en_nz',
      'expectedLocale': EnNzLocale(),
    },
    {
      'localeCode': 'es',
      'expectedLocale': EsLocale(),
    },
    {
      'localeCode': 'es_do',
      'expectedLocale': EsDoLocale(),
    },
    {
      'localeCode': 'es_us',
      'expectedLocale': EsUsLocale(),
    },
    {
      'localeCode': 'fr',
      'expectedLocale': FrLocale(),
    },
    {
      'localeCode': 'fr_ch',
      'expectedLocale': FrChLocale(),
    },
    {
      'localeCode': 'fr_ca',
      'expectedLocale': FrCaLocale(),
    },
    {
      'localeCode': 'zh',
      'expectedLocale': ZhLocale(),
    },
    {
      'localeCode': 'zh_cn',
      'expectedLocale': ZhCnLocale(),
    },
    {
      'localeCode': 'zh_hk',
      'expectedLocale': ZhHkLocale(),
    },
    {
      'localeCode': 'zh_tw',
      'expectedLocale': ZhTwLocale(),
    },
    {
      'localeCode': 'de',
      'expectedLocale': DeLocale(),
    },
    {
      'localeCode': 'de_de',
      'expectedLocale': DeDeLocale(),
    },
    {
      'localeCode': 'de_at',
      'expectedLocale': DeAtLocale(),
    },
    {
      'localeCode': 'de_ch',
      'expectedLocale': DeChLocale(),
    },
    {
      'localeCode': 'it',
      'expectedLocale': ItLocale(),
    },
    {
      'localeCode': 'it_ch',
      'expectedLocale': ItChLocale(),
    },
    {
      'localeCode': 'ar',
      'expectedLocale': ArLocale(),
    },
    {
      'localeCode': 'ar_ly',
      'expectedLocale': ArLyLocale(),
    },
    {
      'localeCode': 'ar_dz',
      'expectedLocale': ArDzLocale(),
    },
    {
      'localeCode': 'ar_kw',
      'expectedLocale': ArKwLocale(),
    },
    {
      'localeCode': 'ar_sa',
      'expectedLocale': ArSaLocale(),
    },
    {
      'localeCode': 'ar_ma',
      'expectedLocale': ArMaLocale(),
    },
    {
      'localeCode': 'ar_tn',
      'expectedLocale': ArTnLocale(),
    },
    {
      'localeCode': 'az',
      'expectedLocale': AzLocale(),
    },
    {
      'localeCode': 'id',
      'expectedLocale': IdLocale(),
    },
    {
      'localeCode': 'ja',
      'expectedLocale': JaLocale(),
    },
    {
      'localeCode': 'ko',
      'expectedLocale': KoLocale(),
    },
    {
      'localeCode': 'ru',
      'expectedLocale': RuLocale(),
    },
    {
      'localeCode': 'uk',
      'expectedLocale': UkLocale(),
    },
    {
      'localeCode': 'hi',
      'expectedLocale': HiLocale(),
    },
    {
      'localeCode': 'hu',
      'expectedLocale': HuLocale(),
    },
    {
      'localeCode': 'hu_hu',
      'expectedLocale': HuHuLocale(),
    },
    {
      'localeCode': 'pt',
      'expectedLocale': PtLocale(),
    },
    {
      'localeCode': 'pt_br',
      'expectedLocale': PtBrLocale(),
    },
    {
      'localeCode': 'pl',
      'expectedLocale': PlLocale(),
    },
    {
      'localeCode': 'tr',
      'expectedLocale': TrLocale(),
    },
    {
      'localeCode': 'sv',
      'expectedLocale': SvLocale(),
    },
    {
      'localeCode': 'nb',
      'expectedLocale': NbLocale(),
    },
    {
      'localeCode': 'fa',
      'expectedLocale': FaLocale(),
    },
    {
      'localeCode': 'bn',
      'expectedLocale': BnLocale(),
    },
    {
      'localeCode': 'nl',
      'expectedLocale': NlLocale(),
    },
    {
      'localeCode': 'th',
      'expectedLocale': ThLocale(),
    },
  ];
}

List<Map<String, dynamic>> defaultDisplayDateTimeFormatsTestData() {
  return [
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.E,
      'expectedFormat': 'Tue'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.EEEE,
      'expectedFormat': 'Tuesday'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.Md,
      'expectedFormat': '9/23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.MEd,
      'expectedFormat': 'Tue, 9/23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.MMM,
      'expectedFormat': 'Sep'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.MMMd,
      'expectedFormat': 'Sep 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.MMMEd,
      'expectedFormat': 'Tue, Sep 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.MMMM,
      'expectedFormat': 'September'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.MMMMd,
      'expectedFormat': 'September 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.MMMMEEEEd,
      'expectedFormat': 'Tuesday, September 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.QQQ,
      'expectedFormat': 'Q3'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.QQQQ,
      'expectedFormat': '3rd quarter'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yM,
      'expectedFormat': '9/1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMd,
      'expectedFormat': '9/23/1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMEd,
      'expectedFormat': 'Tue, 9/23/1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMM,
      'expectedFormat': 'Sep 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMd,
      'expectedFormat': 'Sep 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMdjm,
      'expectedFormat': 'Sep 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMEd,
      'expectedFormat': 'Tue, Sep 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMEdjm,
      'expectedFormat': 'Tue, Sep 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMM,
      'expectedFormat': 'September 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMMd,
      'expectedFormat': 'September 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMMdjm,
      'expectedFormat': 'September 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMMEEEEd,
      'expectedFormat': 'Tuesday, September 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yMMMMEEEEdjm,
      'expectedFormat': 'Tuesday, September 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yQQQ,
      'expectedFormat': 'Q3 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.yQQQQ,
      'expectedFormat': '3rd quarter 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.Hm,
      'expectedFormat': '12:11'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.Hms,
      'expectedFormat': '12:11:22'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.j,
      'expectedFormat': '12 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.jm,
      'expectedFormat': '12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (Jiffy jiffy) => jiffy.jms,
      'expectedFormat': '12:11:22 PM'
    },
  ];
}

List<Map<String, dynamic>> isBeforeTestData() {
  final jiffy = Jiffy.now();
  return [
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.add(days: 5), 'expected': true},
    {
      'firstJiffy': jiffy,
      'secondJiffy': jiffy.subtract(days: 5),
      'expected': false
    }
  ];
}

List<Map<String, dynamic>> isAfterTestData() {
  final jiffy = Jiffy.now();
  return [
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.add(days: 5), 'expected': false},
    {
      'firstJiffy': jiffy,
      'secondJiffy': jiffy.subtract(days: 5),
      'expected': true
    }
  ];
}

List<Map<String, dynamic>> isSameTestData() {
  final jiffy = Jiffy.now();
  return [
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.clone(), 'expected': true},
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.add(days: 5), 'expected': false},
    {
      'firstJiffy': jiffy,
      'secondJiffy': jiffy.subtract(days: 5),
      'expected': false
    }
  ];
}

List<Map<String, dynamic>> isSameOrBeforeTestData() {
  final jiffy = Jiffy.now();
  return [
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.clone(), 'expected': true},
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.add(days: 5), 'expected': true},
    {
      'firstJiffy': jiffy,
      'secondJiffy': jiffy.subtract(days: 5),
      'expected': false
    }
  ];
}

List<Map<String, dynamic>> isSameOrAfterTestData() {
  final jiffy = Jiffy.now();
  return [
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.clone(), 'expected': true},
    {'firstJiffy': jiffy, 'secondJiffy': jiffy.add(days: 5), 'expected': false},
    {
      'firstJiffy': jiffy,
      'secondJiffy': jiffy.subtract(days: 5),
      'expected': true
    }
  ];
}

List<Map<String, dynamic>> isBetweenTestData() {
  final jiffy = Jiffy.now();
  return [
    {
      'firstJiffy': jiffy,
      'secondJiffy': jiffy.subtract(days: 5),
      'thirdJiffy': jiffy.add(days: 5),
      'expected': true
    },
    {
      'firstJiffy': jiffy.subtract(days: 5),
      'secondJiffy': jiffy.subtract(days: 5),
      'thirdJiffy': jiffy.add(days: 5),
      'expected': false
    },
    {
      'firstJiffy': jiffy.add(days: 5),
      'secondJiffy': jiffy.subtract(days: 5),
      'thirdJiffy': jiffy.add(days: 5),
      'expected': false
    },
    {
      'firstJiffy': jiffy.subtract(days: 6),
      'secondJiffy': jiffy.subtract(days: 5),
      'thirdJiffy': jiffy.add(days: 5),
      'expected': false
    },
    {
      'firstJiffy': jiffy.add(days: 6),
      'secondJiffy': jiffy.subtract(days: 5),
      'thirdJiffy': jiffy.add(days: 5),
      'expected': false
    }
  ];
}

List<Map<String, dynamic>> isJiffyLocalTestData() {
  return [
    {'jiffy': Jiffy.now().toLocal(), 'expected': true},
    {'jiffy': Jiffy.now().toUtc(), 'expected': false},
  ];
}

List<Map<String, dynamic>> isJiffyUtcTestData() {
  return [
    {'jiffy': Jiffy.now().toLocal(), 'expected': false},
    {'jiffy': Jiffy.now().toUtc(), 'expected': true},
  ];
}

List<Map<String, dynamic>> isLeapYearTestData() {
  return [
    {
      'jiffy': Jiffy.parseFromList([1997]),
      'expectedIsLeapYear': false
    },
    {
      'jiffy': Jiffy.parseFromList([2022]),
      'expectedIsLeapYear': false
    },
    {
      'jiffy': Jiffy.parseFromList([2020]),
      'expectedIsLeapYear': true
    },
    {
      'jiffy': Jiffy.parseFromList([2018]),
      'expectedIsLeapYear': false
    },
    {
      'jiffy': Jiffy.parseFromList([2016]),
      'expectedIsLeapYear': true
    },
  ];
}
