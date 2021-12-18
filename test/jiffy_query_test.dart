import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test Jiffy query date time', () {
    test(
        'test Jiffy().isBefore() method with parsing date time should return true or false if date time is before',
        () {
      var jiffy1 = Jiffy('2010-10-20', 'yyyy-MM-dd');
      var jiffy2 = Jiffy('2010-12-31', 'yyyy-MM-dd');
      var jiffy3 = Jiffy('2011-01-01', 'yyyy-MM-dd');
      expect(jiffy1.isBefore(Jiffy('2010-10-21', 'yyyy-MM-dd')), true);
      expect(jiffy1.isBefore(jiffy2, Units.YEAR), false);
      expect(jiffy1.isBefore(jiffy3, Units.YEAR), true);
    });
    test(
        'test Jiffy().isAfter() method with parsing date time should return true or false if date time is after',
        () {
      var jiffy1 = Jiffy('2010-10-20', 'yyyy-MM-dd');
      var jiffy2 = Jiffy('2010-01-01', 'yyyy-MM-dd');
      expect(jiffy1.isAfter(Jiffy('2010-10-19', 'yyyy-MM-dd')), true);
      expect(jiffy1.isAfter(jiffy2, Units.YEAR), false);
      expect(jiffy1.isAfter([2009, 12, 31], Units.YEAR), true);
    });
    test(
        'test Jiffy().isSame() method with parsing date time should return true or false if date time is same',
        () {
      var jiffy1 = Jiffy('2010-10-20', 'yyyy-MM-dd');
      var jiffy2 = Jiffy('2009-12-31', 'yyyy-MM-dd');
      var jiffy3 = Jiffy('2010-01-01', 'yyyy-MM-dd');
      expect(jiffy1.isSame(Jiffy('2010-10-20', 'yyyy-MM-dd')), true);
      expect(jiffy1.isSame(jiffy2, Units.YEAR), false);
      expect(jiffy1.isSame(jiffy3, Units.YEAR), true);
    });
    test(
        'test Jiffy().isSameOrBefore() method with parsing date time should return true or false if date time is same or before',
        () {
      var jiffy1 = Jiffy('2010-10-20', 'yyyy-MM-dd');
      var jiffy2 = Jiffy('2009-12-31', 'yyyy-MM-dd');
      var jiffy3 = Jiffy('2010-12-31', 'yyyy-MM-dd');
      expect(jiffy1.isSameOrBefore(Jiffy('2010-10-21', 'yyyy-MM-dd')), true);
      expect(jiffy1.isSameOrBefore(Jiffy('2010-10-19', 'yyyy-MM-dd')), false);
      expect(jiffy1.isSameOrBefore(jiffy2, Units.YEAR), false);
      expect(jiffy1.isSameOrBefore(jiffy3, Units.YEAR), true);
    });
    test(
        'test Jiffy().isSameOrAfter() method with parsing date time should return true or false if date time is same or after',
        () {
      var jiffy1 = Jiffy('2010-10-20', 'yyyy-MM-dd');
      var jiffy2 = Jiffy('2011-12-31', 'yyyy-MM-dd');
      var jiffy3 = Jiffy('2010-01-01', 'yyyy-MM-dd');
      expect(jiffy1.isSameOrAfter(Jiffy('2010-10-19', 'yyyy-MM-dd')), true);
      expect(jiffy1.isSameOrAfter(Jiffy('2010-10-21', 'yyyy-MM-dd')), false);
      expect(jiffy1.isSameOrAfter(jiffy2, Units.YEAR), false);
      expect(jiffy1.isSameOrAfter(jiffy3, Units.YEAR), true);
    });
    test(
        'test Jiffy().isBetween() method with parsing date time should return true or false if date time is between two date times',
        () {
      var jiffy1 = Jiffy('2010-10-20');
      var jiffy2 = Jiffy('2010-10-19');
      expect(jiffy1.isBetween(jiffy2, DateTime(2010, 10, 25)), true);
      expect(jiffy1.isBetween([2010, 1, 1], '2012-01-01', Units.YEAR), false);
    });
    test(
        'test Jiffy().isLeapYear() method with parsing date time should return true or false if date time is leap year',
        () {
      expect(Jiffy('2010', 'yyyy').isLeapYear, false);
      expect(Jiffy('2016', 'yyyy').isLeapYear, true);
    });
    test(
        'test Jiffy().isJiffy() method with parsing date time should return true or false if date time is Jiffy object',
        () {
      expect(Jiffy.isJiffy(DateTime.now()), false);
      expect(Jiffy.isJiffy(Jiffy()), true);
    });
    test(
        'test Jiffy().isDateTime() method with parsing date time should return true or false if date time is DateTime object',
        () {
      expect(Jiffy.isDateTime(Jiffy()), false);
      expect(Jiffy.isDateTime(DateTime.now()), true);
    });
  });
}
