import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/enums/units.dart';
import 'package:test/test.dart';

void main() {
  group('Test Jiffy().add() method adding datetime', () {
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in milliseconds',
        () {
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..add(duration: Duration(milliseconds: 1)))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.001');
    });
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in seconds',
        () {
      expect((Jiffy()..add(duration: Duration(seconds: 1))).second,
          DateTime.now().add(Duration(seconds: 1)).second);
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..add(duration: Duration(seconds: 1)))
              .dateTime
              .toString(),
          '2019-10-13 00:00:01.000');
    });
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in minutes',
        () {
      expect((Jiffy()..add(duration: Duration(minutes: 1))).minute,
          DateTime.now().add(Duration(minutes: 1)).minute);
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..add(duration: Duration(minutes: 1)))
              .dateTime
              .toString(),
          '2019-10-13 00:01:00.000');
    });
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in hours',
        () {
      expect((Jiffy()..add(duration: Duration(hours: 1))).hour,
          DateTime.now().add(Duration(hours: 1)).hour);
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..add(duration: Duration(hours: 1)))
              .dateTime
              .toString(),
          '2019-10-13 01:00:00.000');
    });
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in days',
        () {
      expect((Jiffy()..add(duration: Duration(days: 1))).date,
          DateTime.now().add(Duration(days: 1)).day);
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..add(duration: Duration(days: 1)))
              .dateTime
              .toString(),
          '2019-10-14 00:00:00.000');
    });
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in weeks',
        () {
      expect((Jiffy()..add(weeks: 1)).date,
          DateTime.now().add(Duration(days: 1 * 7)).day);
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')..add(weeks: 1))
              .dateTime
              .toString(),
          '2019-10-20 00:00:00.000');
    });
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in months',
        () {
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')..add(months: 1))
              .dateTime
              .toString(),
          '2019-11-13 00:00:00.000');
    });
    test(
        'test Jiffy().add() method with parsing date time should add and return correct date time in years',
        () {
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')..add(years: 1))
              .dateTime
              .toString(),
          '2020-10-13 00:00:00.000');
    });
  });

  group('Test Jiffy subtracting datetime', () {
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in milliseconds',
        () {
      expect(
          (Jiffy('2019-10-13 23:00:00')
                ..subtract(duration: Duration(milliseconds: 1)))
              .dateTime
              .toString(),
          '2019-10-13 22:59:59.999');
    });
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in seconds',
        () {
      expect((Jiffy()..subtract(duration: Duration(seconds: 1))).second,
          DateTime.now().subtract(Duration(seconds: 1)).second);
      expect(
          (Jiffy('2019-10-13 12:00:01', 'yyyy-MM-dd hh:mm:ss')
                ..subtract(duration: Duration(seconds: 1)))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.000');
    });
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in minutes',
        () {
      expect((Jiffy()..subtract(duration: Duration(minutes: 1))).minute,
          DateTime.now().subtract(Duration(minutes: 1)).minute);
      expect(
          (Jiffy('2019-10-13 12:01:00', 'yyyy-MM-dd hh:mm:ss')
                ..subtract(duration: Duration(minutes: 1)))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.000');
    });
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in hours',
        () {
      expect((Jiffy()..subtract(duration: Duration(hours: 1))).hour,
          DateTime.now().subtract(Duration(hours: 1)).hour);
      expect(
          (Jiffy('2019-10-13 13:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..subtract(duration: Duration(hours: 1)))
              .dateTime
              .toString(),
          '2019-10-13 12:00:00.000');
    });
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in day',
        () {
      expect((Jiffy()..subtract(duration: Duration(days: 1))).date,
          DateTime.now().subtract(Duration(days: 1)).day);
      expect(
          (Jiffy('2019-10-14 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..subtract(duration: Duration(days: 1)))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.000');
    });
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in weeks',
        () {
      expect((Jiffy()..subtract(weeks: 1)).date,
          DateTime.now().subtract(Duration(days: 1 * 7)).day);
      expect(
          (Jiffy('2019-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..subtract(weeks: 1))
              .dateTime
              .toString(),
          '2019-10-06 00:00:00.000');
    });
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in months',
        () {
      expect(
          (Jiffy('2019-11-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..subtract(months: 1))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.000');
    });
    test(
        'test Jiffy().subtract() method with parsing date time should subtract and return correct date time in years',
        () {
      expect(
          (Jiffy('2020-10-13 12:00:00', 'yyyy-MM-dd hh:mm:ss')
                ..subtract(years: 1))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.000');
    });
  });

  group('Test Jiffy().startOf() datetime', () {
    test(
        'test Jiffy().startOf() method with parsing date time should add and return correct start of date time in seconds',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.SECOND))
              .dateTime
              .toString(),
          '2019-10-13 13:12:12.000');
    });
    test(
        'test Jiffy().startOf() method with parsing date time should add and return correct start of date time in minutes',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.MINUTE))
              .dateTime
              .toString(),
          '2019-10-13 13:12:00.000');
    });
    test(
        'test Jiffy().startOf() method with parsing date time should add and return correct start of date time in hours',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.HOUR))
              .dateTime
              .toString(),
          '2019-10-13 13:00:00.000');
    });
    test(
        'test Jiffy().startOf() method with parsing date time should add and return correct start of date time in days',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.DAY))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.000');
    });
    test(
        'test Jiffy().startOf() method with parsing date time should add and return correct start of date time in weeks',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.WEEK))
              .dateTime
              .toString(),
          '2019-10-13 00:00:00.000');
      expect(
          (Jiffy('2019-10-10 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.WEEK))
              .dateTime
              .toString(),
          '2019-10-06 00:00:00.000');
    });
    test(
        'test Jiffy().startOf() method with parsing date time should add and return correct start of date time in months',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.MONTH))
              .dateTime
              .toString(),
          '2019-10-01 00:00:00.000');
    });
    test(
        'test Jiffy().startOf() method with parsing date time should add and return correct start of date time in years',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..startOf(Units.YEAR))
              .dateTime
              .toString(),
          '2019-01-01 00:00:00.000');
    });
  });

  group('Test Jiffy().endOf() datetime', () {
    test(
        'test Jiffy().endOf() method with parsing date time should add and return correct end of date time in seconds',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.SECOND))
              .dateTime
              .toString(),
          '2019-10-13 13:12:12.999');
    });
    test(
        'test Jiffy().endOf() method with parsing date time should add and return correct end of date time in mintes',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.MINUTE))
              .dateTime
              .toString(),
          '2019-10-13 13:12:59.999');
    });
    test(
        'test Jiffy().endOf() method with parsing date time should add and return correct end of date time in hours',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.HOUR))
              .dateTime
              .toString(),
          '2019-10-13 13:59:59.999');
    });
    test(
        'test Jiffy().endOf() method with parsing date time should add and return correct end of date time in days',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.DAY))
              .dateTime
              .toString(),
          '2019-10-13 23:59:59.999');
    });
    test(
        'test Jiffy().endOf() method with parsing date time should add and return correct end of date time in weeks',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.WEEK))
              .dateTime
              .toString(),
          '2019-10-19 23:59:59.999');
      expect(
          (Jiffy('2019-10-10 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.WEEK))
              .dateTime
              .toString(),
          '2019-10-12 23:59:59.999');
    });
    test(
        'test Jiffy().endOf() method with parsing date time should add and return correct end of date time in months',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.MONTH))
              .dateTime
              .toString(),
          '2019-10-31 23:59:59.999');
      expect(
          (Jiffy('2019-02-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.MONTH))
              .dateTime
              .toString(),
          '2019-02-28 23:59:59.999');
      expect(
          (Jiffy('2016-02-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.MONTH))
              .dateTime
              .toString(),
          '2016-02-29 23:59:59.999');
    });
    test(
        'test Jiffy().endOf() method with parsing date time should add and return correct end of date time in years',
        () {
      expect(
          (Jiffy('2019-10-13 13:12:12', 'yyyy-MM-dd hh:mm:ss')
                ..endOf(Units.YEAR))
              .dateTime
              .toString(),
          '2019-12-31 23:59:59.999');
    });
  });
}
