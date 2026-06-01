import 'package:jiffy/jiffy.dart';
import 'package:test/scaffolding.dart';

class _Result {
  _Result(this.name, this.iterations, this.elapsedMicros);

  final String name;
  final int iterations;
  final int elapsedMicros;

  double get nsPerOp => (elapsedMicros * 1000.0) / iterations;
  double get opsPerSec => iterations / (elapsedMicros / 1e6);
}

_Result _bench(String name, int iterations, void Function() body) {
  // Warm-up.
  for (var i = 0; i < iterations ~/ 10 + 1; i++) {
    body();
  }
  final sw = Stopwatch()..start();
  for (var i = 0; i < iterations; i++) {
    body();
  }
  sw.stop();
  return _Result(name, iterations, sw.elapsedMicroseconds);
}

String _fmtInt(num v) {
  final s = v.toStringAsFixed(0);
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write(',');
    buf.write(s[i]);
  }
  return buf.toString();
}

String _padR(String s, int n) => s.length >= n ? s : s + ' ' * (n - s.length);
String _padL(String s, int n) => s.length >= n ? s : ' ' * (n - s.length) + s;

void _printReport(String title, List<_Result> results) {
  print('');
  print('=' * 78);
  print(title);
  print('=' * 78);
  print('${_padR('Operation', 38)}'
      '${_padL('iters', 10)}  '
      '${_padL('ns/op', 12)}  '
      '${_padL('ops/sec', 14)}');
  print('-' * 78);
  for (final r in results) {
    print('${_padR(r.name, 38)}'
        '${_padL(_fmtInt(r.iterations), 10)}  '
        '${_padL(_fmtInt(r.nsPerOp), 12)}  '
        '${_padL(_fmtInt(r.opsPerSec), 14)}');
  }
  print('=' * 78);
}

