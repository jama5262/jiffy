import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test get datetime instance', () {
    test("Pass without time and pattern", () {
      expect(Jiffy().year, DateTime.now().year);
      expect(Jiffy().month, DateTime.now().month);
    });
    test("Pass time and pattern", () {
      expect(Jiffy("2009", "yyyy").year, 2009);
      expect(Jiffy("Oct, 2009", "MMM, yyyy").year, 2009);
    });
    test("Pass time and with empty string pattern", () {
      expect(Jiffy("2009", "").year, 1970);
    });
    test("Pass with empty time and pattern string", () {
      expect(Jiffy("", "").year, 1970);
    });
    test("Pass pattern and with empty string time", () {
      try {
        Jiffy("", "yyyy");
      } catch (e) {
        expect(e.toString(),
            "FormatException: Trying to read yyyy from  at position 0");
      }
    });
    test("Pass time with wrong pattern", () {
      try {
        Jiffy("Oct", "yyyy");
      } catch (e) {
        expect(e.toString(),
            "FormatException: Trying to read yyyy from Oct at position 0");
      }
    });
    test("Pass time, with no pattern parameter", () {
      try {
        Jiffy("");
      } catch (e) {
        expect(e.toString(),
            "JiffyException: When passing time, a pattern must also be passed, e.g. Jiffy('12, Oct', 'dd, MMM')");
      }
    });
  });
}
