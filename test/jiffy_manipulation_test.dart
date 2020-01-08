import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test Jiffy adding datetime', () {
    test("Adding milliseconds", () {
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(duration: Duration(milliseconds: 1))
              .toString(),
          "2019-10-13 00:00:00.001");
    });
    test("Adding seconds", () {
      expect(Jiffy().add(duration: Duration(seconds: 1)).second,
          DateTime.now().add(Duration(seconds: 1)).second);
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(duration: Duration(seconds: 1))
              .toString(),
          "2019-10-13 00:00:01.000");
    });
    test("Adding minutes", () {
      expect(Jiffy().add(duration: Duration(minutes: 1)).minute,
          DateTime.now().add(Duration(minutes: 1)).minute);
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(duration: Duration(minutes: 1))
              .toString(),
          "2019-10-13 00:01:00.000");
    });
    test("Adding hours", () {
      expect(Jiffy().add(duration: Duration(hours: 1)).hour,
          DateTime.now().add(Duration(hours: 1)).hour);
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(duration: Duration(hours: 1))
              .toString(),
          "2019-10-13 01:00:00.000");
    });
    test("Adding days", () {
      expect(Jiffy().add(duration: Duration(days: 1)).day,
          DateTime.now().add(Duration(days: 1)).day);
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(duration: Duration(days: 1))
              .toString(),
          "2019-10-14 00:00:00.000");
    });
    test("Adding weeks", () {
      expect(Jiffy().add(weeks: 1).day,
          DateTime.now().add(Duration(days: 1 * 7)).day);
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(weeks: 1)
              .toString(),
          "2019-10-20 00:00:00.000");
    });
    test("Adding months", () {
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(months: 1)
              .toString(),
          "2019-11-13 00:00:00.000");
    });
    test("Adding years", () {
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .add(years: 1)
              .toString(),
          "2020-10-13 00:00:00.000");
    });
  });

  group('Test Jiffy subtracting datetime', () {
    test("Subtracting milliseconds", () {
      expect(
          Jiffy("2019-10-13 23:00:00")
              .subtract(duration: Duration(milliseconds: 1))
              .toString(),
          "2019-10-13 22:59:59.999");
    });
    test("Subtracting seconds", () {
      expect(Jiffy().subtract(duration: Duration(seconds: 1)).second,
          DateTime.now().subtract(Duration(seconds: 1)).second);
      expect(
          Jiffy("2019-10-13 12:00:01", "yyyy-MM-dd hh:mm:ss")
              .subtract(duration: Duration(seconds: 1))
              .toString(),
          "2019-10-13 00:00:00.000");
    });
    test("Subtracting minutes", () {
      expect(Jiffy().subtract(duration: Duration(minutes: 1)).minute,
          DateTime.now().subtract(Duration(minutes: 1)).minute);
      expect(
          Jiffy("2019-10-13 12:01:00", "yyyy-MM-dd hh:mm:ss")
              .subtract(duration: Duration(minutes: 1))
              .toString(),
          "2019-10-13 00:00:00.000");
    });
    test("Subtracting hours", () {
      expect(Jiffy().subtract(duration: Duration(hours: 1)).hour,
          DateTime.now().subtract(Duration(hours: 1)).hour);
      expect(
          Jiffy("2019-10-13 13:00:00", "yyyy-MM-dd hh:mm:ss")
              .subtract(duration: Duration(hours: 1))
              .toString(),
          "2019-10-13 12:00:00.000");
    });
    test("Subtracting days", () {
      expect(Jiffy().subtract(duration: Duration(days: 1)).day,
          DateTime.now().subtract(Duration(days: 1)).day);
      expect(
          Jiffy("2019-10-14 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .subtract(duration: Duration(days: 1))
              .toString(),
          "2019-10-13 00:00:00.000");
    });
    test("Subtracting weeks", () {
      expect(Jiffy().subtract(weeks: 1).day,
          DateTime.now().subtract(Duration(days: 1 * 7)).day);
      expect(
          Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .subtract(weeks: 1)
              .toString(),
          "2019-10-06 00:00:00.000");
    });
    test("Subtracting months", () {
      expect(
          Jiffy("2019-11-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .subtract(months: 1)
              .toString(),
          "2019-10-13 00:00:00.000");
    });
    test("Subtracting years", () {
      expect(
          Jiffy("2020-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
              .subtract(years: 1)
              .toString(),
          "2019-10-13 00:00:00.000");
    });
  });

  group('Test Jiffy startOf datetime', () {
    test("Start Of seconds", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("s")
              .toString(),
          "2019-10-13 13:12:12.000");
    });
    test("Start Of minutes", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("m")
              .toString(),
          "2019-10-13 13:12:00.000");
    });
    test("Start Of hours", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("h")
              .toString(),
          "2019-10-13 13:00:00.000");
    });
    test("Start Of days", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("d")
              .toString(),
          "2019-10-13 00:00:00.000");
    });
    test("Start Of weeks", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("w")
              .toString(),
          "2019-10-13 00:00:00.000");
      expect(
          Jiffy("2019-10-10 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("w")
              .toString(),
          "2019-10-06 00:00:00.000");
    });
    test("Start Of months", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("M")
              .toString(),
          "2019-10-01 00:00:00.000");
    });
    test("Start Of years", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .startOf("y")
              .toString(),
          "2019-01-01 00:00:00.000");
    });
    test("Passing invalid unit", () {
      try {
        Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
            .startOf("invalidUnit");
      } catch (e) {
        expect(e.toString(),
            "JiffyException: Invalid unit passed, the following units are available 'year', 'month', 'week', 'day', 'hour', 'minute', 'second', 'millisecond'");
      }
    });
  });

  group('Test Jiffy endOf datetime', () {
    test("End Of seconds", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("s")
              .toString(),
          "2019-10-13 13:12:12.999");
    });
    test("End Of minutes", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("m")
              .toString(),
          "2019-10-13 13:12:59.999");
    });
    test("End Of hours", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("h")
              .toString(),
          "2019-10-13 13:59:59.999");
    });
    test("End Of days", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("d")
              .toString(),
          "2019-10-13 23:59:59.999");
    });
    test("End Of weeks", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("w")
              .toString(),
          "2019-10-19 23:59:59.999");
      expect(
          Jiffy("2019-10-10 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("w")
              .toString(),
          "2019-10-12 23:59:59.999");
    });
    test("End Of months", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("M")
              .toString(),
          "2019-10-31 23:59:59.999");
      expect(
          Jiffy("2019-02-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("M")
              .toString(),
          "2019-02-28 23:59:59.999");
      expect(
          Jiffy("2016-02-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("M")
              .toString(),
          "2016-02-29 23:59:59.999");
    });
    test("End Of years", () {
      expect(
          Jiffy("2019-10-13 13:12:12", "yyyy-MM-dd hh:mm:ss")
              .endOf("y")
              .toString(),
          "2019-12-31 23:59:59.999");
    });
    test("Passing invalid unit", () {
      try {
        Jiffy("2019-10-13 12:00:00", "yyyy-MM-dd hh:mm:ss")
            .endOf("invalidUnit");
      } catch (e) {
        expect(e.toString(),
            "JiffyException: Invalid unit passed, the following units are available 'year', 'month', 'week', 'day', 'hour', 'minute', 'second', 'millisecond'");
      }
    });
  });
}
