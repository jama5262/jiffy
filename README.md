# Jiffy

[![Build Status](https://travis-ci.org/jama5262/jiffy.svg?branch=develop)](https://travis-ci.org/jama5262/jiffy)
[![Coverage Status](https://coveralls.io/repos/github/jama5262/jiffy/badge.svg?branch=develop)](https://coveralls.io/github/jama5262/jiffy?branch=develop)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Pub Version](https://img.shields.io/badge/pub-v1.0.0-blue)]()
[![Platform](https://img.shields.io/badge/platform-flutter%7Cweb%7Cdart%20vm-orange)](https://github.com/jama5262/jiffy)

Jiffy is a dart date package inspired by [momentjs](https://momentjs.com/) for parsing, manipulating, querying and formatting dates

#### [Full Documentation](https://github.com/jama5262/jiffy/tree/master/doc) | [Installation]()

# Usage

## Format Dates
```dart
Jiffy().format("MMMM dd yyyy, h:mm:ss a"); // October 19 2019, 7:00:53 PM
Jiffy().format("EEEE"); // Saturday
Jiffy().format("yyyy 'escaped' yyyy"); // 2019 escaped 2019
Jiffy().format(); // 2019-10-19T19:00:53.090646

//  You can also use default formats
Jiffy("19, Oct 2019", "dd, MMM yyyy").yMMMMd; // October 19, 2019
Jiffy().yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM
```

## Relative Time
```dart
Jiffy("2011-10-31", "yyyy-MM-dd").fromNow(); // 8 years ago
Jiffy("2012-06-20", "yyyy-MM-dd").fromNow(); // 7 years ago

var jiffy1 = Jiffy()
    ..startOf("day");
jiffy1.fromNow(); // 19 hours ago

var jiffy2 = Jiffy()
    ..endOf("day");
jiffy2.fromNow(); // in 5 hours

var jiffy3 = Jiffy()
    ..startOf("hour");
jiffy3.fromNow(); // 9 minutes ago
```

## Manipulation

```dart
var jiffy1 = Jiffy()
    ..add(1, "day");
jiffy1.yMMMMd; // October 20, 2019

var jiffy2 = Jiffy()
    ..subtract(1, "day");
jiffy2.yMMMMd; // October 18, 2019

//  You can chain methods by using Dart method cascading
var jiffy3 = Jiffy()
    ..add(1, "day")
    ..add(3, "hours")
    ..subtract(30, "minutes");
jiffy3.yMMMMEEEEdjm; // Sunday, October 20, 2019 9:50 PM

var jiffy4 = Jiffy()
    ..add(1, "day")
    ..add(3, "hours")
    ..subtract(30, "minutes");
jiffy4.format("dd/MM/yyy"); // 21/10/2019


// Months and year are added in respect to how many days there are in a months and if is a year is a leap year
Jiffy("2010-1-31", "yyyy-MM-dd"); // This is January 31
Jiffy("2010-1-31", "yyyy-MM-dd").add(1, "month"); // This is February 28
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

### Step 1

- **Option 1**
    - Fork this repo!

- **Option 2**
    - 👯 Clone this repo to your local machine using `https://github.com/jama5262/jiffy.git`

### Step 2

- **HACK AWAY!** 🔨🔨🔨

### Step 3

- 🔃 Create a new pull request

## Support

Reach out to me at one of the following places!

- Email at jama3137@gmail.com
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
