import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test get Jiffy datetime instance', () {
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
    test("Pass with DateTime instance", () {
      expect(Jiffy(DateTime(2019)).year, 2019);
    });
    test("Pass with Jiffy instance", () {
      expect(Jiffy(Jiffy("2009", "yyyy")).year, 2009);
    });
    test("Pass with Map", () {
      expect(Jiffy({"y": 2009}).year, 2009);
    });
    test("Pass with empty Map", () {
      expect(Jiffy({}).year, DateTime.now().year);
    });
    test("Pass with Array", () {
      expect(Jiffy([2009, 1]).year, 2009);
    });
    test("Pass with empty Array", () {
      expect(Jiffy([]).year, DateTime.now().year);
    });
    test("Get Datetime instance", () {
      expect(Jiffy("Oct, 2009", "MMM, yyyy").dateTime.toString(),
          "2009-10-01 00:00:00.000");
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
            "JiffyException: Date time not recognized, a pattern must be passed, e.g. Jiffy(\'12, Oct\', \'dd, MMM\')");
      }
    });
  });

  group('Test get Jiffy.unix datetime instance', () {
    test("Pass timestamp seconds", () {
      expect(Jiffy.unix(1570963450).year,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).year);
      expect(Jiffy.unix(1570963450).month,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).month);
    });
    test("Pass time milliseconds", () {
      expect(Jiffy.unix(1570963450000).year,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).year);
      expect(Jiffy.unix(1570963450000).month,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).month);
    });
    test("Pass timestamp not in seconds or milliseconds", () {
      try {
        Jiffy.unix(157096345);
      } catch (e) {
        expect(e.toString(),
            "JiffyException: The timestamp passed must be in seconds or millisecods e.g. 1570963450 or 1570963450123");
      }
    });
  });
}
