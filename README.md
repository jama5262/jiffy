# Jiffy

[![Publish to pub.dev](https://github.com/jama5262/jiffy/actions/workflows/publish.yml/badge.svg)](https://github.com/jama5262/jiffy/actions/workflows/publish.yml)
[![codecov](https://codecov.io/gh/jama5262/jiffy/branch/master/graph/badge.svg?token=Z2EGVUGWTE)](https://codecov.io/gh/jama5262/jiffy)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Pub Version](https://img.shields.io/badge/pub.dev-v6.3.2-blue)](https://pub.dev/packages/jiffy/versions/6.3.2)
![Platform](https://img.shields.io/badge/platform-flutter%7Cweb%7Cdart%20vm-orange)

Jiffy is a Flutter (Android, IOS and Web) date time package for parsing, manipulating, querying and formatting dates and time

### [Full Documentation](./doc) | [API Reference](https://pub.dev/documentation/jiffy/latest/jiffy/Jiffy-class.html) | [Installation](https://pub.dev/packages/jiffy/install) | [ChangeLog](https://pub.dev/packages/jiffy/changelog) | [Examples](https://pub.dev/packages/jiffy/example)

### [Discussions](https://github.com/jama5262/jiffy/discussions)

# Usage

## Format Dates
```dart
Jiffy.parse('2021/01/19').format(pattern: 'MMMM do yyyy, h:mm:ss a'); // January 1st 2021, 12:00:00 AM
Jiffy.now().format(pattern: 'EEEE'); // Tuesday
Jiffy.now().format(pattern: 'MMM do yy'); // Mar 2nd 21
Jiffy.now().format(pattern: 'yyyy [escaped] yyyy'); // 2021 escaped 2021
Jiffy.now().format(); // 2021-03-02T15:18:29.922343

Jiffy.parseFromList([2020, 10, 19]).yMMMMd; // January 19, 2021

Jiffy.parseFromMap({
  Unit.year: 2020,
  Unit.month: 10,
  Unit.day: 19,
  Unit.hour: 19
}).yMMMMEEEEdjm; // Monday, October 19, 2020 7:14 PM

//  You can also use pre-set formats
Jiffy.parse('19, Jan 2021', pattern: 'dd, MMM yyyy').yMMMMd; // January 19, 2021
Jiffy.now().yMMMMEEEEdjm; // Tuesday, March 2, 2021 3:20 PM
```

## Relative Time
```dart
// From X
Jiffy.parse('1997/09/23').from(Jiffy.parse('2002/10/26')); // 5 years ago
// From Now
Jiffy.parse('1997/09/23').fromNow(); // 25 years ago

// To X
Jiffy.parse('1997/09/23').to(Jiffy.parse('2002/10/26')); // in 5 years
// To Now
Jiffy.parse('1997/09/23').toNow(); // in 25 years
```

## Manipulation

```dart
var jiffy = Jiffy.now().add(days: 1);
jiffy.yMMMMd; // March 3, 2021

Jiffy.now().subtract(days: 1).yMMMMd; // March 1, 2021

Jiffy.now()
  .add(hours: 3, days: 1)
  .subtract(minutes: 30, months: 1)
  .yMMMMEEEEdjm; // Wednesday, February 3, 2021 6:07 PM

Jiffy.parse('1997/09/23')
    .startOf(Unit.year)
    .yMMMMEEEEd; // Wednesday, January 1, 1997

Jiffy.parse('1997/09/23')
    .endOf(Unit.month)
    .yMMMMEEEEd; // Tuesday, September 30, 1997
```

## Querying

```dart
Jiffy.parse('1997/9/23').isBefore(Jiffy.parse('1997/9/24')); // true

Jiffy.parse('1997/9/23').isAfter(Jiffy.parse('1997/9/20')); // true

Jiffy.parse('1997/9/23').isSame(Jiffy.parse('1997/9/23')); // true

Jiffy.parse('1997/9/23')
  .isBetween(Jiffy.parse('1997/9/20'), Jiffy.parse('1997/9/24')); // true
```

## Locale Support
```dart
// Get current locale code, by default it is en_us
Jiffy.now().localeCode; // en_us

//  Setting your preferred locale
await Jiffy.setLocale('fr_ca');
Jiffy.now().yMMMMEEEEdjm; // dimanche 26 février 2023 12 h 03

await Jiffy.setLocale('ja');
Jiffy.now().yMMMMEEEEdjm; // 2023年2月26日日曜日 12:02

await Jiffy.setLocale('zh_cn');
Jiffy.now().yMMMMEEEEdjm; // 2023年2月26日星期日 下午12:03
```

## Contributing

For contribution guidelines, see [CONTRIBUTING](./CONTRIBUTING.md).

## Support

Reach out to me at one of the following places!

- Email me at [jama3137@gmail.com](mailto:jama3137@gmail.com)
- LinkedIn [Jama Mohamed](https://www.linkedin.com/in/jama-mohamed/)
- Twitter [timedjama5262](https://twitter.com/timedjama5262)


## License

```
MIT License

Copyright (c) 2019 Jama Mohamed

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
