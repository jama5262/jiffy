import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Test Jiffy get datetime methods', () {
    test(
        'test Jiffy().seconds get method with parsing date time should return correct date time seconds',
        () {
      expect(Jiffy().second, DateTime.now().second);
    });
    test(
        'test Jiffy().minute get method with parsing date time should return correct date time minute',
        () {
      expect(Jiffy().minute, DateTime.now().minute);
    });
    test(
        'test Jiffy().hour get method with parsing date time should return correct date time hour',
        () {
      expect(Jiffy().hour, DateTime.now().hour);
    });
    test(
        'test Jiffy().date get method with parsing date time should return correct date time date',
        () {
      expect(Jiffy().date, DateTime.now().day);
    });
    test(
        'test Jiffy().day get method with parsing date time should return correct date time day in French locale time',
        () async {
      await Jiffy.locale('fr');
      expect(Jiffy([2019, 11, 24]).day, 7);
    });
    test(
        'test Jiffy().day get method with parsing date time should return correct date time day in English locale time',
        () async {
      await Jiffy.locale('en');
      expect(Jiffy([2019, 11, 24]).day, 1);
    });
    test(
        'test Jiffy().daysInMonth get method with parsing date time should return correct date time day of month',
        () {
      expect(Jiffy([2016, 1]).daysInMonth, 31);
      expect(Jiffy([2016, 2]).daysInMonth, 29);
      expect(Jiffy([2017, 2]).daysInMonth, 28);
    });
    test(
        'test Jiffy().dayOfYear get method with parsing date time should return correct date time day of year',
        () {
      expect(Jiffy('2019, 10, 16', 'yyyy, MM, dd').dayOfYear, 289);
    });
    test(
        'test Jiffy().week get method with parsing date time should return correct date time week',
        () {
      expect(Jiffy('2019, 10, 16', 'yyyy, MM, dd').week, 42);
    });
    test(
        'test Jiffy().quarter get method with parsing date time should return correct date time quarter',
        () {
      expect(Jiffy('2019, 10, 16', 'yyyy, MM, dd').quarter, 4);
    });
    test(
        'test Jiffy().month get method with parsing date time should return correct date time month',
        () {
      expect(Jiffy().month, DateTime.now().month);
    });
    test(
        'test Jiffy().year get method with parsing date time should return correct date time year',
        () {
      expect(Jiffy().year, DateTime.now().year);
    });
  });
}
