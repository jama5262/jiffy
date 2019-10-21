import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test Jiffy query', () {
    test("Test isBefore method", () {
      var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
      var jiffy2 = Jiffy('2010-12-31', "yyyy-MM-dd");
      var jiffy3 = Jiffy('2011-01-01', "yyyy-MM-dd");
      expect(jiffy1.isBefore(Jiffy('2010-10-21', "yyyy-MM-dd")), true);
      expect(jiffy1.isBefore(jiffy2, "y"), false);
      expect(jiffy1.isBefore(jiffy3, "y"), true);
    });
    test("Test isAfter method", () {
      var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
      var jiffy2 = Jiffy('2010-01-01', "yyyy-MM-dd");
      expect(jiffy1.isAfter(Jiffy('2010-10-19', "yyyy-MM-dd")), true);
      expect(jiffy1.isAfter(jiffy2, "y"), false);
      expect(jiffy1.isAfter([2009, 12, 31], "y"), true);
    });
    test("Test isSame method", () {
      var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
      var jiffy2 = Jiffy('2009-12-31', "yyyy-MM-dd");
      var jiffy3 = Jiffy('2010-01-01', "yyyy-MM-dd");
      expect(jiffy1.isSame(Jiffy('2010-10-20', "yyyy-MM-dd")), true);
      expect(jiffy1.isSame(jiffy2, "y"), false);
      expect(jiffy1.isSame(jiffy3, "y"), true);
    });
    test("Test isSameOrBefore method", () {
      var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
      var jiffy2 = Jiffy('2009-12-31', "yyyy-MM-dd");
      var jiffy3 = Jiffy('2010-12-31', "yyyy-MM-dd");
      expect(jiffy1.isSameOrBefore(Jiffy('2010-10-21', "yyyy-MM-dd")), true);
      expect(jiffy1.isSameOrBefore(Jiffy('2010-10-19', "yyyy-MM-dd")), false);
      expect(jiffy1.isSameOrBefore(jiffy2, "y"), false);
      expect(jiffy1.isSameOrBefore(jiffy3, "y"), true);
    });
    test("Test isSameOrAfter method", () {
      var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
      var jiffy2 = Jiffy('2011-12-31', "yyyy-MM-dd");
      var jiffy3 = Jiffy('2010-01-01', "yyyy-MM-dd");
      expect(jiffy1.isSameOrAfter(Jiffy('2010-10-19', "yyyy-MM-dd")), true);
      expect(jiffy1.isSameOrAfter(Jiffy('2010-10-21', "yyyy-MM-dd")), false);
      expect(jiffy1.isSameOrAfter(jiffy2, "y"), false);
      expect(jiffy1.isSameOrAfter(jiffy3, "y"), true);
    });
    test("Test isBetween method", () {
      var jiffy1 = Jiffy('2010-10-20');
      var jiffy2 = Jiffy('2010-10-19');
      expect(jiffy1.isBetween(jiffy2, DateTime(2010, 10, 25)), true);
      expect(jiffy1.isBetween([2010, 1, 1], "2012-01-01", "y"), false);
    });
    test("Test isLeapYear method", () {
      expect(Jiffy('2010', "yyyy").isLeapYear, false);
      expect(Jiffy('2016', "yyyy").isLeapYear, true);
    });
    test("Test isJiffy method", () {
      expect(Jiffy.isJiffy(DateTime.now()), false);
      expect(Jiffy.isJiffy(Jiffy()), true);
    });
    test("Test isDateTime method", () {
      expect(Jiffy.isDateTime(Jiffy()), false);
      expect(Jiffy.isDateTime(DateTime.now()), true);
    });
  });
}
