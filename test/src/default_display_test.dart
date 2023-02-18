import 'package:jiffy/src/default_display.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  final underTest = DefaultDisplay();

  group('Test displaying default datetime', () {
    for (var testData in defaultDisplayTestData(underTest)) {
      test('Should successfully display default datetime', () {
        // Setup
        final dateTime = (testData['dateTime'] as DateTime);

        // Execute
        final actualDateTimeDisplay =
            (testData['function'] as Function(DateTime)).call(dateTime);

        // Verify
        expect(actualDateTimeDisplay, testData['expectedDateTimeDisplay']);
      });
    }
  });
}

List<Map<String, dynamic>> defaultDisplayTestData(
    DefaultDisplay defaultDisplay) {
  return [
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.E(dateTime),
      'expectedDateTimeDisplay': 'Tue'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.EEEE(dateTime),
      'expectedDateTimeDisplay': 'Tuesday'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.Md(dateTime),
      'expectedDateTimeDisplay': '9/23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.MEd(dateTime),
      'expectedDateTimeDisplay': 'Tue, 9/23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.MMM(dateTime),
      'expectedDateTimeDisplay': 'Sep'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.MMMd(dateTime),
      'expectedDateTimeDisplay': 'Sep 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.MMMEd(dateTime),
      'expectedDateTimeDisplay': 'Tue, Sep 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.MMMM(dateTime),
      'expectedDateTimeDisplay': 'September'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.MMMMd(dateTime),
      'expectedDateTimeDisplay': 'September 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.MMMMEEEEd(dateTime),
      'expectedDateTimeDisplay': 'Tuesday, September 23'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.QQQ(dateTime),
      'expectedDateTimeDisplay': 'Q3'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.QQQQ(dateTime),
      'expectedDateTimeDisplay': '3rd quarter'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yM(dateTime),
      'expectedDateTimeDisplay': '9/1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMd(dateTime),
      'expectedDateTimeDisplay': '9/23/1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMEd(dateTime),
      'expectedDateTimeDisplay': 'Tue, 9/23/1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMM(dateTime),
      'expectedDateTimeDisplay': 'Sep 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMd(dateTime),
      'expectedDateTimeDisplay': 'Sep 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMdjm(dateTime),
      'expectedDateTimeDisplay': 'Sep 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMEd(dateTime),
      'expectedDateTimeDisplay': 'Tue, Sep 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMEdjm(dateTime),
      'expectedDateTimeDisplay': 'Tue, Sep 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMM(dateTime),
      'expectedDateTimeDisplay': 'September 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMMd(dateTime),
      'expectedDateTimeDisplay': 'September 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMMdjm(dateTime),
      'expectedDateTimeDisplay': 'September 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMMEEEEd(dateTime),
      'expectedDateTimeDisplay': 'Tuesday, September 23, 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yMMMMEEEEdjm(dateTime),
      'expectedDateTimeDisplay': 'Tuesday, September 23, 1997 12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yQQQ(dateTime),
      'expectedDateTimeDisplay': 'Q3 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.yQQQQ(dateTime),
      'expectedDateTimeDisplay': '3rd quarter 1997'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.H(dateTime),
      'expectedDateTimeDisplay': '12'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.Hm(dateTime),
      'expectedDateTimeDisplay': '12:11'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.Hms(dateTime),
      'expectedDateTimeDisplay': '12:11:22'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.j(dateTime),
      'expectedDateTimeDisplay': '12 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.jm(dateTime),
      'expectedDateTimeDisplay': '12:11 PM'
    },
    {
      'dateTime': DateTime(1997, 9, 23, 12, 11, 22, 123, 456),
      'function': (DateTime dateTime) => defaultDisplay.jms(dateTime),
      'expectedDateTimeDisplay': '12:11:22 PM'
    },
  ];
}
