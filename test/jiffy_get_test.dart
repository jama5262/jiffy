import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test get datetime methods', () {
    test("Get seconds", () {
      expect(Jiffy().seconds, DateTime.now().second);
    });
    test("Get minutes", () {
      expect(Jiffy().minute, DateTime.now().minute);
    });
    test("Get hours", () {
      expect(Jiffy().hour, DateTime.now().hour);
    });
    test("Get date", () {
      expect(Jiffy().date, DateTime.now().day);
    });
    test("Get day", () {
      expect(Jiffy().day, DateTime.now().weekday);
    });
    test("Get days in month", () {
      expect(Jiffy([2016, 1]).daysInMonth, 31);
      expect(Jiffy([2016, 2]).daysInMonth, 29);
      expect(Jiffy([2017, 2]).daysInMonth, 28);
    });
    test("Get day of year", () {
      expect(Jiffy("2019, 10, 16", "yyyy, MM, dd").dayOfYear, 289);
    });
    test("Get week", () {
      expect(Jiffy("2019, 10, 16", "yyyy, MM, dd").week, 42);
    });
    test("Get week", () {
      expect(Jiffy("2019, 10, 16", "yyyy, MM, dd").quarter, 4);
    });
    test("Get month", () {
      expect(Jiffy().month, DateTime.now().month);
    });
    test("Get year", () {
      expect(Jiffy().year, DateTime.now().year);
    });
  });
}
