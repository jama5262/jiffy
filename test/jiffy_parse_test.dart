import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test Jiffy datetime instance', () {
    test(
        "test Jiffy() instance without parsing time and pattern should set correct datetime",
        () {
      expect(Jiffy().year, DateTime.now().year);
      expect(Jiffy().month, DateTime.now().month);
    });
    test(
        "test Jiffy() instance with parsing time and pattern should set correct date time",
        () {
      expect(Jiffy("2009", "yyyy").year, 2009);
      expect(Jiffy("Oct, 2009", "MMM, yyyy").year, 2009);
    });
    test(
        "test Jiffy() instance with parsing ordinal pattern should return correct ordinal date",
        () {
      expect(
          Jiffy("Oct 1st 19", "MMM do yy").format("MMM do yy"), "Oct 1st 19");
      expect(
          Jiffy("Oct 2st 19", "MMM do yy").format("MMM do yy"), "Oct 2nd 19");
      expect(
          Jiffy("Oct 3st 19", "MMM do yy").format("MMM do yy"), "Oct 3rd 19");
      expect(
          Jiffy("Oct 10st 19", "MMM do yy").format("MMM do yy"), "Oct 10th 19");
      expect(
          Jiffy("Oct 21st 19", "MMM do yy").format("MMM do yy"), "Oct 21st 19");
    });
    test(
        "test Jiffy() instance with parsing empty string pattern should set correct date time",
        () {
      expect(Jiffy("2009", "").year, 1970);
    });
    test(
        "test Jiffy() instance with parsing empty string time and pattern should set correct date time",
        () {
      expect(Jiffy("", "").year, 1970);
    });
    test(
        "test Jiffy() instance with parsing Datetime object should set correct date time",
        () {
      expect(Jiffy(DateTime(2019)).year, 2019);
    });
    test(
        "test Jiffy() instance with parsing Jiffy object should set correct date time",
        () {
      expect(Jiffy(Jiffy("2009", "yyyy")).year, 2009);
    });
    test(
        "test Jiffy() instance with parsing Map object should set correct date time",
        () {
      expect(Jiffy({"y": 2009}).year, 2009);
      expect(Jiffy({"M": 2}).year, DateTime.now().year);
    });
    test(
        "test Jiffy() instance with parsing empty Map object should set correct date time",
        () {
      expect(Jiffy({}).year, DateTime.now().year);
    });
    test(
        "test Jiffy() instance with parsing Array object should set correct date time",
        () {
      expect(Jiffy([2009, 1]).year, 2009);
    });
    test(
        "test Jiffy() instance with parsing empty Array should set correct date time",
        () {
      expect(Jiffy([]).year, DateTime.now().year);
    });
    test(
        "test Jiffy().dateTime get method with parsing time and pattern should return date time string",
        () {
      expect(Jiffy("Oct, 2009", "MMM, yyyy").dateTime.toString(),
          "2009-10-01 00:00:00.000");
    });
    test(
        "test Jiffy() instance with parsing pattern and empty time should return exception",
        () {
      try {
        Jiffy("", "yyyy");
      } catch (e) {
        expect(e.toString(),
            "FormatException: Trying to read yyyy from  at position 0");
      }
    });
    test(
        "test Jiffy() instance with parsing wrong time and pattern should return exception",
        () {
      try {
        Jiffy("Oct", "yyyy");
      } catch (e) {
        expect(e.toString(),
            "FormatException: Trying to read yyyy from Oct at position 0");
      }
    });
    test(
        "test Jiffy() instance with parsing time and without pattern should return exception",
        () {
      try {
        Jiffy("");
      } catch (e) {
        expect(e.toString(),
            "JiffyException: Date time not recognized, a pattern must be passed, e.g. Jiffy(\'12, Oct\', \'dd, MMM\')");
      }
    });
  });

  group('Test Jiffy.unix datetime instance', () {
    test(
        "test Jiffy.unix() instance with parsing timestamp in seconds should set date time",
        () {
      expect(Jiffy.unix(1570963450).year,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).year);
      expect(Jiffy.unix(1570963450).month,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).month);
    });
    test(
        "test Jiffy.unix() instance with parsing timestamp in milliseconds should set date time",
        () {
      expect(Jiffy.unix(1570963450000).year,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).year);
      expect(Jiffy.unix(1570963450000).month,
          DateTime.fromMillisecondsSinceEpoch(1570963450000).month);
    });
    test(
        "test Jiffy.unix() instance with parsing timestamp not in seconds or milliseconds should return exception",
        () {
      try {
        Jiffy.unix(157096345);
      } catch (e) {
        expect(e.toString(),
            "JiffyException: The timestamp passed must be in seconds or millisecods e.g. 1570963450 or 1570963450123");
      }
    });
  });
}
