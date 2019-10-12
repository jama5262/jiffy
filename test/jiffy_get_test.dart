import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test get datetime methods', () {
    test("Get seconds", () {
      expect(Jiffy().seconds, DateTime.now().second);
    });
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
    test("Get month", () {
      expect(Jiffy().month, DateTime.now().month);
    });
    test("Get year", () {
      expect(Jiffy().year, DateTime.now().year);
    });
  });
}
