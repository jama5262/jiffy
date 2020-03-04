# Jiffy

[![Build Status](https://travis-ci.org/jama5262/jiffy.svg?branch=master)](https://travis-ci.org/jama5262/jiffy)
[![Coverage Status](https://coveralls.io/repos/github/jama5262/jiffy/badge.svg?branch=master)](https://coveralls.io/github/jama5262/jiffy?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Pub Version](https://img.shields.io/badge/pub-v3.0.0-blue)](https://pub.dev/packages/jiffy)
[![Platform](https://img.shields.io/badge/platform-flutter%7Cweb%7Cdart%20vm-orange)](https://github.com/jama5262/jiffy)

Jiffy is a Flutter (Android, IOS and Web) date time package inspired by [momentjs](https://momentjs.com/) for parsing, manipulating, querying and formatting dates

### [Full Documentation](https://github.com/jama5262/jiffy/tree/v2.2.0/doc) | [Installation](https://pub.dev/packages/jiffy#-installing-tab-) | [ChangeLog](https://pub.dev/packages/jiffy#-changelog-tab-) | [Examples](https://pub.dev/packages/jiffy#-example-tab-)

# Usage

## Format Dates
```dart
Jiffy([2019, 10, 19]).format("MMMM do yyyy, h:mm:ss a"); // October 19th 2019, 7:00:53 PM
Jiffy().format("EEEE"); // Saturday
Jiffy().format("MMM do yy"); // Oct 19th 19
Jiffy().format("yyyy [escaped] yyyy"); // 2019 escaped 2019
Jiffy().format(); // 2019-10-19T19:00:53.090646

Jiffy([2019, 10, 19]).yMMMMd; // October 19, 2019
Jiffy({
  "year": 2019,
  "month": 10,
  "day": 19,
  "hour": 19
}).yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM

//  You can also use default formats
Jiffy("19, Oct 2019", "dd, MMM yyyy").yMMMMd; // October 19, 2019

Jiffy().yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM
```

## Relative Time
```dart
Jiffy("2011-10-31", "yyyy-MM-dd").fromNow(); // 8 years ago
Jiffy("2012-06-20").fromNow(); // 7 years ago

var jiffy1 = Jiffy()
    ..startOf(Units.DAY);
jiffy1.fromNow(); // 19 hours ago

var jiffy2 = Jiffy()
    ..endOf(Units.DAY);
jiffy2.fromNow(); // in 5 hours

var jiffy3 = Jiffy()
    ..startOf(Units.HOUR);
jiffy3.fromNow(); // 9 minutes ago
```

## Manipulation

```dart
var jiffy1 = Jiffy()
    ..add(duration: Duration(days: 1));
jiffy1.yMMMMd; // October 20, 2019

var jiffy2 = Jiffy()
    ..subtract(days: 1);
jiffy2.yMMMMd; // October 18, 2019

//  You can chain methods by using Dart method cascading
var jiffy3 = Jiffy()
     ..add(hours: 3, days: 1)
     ..subtract(minutes: 30, months: 1);
jiffy3.yMMMMEEEEdjm; // Friday, September 20, 2019 9:50 PM

var jiffy4 = Jiffy()
    ..add(duration: Duration(days: 1, hours: 3))
    ..subtract(duration: Duration(minutes: 30));
jiffy4.format("dd/MM/yyy"); // 20/10/2019


// Months and year are added in respect to how many 
// days there are in a months and if is a year is a leap year
Jiffy("2010/1/31", "yyyy-MM-dd"); // This is January 31
Jiffy([2010, 1, 31]).add(months: 1); // This is February 28
```

## Locale Support
```dart
//  The locale method always return a future
//  To get locale (The default locale is English)
await Jiffy.locale(); // en

//  To set locale
await Jiffy.locale("fr");
Jiffy().yMMMMEEEEdjm; // samedi 19 octobre 2019 19:25

await Jiffy.locale("ar");
Jiffy().yMMMMEEEEdjm; // السبت، ١٩ أكتوبر ٢٠١٩ ٧:٢٧ م

await Jiffy.locale("zh-cn");
Jiffy().yMMMMEEEEdjm; // 2019年10月19日星期六 下午7:28
```

## Contributing

To contribute, follow the following easy steps

##### Step 1

- Fork this repo!

##### Step 2

- Make your own updates

##### Step 3

- Create a new pull request

## Support

Reach out to me at one of the following places!

- Email at jama3137@gmail.com
- Twitter [timedjama5262](https://twitter.com/timedjama5262)

<a href="https://www.buymeacoffee.com/jama" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/yellow_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>

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