void main() {
  test('Jiffy benchmark report', () async {
    await Jiffy.setLocale('en_us');

    // Shared inputs to remove allocation noise from inside hot loops.
    final dt = DateTime(1997, 9, 23, 11, 18, 12, 946, 621);
    final dtLater = DateTime(2024, 2, 15, 7, 30, 0);
    final j = Jiffy.parseFromDateTime(dt);
    final jLater = Jiffy.parseFromDateTime(dtLater);

    final construction = <_Result>[
      _bench('DateTime.now() (baseline)', 200000, () {
        DateTime.now();
      }),
      _bench('Jiffy.now()', 50000, () {
        Jiffy.now();
      }),
      _bench('Jiffy.parseFromDateTime', 50000, () {
        Jiffy.parseFromDateTime(dt);
      }),
      _bench('Jiffy.parse(ISO)', 20000, () {
        Jiffy.parse('1997-09-23T11:18:12.946621');
      }),
      _bench('Jiffy.parse(slash)', 20000, () {
        Jiffy.parse('1997/09/23');
      }),
      _bench('Jiffy.parse(pattern)', 10000, () {
        Jiffy.parse('23 Sep 97', pattern: 'dd MMM yy');
      }),
      _bench('Jiffy.parseFromList', 50000, () {
        Jiffy.parseFromList([1997, 9, 23, 11, 18, 12]);
      }),
      _bench('Jiffy.parseFromMillisecondsSinceEpoch', 50000, () {
        Jiffy.parseFromMillisecondsSinceEpoch(874991892946);
      }),
      _bench('Jiffy.clone()', 50000, () {
        j.clone();
      }),
    ];

    final manipulation = <_Result>[
      _bench('add(days: 1)', 50000, () {
        j.add(days: 1);
      }),
      _bench('add(months: 1)', 50000, () {
        j.add(months: 1);
      }),
      _bench('add(years: 1)', 50000, () {
        j.add(years: 1);
      }),
      _bench('subtract(days: 7)', 50000, () {
        j.subtract(days: 7);
      }),
      _bench('addDuration(Duration(hours:5))', 50000, () {
        j.addDuration(const Duration(hours: 5));
      }),
      _bench('startOf(Unit.day)', 50000, () {
        j.startOf(Unit.day);
      }),
      _bench('startOf(Unit.week)', 50000, () {
        j.startOf(Unit.week);
      }),
      _bench('startOf(Unit.month)', 50000, () {
        j.startOf(Unit.month);
      }),
      _bench('endOf(Unit.year)', 50000, () {
        j.endOf(Unit.year);
      }),
      _bench('toUtc()', 50000, () {
        j.toUtc();
      }),
    ];

    final formatting = <_Result>[
      _bench('format() (ISO 8601)', 50000, () {
        j.format();
      }),
      _bench("format(pattern: 'yyyy-MM-dd')", 20000, () {
        j.format(pattern: 'yyyy-MM-dd');
      }),
      _bench("format(pattern: 'EEEE, MMM d yyyy')", 20000, () {
        j.format(pattern: 'EEEE, MMM d yyyy');
      }),
      _bench("format(pattern: 'yyyy-MM-dd HH:mm:ss')", 20000, () {
        j.format(pattern: 'yyyy-MM-dd HH:mm:ss');
      }),
      _bench('yMMMMd (default display)', 20000, () {
        j.yMMMMd;
      }),
      _bench('yMMMMEEEEdjm (default display)', 20000, () {
        j.yMMMMEEEEdjm;
      }),
      _bench('jms (default display)', 20000, () {
        j.jms;
      }),
    ];

    final getters = <_Result>[
      _bench('year', 100000, () {
        j.year;
      }),
      _bench('month', 100000, () {
        j.month;
      }),
      _bench('date', 100000, () {
        j.date;
      }),
      _bench('dayOfWeek', 50000, () {
        j.dayOfWeek;
      }),
      _bench('dayOfYear', 50000, () {
        j.dayOfYear;
      }),
      _bench('weekOfYear', 50000, () {
        j.weekOfYear;
      }),
      _bench('quarter', 100000, () {
        j.quarter;
      }),
      _bench('daysInMonth', 100000, () {
        j.daysInMonth;
      }),
      _bench('isLeapYear', 100000, () {
        j.isLeapYear;
      }),
    ];

    final query = <_Result>[
      _bench('isBefore (microsecond)', 100000, () {
        j.isBefore(jLater);
      }),
      _bench('isAfter (microsecond)', 100000, () {
        j.isAfter(jLater);
      }),
      _bench('isSame (microsecond)', 100000, () {
        j.isSame(jLater);
      }),
      _bench('isSame (Unit.day)', 50000, () {
        j.isSame(jLater, unit: Unit.day);
      }),
      _bench('isBetween (microsecond)', 50000, () {
        j.isBetween(j, jLater);
      }),
      _bench('diff (microsecond)', 100000, () {
        j.diff(jLater);
      }),
      _bench('diff (Unit.day)', 50000, () {
        j.diff(jLater, unit: Unit.day);
      }),
      _bench('diff (Unit.month)', 20000, () {
        j.diff(jLater, unit: Unit.month);
      }),
      _bench('diff (Unit.year)', 20000, () {
        j.diff(jLater, unit: Unit.year);
      }),
    ];

    final relative = <_Result>[
      _bench('from(other)', 20000, () {
        j.from(jLater);
      }),
      _bench('to(other)', 20000, () {
        j.to(jLater);
      }),
      _bench('from(other, withPrefixAndSuffix: false)', 20000, () {
        j.from(jLater, withPrefixAndSuffix: false);
      }),
    ];

    _printReport('Jiffy benchmark — construction', construction);
    _printReport('Jiffy benchmark — manipulation', manipulation);
    _printReport('Jiffy benchmark — formatting', formatting);
    _printReport('Jiffy benchmark — getters', getters);
    _printReport('Jiffy benchmark — query / diff', query);
    _printReport('Jiffy benchmark — relative time', relative);

    print('');
    print('Notes:');
    print(' - ns/op is per-call cost (lower is better).');
    print(
        ' - "DateTime.now() (baseline)" is the raw Dart cost for comparison.');
    print(' - Measurements include warm-up; numbers are wall-clock and will');
    print('   vary with hardware, JIT state, and concurrent test load.');
  }, timeout: const Timeout(Duration(minutes: 2)));
}
