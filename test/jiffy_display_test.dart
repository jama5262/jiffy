import 'package:jiffy/jiffy.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test/test.dart';

void main() {
  group('Test format and default format datetime methods', () {
    test(
        'test Jiffy().format get method with parsing date time should return correct date time string',
        () {
      expect(Jiffy('20191016').format('MMMM dd, yyyy'), 'October 16, 2019');
      expect(Jiffy('2019-10-16 12:00').format('[Today is] dd MMM'),
          'Today is 16 Oct');
      expect(Jiffy('2019-10-16T00:00:00.000').format('MMMMEEEEd'),
          'Wednesday, October 16');
      expect(Jiffy('2019/10/16').format(), '2019-10-16T00:00:00.000');
    });
    test(
        'test Jiffy().format get method with parsing ordianl date time should return correct date time string',
        () {
      expect(Jiffy([2019, 10, 1]).format('MMM do yy'), 'Oct 1st 19');
      expect(Jiffy([2019, 10, 2]).format('MMM do yy'), 'Oct 2nd 19');
      expect(Jiffy([2019, 10, 3]).format('MMM do yy'), 'Oct 3rd 19');
      expect(Jiffy([2019, 10, 10]).format('MMM do yy'), 'Oct 10th 19');
      expect(Jiffy([2019, 10, 21]).format('MMM do yy'), 'Oct 21st 19');
    });
    test(
        'test Jiffy().defaultDatetime get method with parsing date time should return correct date time string',
        () {
      expect(Jiffy([2019, 10, 16]).E, 'Wed');
      expect(Jiffy([2019, 10, 16]).EEEE, 'Wednesday');
      expect(Jiffy([2019, 10, 16]).LLL, 'Oct');
      expect(Jiffy([2019, 10, 16]).LLLL, 'October');
      expect(Jiffy([2019, 10, 16]).Md, '10/16');
      expect(Jiffy([2019, 10, 16]).MEd, 'Wed, 10/16');
      expect(Jiffy([2019, 10, 16]).MMM, 'Oct');
      expect(Jiffy([2019, 10, 16]).MMMd, 'Oct 16');
      expect(Jiffy([2019, 10, 16]).MMMEd, 'Wed, Oct 16');
      expect(Jiffy([2019, 10, 16]).MMMM, 'October');
      expect(Jiffy([2019, 10, 16]).MMMMd, 'October 16');
      expect(Jiffy([2019, 10, 16]).MMMMEEEEd, 'Wednesday, October 16');
      expect(Jiffy([2019, 10, 16]).QQQ, 'Q4');
      expect(Jiffy([2019, 10, 16]).QQQQ, '4th quarter');
      expect(Jiffy([2019, 10, 16]).yM, '10/2019');
      expect(Jiffy([2019, 10, 16]).yMd, '10/16/2019');
      expect(Jiffy([2019, 10, 16]).yMEd, 'Wed, 10/16/2019');
      expect(Jiffy([2019, 10, 16]).yMMM, 'Oct 2019');
      expect(Jiffy([2019, 10, 16]).yMMMd, 'Oct 16, 2019');
      expect(Jiffy([2019, 10, 16]).yMMMdjm, 'Oct 16, 2019 12:00 AM');
      expect(Jiffy([2019, 10, 16]).yMMMEd, 'Wed, Oct 16, 2019');
      expect(Jiffy([2019, 10, 16]).yMMMEdjm, 'Wed, Oct 16, 2019 12:00 AM');
      expect(Jiffy([2019, 10, 16]).yMMMM, 'October 2019');
      expect(Jiffy([2019, 10, 16]).yMMMMd, 'October 16, 2019');
      expect(Jiffy([2019, 10, 16]).yMMMMdjm, 'October 16, 2019 12:00 AM');
      expect(Jiffy([2019, 10, 16]).yMMMMEEEEd, 'Wednesday, October 16, 2019');
      expect(Jiffy([2019, 10, 16]).yMMMMEEEEdjm,
          'Wednesday, October 16, 2019 12:00 AM');
      expect(Jiffy([2019, 10, 16]).yQQQ, 'Q4 2019');
      expect(Jiffy([2019, 10, 16]).yQQQQ, '4th quarter 2019');
      expect(Jiffy('2019, 10, 16 3:30 AM', 'yyyy, MM, dd hh:mm a').Hm, '03:30');
      expect(Jiffy('2019, 10, 16 3:30 am', 'yyyy, MM, dd hh:mm a').Hms,
          '03:30:00');
      expect(Jiffy('2019, 10, 16 3:30 pm', 'yyyy, MM, dd hh:mm a').j, '3 PM');
      expect(
          Jiffy('2019, 10, 16 3:30 am', 'yyyy, MM, dd hh:mm a').jm, '3:30 AM');
      expect(Jiffy('2019, 10, 16 3:30 PM', 'yyyy, MM, dd hh:mm a').jms,
          '3:30:00 PM');
    });
  });

  group('Test format and default format datetime methods with locale parameter', () {
    test(
        'initial intl',
            () async {
          await initializeDateFormatting();
        });
    test(
        'test Jiffy().format get method with parsing date time and locale parameter should return correct date time string',
            () {
          expect(Jiffy('20191016', null, 'zh_CN').format('MMMM dd, yyyy'), '十月 16, 2019');
          expect(Jiffy('2019-10-16 12:00', null, 'zh_CN').format('[Today is] dd MMM'),
              'Today is 16 10月');
          expect(Jiffy('2019-10-16T00:00:00.000', null, 'zh_CN').format('MMMMEEEEd'),
              '10月16日星期三');
          expect(Jiffy('2019/10/16', null, 'zh_CN').format(), '2019-10-16T00:00:00.000');
        });
    test(
        'test Jiffy().format get method with parsing ordianl date time and locale parameter should return correct date time string',
            () {
          expect(Jiffy([2019, 10, 1], null, 'zh_CN').format('MMM do yy'), '10月 1日 19');
          expect(Jiffy([2019, 10, 2], null, 'zh_CN').format('MMM do yy'), '10月 2日 19');
          expect(Jiffy([2019, 10, 3], null, 'zh_CN').format('MMM do yy'), '10月 3日 19');
          expect(Jiffy([2019, 10, 10], null, 'zh_CN').format('MMM do yy'), '10月 10日 19');
          expect(Jiffy([2019, 10, 21], null, 'zh_CN').format('MMM do yy'), '10月 21日 19');
        });
    test(
        'test Jiffy().defaultDatetime get method with parsing date time and locale parameter should return correct date time string',
            () {
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').E, '周三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').EEEE, '星期三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').LLL, '10月');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').LLLL, '十月');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').Md, '10/16');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').MEd, '10/16周三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').MMM, '10月');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').MMMd, '10月16日');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').MMMEd, '10月16日周三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').MMMM, '十月');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').MMMMd, '10月16日');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').MMMMEEEEd, '10月16日星期三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').QQQ, '4季度');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').QQQQ, '第四季度');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yM, '2019年10月');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMd, '2019/10/16');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMEd, '2019/10/16周三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMM, '2019年10月');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMd, '2019年10月16日');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMdjm, '2019年10月16日 上午12:00');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMEd, '2019年10月16日周三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMEdjm, '2019年10月16日周三 上午12:00');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMM, '2019年10月');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMMd, '2019年10月16日');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMMdjm, '2019年10月16日 上午12:00');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMMEEEEd, '2019年10月16日星期三');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yMMMMEEEEdjm,
              '2019年10月16日星期三 上午12:00');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yQQQ, '2019年第4季度');
          expect(Jiffy([2019, 10, 16], null, 'zh_CN').yQQQQ, '2019年第4季度');
          expect(Jiffy('2019, 10, 16 3:30 AM', 'yyyy, MM, dd hh:mm a', 'zh_CN').Hm, '03:30');
          expect(Jiffy('2019, 10, 16 3:30 am', 'yyyy, MM, dd hh:mm a', 'zh_CN').Hms,
              '03:30:00');
          expect(Jiffy('2019, 10, 16 3:30 pm', 'yyyy, MM, dd hh:mm a', 'zh_CN').j, '下午3时');
          expect(
              Jiffy('2019, 10, 16 3:30 am', 'yyyy, MM, dd hh:mm a', 'zh_CN').jm, '上午3:30');
          expect(Jiffy('2019, 10, 16 3:30 PM', 'yyyy, MM, dd hh:mm a', 'zh_CN').jms,
              '下午3:30:00');
        });
  });

  group('Test Jiffy.fromNow() and Jiffy.from() datetime methods', () {
    test(
        'test Jiffy().fromNow() method with parsing date time should return correct relative date time string',
        () {
      expect(Jiffy().fromNow(), 'a few seconds ago');
      var jiffy1 = Jiffy()..add(duration: Duration(seconds: 20));
      expect(jiffy1.fromNow(), 'in a few seconds');
      var jiffy2 = Jiffy()..subtract(months: 20);
      expect(jiffy2.fromNow(), 'a year ago');
    });
    test(
        'test Jiffy().from() method with parsing date time should return correct relative date time string',
        () {
      var jiffy1 = Jiffy([2019, 10, 16]);
      expect(Jiffy('2019, 10, 20', 'yyyy, MM, dd').from(jiffy1), 'in 4 days');
      var jiffy2 = Jiffy([2019, 10, 16])..add(duration: Duration(days: 10));
      expect(Jiffy('2019, 10, 20', 'yyyy, MM, dd').from(jiffy2), '6 days ago');
      var jiffy3 = Jiffy([2019, 10, 16])..subtract(months: 20);
      expect(Jiffy('2019, 10, 20', 'yyyy, MM, dd').from(jiffy3), 'in a year');
    });
  });

  group('Test Jiffy().diff() datetime', () {
    test(
        'test Jiffy().diff() method with parsing date time should return correct date time in seconds',
        () {
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(duration: Duration(seconds: 1)),
              Units.SECOND),
          -1);
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..subtract(duration: Duration(seconds: 25, milliseconds: 200)),
              Units.SECOND,
              true),
          25.2);
    });
    test(
        'test Jiffy().diff() method with parsing date time should return correct date time in minutes',
        () {
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(duration: Duration(seconds: 1)),
              Units.MINUTE),
          0);
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..subtract(duration: Duration(seconds: 178)),
              Units.MINUTE,
              true),
          2.966666666666667);
    });
    test(
        'test Jiffy().diff() method with parsing date time should return correct date time in hours',
        () {
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(duration: Duration(seconds: 1)),
              Units.HOUR),
          0);
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(duration: Duration(hours: 12, minutes: 30)),
              Units.HOUR,
              true),
          -12.5);
    });
    test(
        'test Jiffy().diff() method with parsing date time should return correct date time in days',
        () {
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(duration: Duration(seconds: 1)),
              Units.DAY),
          0);
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..subtract(hours: 2),
              Units.DAY,
              true),
          0.08333333333333333);
    });
    test(
        'test Jiffy().diff() method with parsing date time should return correct date time in weeks',
        () {
      expect(
          Jiffy(DateTime(2019, 10, 16, 23)).diff(
              Jiffy(DateTime(2019, 10, 16, 23))
                ..add(duration: Duration(seconds: 1)),
              Units.WEEK),
          0);
      expect(
          Jiffy(DateTime(2019, 10, 16, 23)).diff(
              Jiffy(DateTime(2019, 10, 16, 23))..add(days: 2, hours: 23),
              Units.WEEK,
              true),
          -0.4226190476190476);
    });
    test(
        'test Jiffy().diff() method with parsing date time should return correct date time in months',
        () {
      expect(
          Jiffy([2019, 10, 20, 22]).diff(
              Jiffy([2019, 10, 16, 22])..add(duration: Duration(seconds: 1)),
              Units.MONTH),
          0);
      expect(
          Jiffy([2019, 10, 16, 22]).diff(
              Jiffy([2019, 10, 16, 22])..add(weeks: 2), Units.MONTH, true),
          -0.45161290322580644);
      expect(
          Jiffy([2019, 10, 16, 22]).diff(
              Jiffy([2019, 10, 16, 22])..add(months: 2), Units.MONTH, true),
          -2.0);
    });
    test(
        'test Jiffy().diff() method with parsing date time should return correct date time in years',
        () {
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(duration: Duration(seconds: 1)),
              Units.YEAR),
          0);
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(weeks: 2),
              Units.YEAR,
              true),
          -0.03763440860215054);
      expect(
          Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a').diff(
              Jiffy('2019, 10, 16 10:00:00 pm', 'yyyy, MM, dd h:mm:ss a')
                ..add(years: 2),
              Units.YEAR,
              true),
          -2.0);
    });
  });
}
