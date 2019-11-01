# Jiffy

[![Build Status](https://travis-ci.org/jama5262/jiffy.svg?branch=master)](https://travis-ci.org/jama5262/jiffy)
[![Coverage Status](https://coveralls.io/repos/github/jama5262/jiffy/badge.svg?branch=master)](https://coveralls.io/github/jama5262/jiffy?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Pub Version](https://img.shields.io/badge/pub-v2.1.0-blue)](https://pub.dev/packages/jiffy)
[![Platform](https://img.shields.io/badge/platform-flutter%7Cweb%7Cdart%20vm-orange)](https://github.com/jama5262/jiffy)

Jiffy is a dart date time package inspired by [momentjs](https://momentjs.com/) for parsing, manipulating, querying and formatting dates

# Table of content
- [Before Use](#before-use)
- [Parsing](#parsing)
    - [Now](#now)
    - [String](#string)
    - [String Formating](#string-formatting)
    - [Maps](#maps)
    - [Unix Timestamp](#unix-timestamp)
    - [DateTime](#datetime)
    - [List](#list)
    - [UTC](#utc)
- [Get](#get)
    - [Milliseconds](#milliseconds)
    - [Seconds](#seconds)
    - [Minute](#minute)
    - [Hour](#hour)
    - [Date of Month](#date-of-month)
    - [Days in Month](#days-in-month)
    - [Day of Week](#day-of-week)
    - [Day of Year](#day-of-year)
    - [Week of Year](#week-of-year)
    - [Month](#month)
    - [Quarter](#quarter)
    - [Year](#year)
- [Manipulation](#manipulation)
    - [Add](#add)
    - [Subtract](#subtract)
    - [Start of Time](#start-of-time)
    - [End of Time](#end-of-time)
    - [Local](#local)
    - [UTC](#utc)
- [Display](#display)
    - [Format](#format)
    - [Time from Now](#time-from-now)
    - [Time from X](#time-from-x)
    - [Difference](#difference)
    - [Unix Timestamp (Milliseconds)](#unix-timestamp-milliseconds)
    - [Unix Timestamp (Seconds)](#unix-timestamp-seconds)
- [Query](#query)
    - [Is Before](#is-before)
    - [Is Same](#is-same)
    - [Is After](#is-after)
    - [Is Same or Before](#is-same-or-before)
    - [Is Same or After](#is-same-or-after)
    - [Is Between](#is-between)
    - [Is Leap Year](#is-leapyear)
    - [Is Jiffy](#is-jiffy)
    - [Is DateTime](#is-datetime)
- [Locale Support](#locale-support)

# Before Use
Almost all of Jiffy methods return a dart DateTime instance, like the `add` and `subtract` methods. Example
```dart
Jiffy().add(years: 1); // Returns a DateTime instance
Jiffy().utc(); // Returns a DateTime instance
```
_**But when doing a method chaining, it is recommended to use a variable.**_ The variable will then hold a Jiffy instance. Example
```dart
var jiffy = Jiffy()
    ..utc()
    ..add(days: 1)
    ..add(hours: 3)
    ..subtract(minutes: 30); // Returns a Jiffy instance
```
Now `jiffy` variable returns a Jiffy instance. To get the date time, you can call it with the following methods
```dart
jiffy.format(); // 2019-10-20T19:00:53.090646
// or
jiffy.yMMMMd; // October 20, 2019
// or
jiffy.fromNow(); // in a day
```

# Parsing
#### Now
To get the date now, just call `Jiffy()` without passing any parameters. This will return a Jiffy instance. See below
```dart
Jiff(); // Returns a Jiffy instance
Jiffy().dateTime; // Returns a dart DateTime.now()
Jiffy().format(); // Return a ISO 8601 date time format
```

#### String
Creating a Jiffy from a string. See below
```dart
Jiffy("1995-12-25");
```

**_Note: For now, Jiffy supports only `yyyy-MM-dd` string formats. Passing string like `dd-MM-yyyy` will result in an exception. If you do need to pass this format, `dd-MM-yyyy` or any other, should also pass a pattern of that string, Also know as [String Formating](#string-formatting). See below_**
```dart
Jiffy("25-12-1995", "dd-MM-yyyy");
Jiffy("12-1995", "MM-yyyy");
```

#### String Formatting
To get a Jiffy date from a string, pass the string and its pattern to Jiffy as is parameters. See below
```dart
Jiffy("1995-12-25", "yyyy-MM-dd");
Jiffy("25-12-1995", "dd-MM-yyyy");
Jiffy("12-1995", "MM-yyyy");
```
You can also parse ordinal date formats. The date pattern for the ordinal date is `do`

```dart
Jiffy("0ct 19th", "MMM do");
Jiffy("19th October 2019", "do MMMM yyyy");
```

Jiffy runs on top of the [Intl DateFormat](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html) package, you can find all the date time patterns used by Jiffy [here](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html)

This is also same for Jiffy default formats. See below
```dart
Jiffy().yMMMMd;
Jiffy("1995-12-25", "yyyy-MM-dd").yMMMMd;
```

#### Maps
You can also create a Jiffy from a Map, Supported key pairs are, year, month, day, hour, minute, second and millisecond. See below
```dart
Jiffy({
  "hour": 19,
  "minutes": 20
});

Jiffy({
  "year": 2019,
  "month": 10,
  "day": 19,
  "hour": 19
});
```

#### Unix Timestamp
Jiffy can also parse timestamp milliseconds and seconds. Just call `Jiffy.unix()` which return a dart Datetime. See below
```dart
// Parsing a milliseconds timestamp
Jiffy.unix(1318781876406);

// Parsing a timestamp in seconds
Jiffy.unix(1318781876).format();
```

**_Note: `Jiffy.unix()` returns a timestamp base on local time. You can also get it in UTC which return a UTC in dart Datetime. See below_**
```dart
Jiffy.unix(1318781876406).utc();
```

#### DateTime
Jiffy date time can be created from a dart DateTime instance. See below
```dart
var dateTime = DateTime.now();
Jiffy(dateTime);

Jiffy(DateTime(2019, 10, 19)).yMMMM; // October 2019
```

#### List
You can also create Jiffy from a List. But they should mirror the following

`[ year, month, day, hour, minute, second, milliseconds ]`
```dart
Jiffy([2019]); // January 1st
Jiffy([2019, 10]); // October 1st
Jiffy([2019, 10, 19]); // October 19th
```

#### UTC
Get date time in UTC. See below
```dart
// In local time
Jiffy().format(); // 2019-10-20T14:18:45.069304

// Change to UTC
var jiffy = Jiffy()
    ..utc();
jiffy.format(); // 2019-10-20T11:18:45.069304Z
```

# Get
#### Milliseconds
Get milliseconds (Returns from 0 - 999)
```dart
Jiffy().milliseconds;
```

#### Seconds
Get seconds (Returns from 0 - 59)
```dart
Jiffy().seconds;
```
#### Minute
Get minute (Returns from 0 - 59)
```dart
Jiffy().minute;
```
#### Hour
Get hour (Returns from 0 - 23)
```dart
Jiffy().hour;
```
#### Date of month
Get date of month (Returns from 1 - 31)
```dart
Jiffy().date;
```
#### Days in month
Get days in a month (Returns from 28 - 31)
```dart
Jiffy().daysInMonth;
```
#### Day of week
Get day of week (Returns from 0 - 6 [Sunday - Saturday])
```dart
Jiffy().day;
```
#### Day of year
Get day o year (Returns from 1 - 366)
```dart
Jiffy().dayOfYear;
```
#### Week of year
Get week of year
```dart
Jiffy().week;
```
#### Month
Get month (Returns from 1 - 12 [Jan - Dec])
```dart
Jiffy().month;
```
#### Quarter
Get quarter (Returns from 1 - 4)
```dart
Jiffy().quarter;
```
#### Year
Get year
```dart
Jiffy().year;
```

# Manipulation

#### Add
This adds time to Jiffy by the following units years, months, weeks, days, hours, minutes, seconds and milliseconds, microseconds and duration. See below
```dart
Jiffy().add(years: 1);
Jiffy().add(days: 3);
Jiffy().add(months: 3, duration: Duration(days: 3));
Jiffy().add(years: 1, weeks: 3, duration: Duration(days: 3));
```
Below are the params that can be used

`years, months, weeks, days, hours, minutes, seconds, milliseconds, microseconds, duration`

You can also add date time with chaining using [dart method cascading](https://news.dartlang.org/2012/02/method-cascades-in-dart-posted-by-gilad.html)

```dart
var jiffy = Jiffy()
    ..startOf('day')
    ..utc()
    ..add(days: 7, months: 1)
    ..subtract(years: 1);
jiffy.yMMMMd; // November 27, 2018
```

**_Note: Months and year are added in respect to how many days there are in a months and if is a year is a leap year. See below_**

```dart
Jiffy("2010-1-31", "yyyy-MM-dd"); // This is January 31
Jiffy("2010-1-31", "yyyy-MM-dd").add(months: 1); // This is February 28
```
#### Subtract
This subtracts time from Jiffy by the following units years, months, weeks, days, hours, minutes, seconds and milliseconds. See below
```dart
Jiffy().subtract(years: 1);
Jiffy().subtract(days: 3);
```
#### Start of Time
This set the Jiffy date time to a specific unit in time in terms of years, months, weeks, days, hours, minutes, seconds and milliseconds. See below

```dart
Jiffy().startOf('year');    // Set to January 1st, 12:00 am this year
Jiffy().startOf('month');   // Set to the first of this month, 12:00 am
Jiffy().startOf('week');    // Set to the first day of this week, 12:00 am
Jiffy().startOf('day');     // Set to 12:00 am today
Jiffy().startOf('hour');    // Set to now, but with 0 mins, 0 secs, and 0 ms
Jiffy().startOf('minute');  // Set to now, but with 0 seconds and 0 milliseconds
Jiffy().startOf('second');  // Set to now, but with 0 milliseconds;
```
You can also add method cascading to date time. See below

```dart
var jiffy1 = Jiffy()
    ..startOf("day")
    ..add(days: 1);
```

#### End of Time
This set the Jiffy date time to a specific unit in time in terms of years, months, weeks, days, hours, minutes, seconds and milliseconds. See below

```dart
Jiffy().endOf('year');    // Set to December 31st, 23:59:59:999 this year
Jiffy().endOf('month');   // Set to the end of this month, 23:59:59:999
Jiffy().endOf('week');    // Set to the end day of this week, 23:59:59:999
Jiffy().endOf('day');     // Set to 23:59:59:999 today
```
#### Local
Sets Jiffy to local time. See below
```dart
var jiffy = Jiffy()..utc(); // Time in utc
jiffy.local(); // Set to local
```
#### UTC
Sets Jiffy to UTC time. See below
```dart
var jiffy = Jiffy(); // Time in local
jiffy.utc(); // Set to utc
```
# Display
#### Format
The format function takes in a string pattern, which can be found [here](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html), and format them. See below
```dart
Jiffy().format("MMMM do yyyy, h:mm:ss a"); // October 19th 2019, 7:00:53 PM
Jiffy().format("EEEE"); // Saturday
Jiffy().format("yyyy 'escaped' yyyy"); // 2019 escaped 2019

//  Not passing a string pattern for format method will return an ISO Date format
Jiffy().format(); // 2019-10-19T19:00:53.090646
```
You can also use Intl Dateformat default methods to format. See below
```dart
Jiffy().yMMMMd; // October 19, 2019
Jiffy().yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM
```
#### Time from Now
This method is used to get the relative time from now. See below
```dart
Jiffy("2007-1-29").fromNow(); // 13 years ago
Jiffy([2020, 10, 29]).fromNow(); // in a year
Jiffy(DateTime(2030, 10, 29)).fromNow(); // in 11 years

var jiffy = Jiffy()
..startOf("hour");
jiffy.fromNow(); // 9 minutes ago
```

#### Time from X
This method is used to get the relative time from a specific date time. See below
```dart
var jiffy1 = Jiffy("2007-1-28");
var jiffy2 = Jiffy("2017-1-29", "yyyy-MM-dd");

jiffy1.from(jiffy2); // a day ago

jiffy1.from([2017, 1, 30]); // 2 days ago
```
#### Difference
Used to get the difference between two Jiffy date times. See below
```dart
// By default, diff method, get the difference in milliseconds
var jiffy1 = Jiffy("2007-1-28", "yyyy-MM-dd");
var jiffy2 = Jiffy("2017-1-29", "yyyy-MM-dd");
jiff1.diff(jiffy2); // 86400000

// Getting difference in another unit of measurement
Jiffy({
  "year": 2007,
  "month": 1,
  "day": 28
}).diff([2017, 1, 29], "day"); // 1
```

Also by default `diff` will truncate the result to return a whole number. To get decimal numbers, just pass a third param as `true`. See below
```dart
var jiffy1 = Jiffy("2008-10", "yyyy-MM");
var jiffy2 = Jiffy("2007-1", "yyyy-MM");

jiff1.diff(jiffy2, "year"); // 1
jiff1.diff(jiffy2, "year", true); // 1.75
```
**_Note: Months and years are added in respect to how many days there are in a months and if is a year is a leap year._**

#### Unix Timestamp (Milliseconds)
To get timestamp in milliseconds see below
```dart
Jiffy().valueOf();
```

#### Unix Timestamp (Seconds)
To get timestamp in seconds see below
```dart
Jiffy().unix();
```

# Query
#### Is Before
Check if date time is before another date time. See below
```dart
var jiffy1 = Jiffy("2010-10-20");
var jiffy2 = Jiffy("2010-10-21");
jiffy1.isBefore(jiffy2); // true
```

You can also check in terms of units of measurement. The below example checks if year is before.
```dart
var jiffy1 = Jiffy([2010, 10, 20]);

var jiffy2 = Jiffy("2010-12-31", "yyyy-MM-dd");
var jiffy3 = Jiffy("2011-01-01", "yyyy-MM-dd");

jiffy1.isBefore(jiffy2, "year"); // false
jiffy1.isBefore(jiffy3, "year"); // true
```

#### Is Same
Check if date time is same with another date time. See below
```dart
var jiffy1 = Jiffy("2010-10-20", "yyyy-MM-dd");
var jiffy2 = Jiffy("2010-10-20", "yyyy-MM-dd");
jiffy1.isSame(jiffy2); // true
```

You can also check in terms of units of measurement. The below example checks if years are the same.
```dart
var jiffy1 = Jiffy("2010-10-20", "yyyy-MM-dd");

var jiffy2 = Jiffy("2009-12-31", "yyyy-MM-dd");
var jiffy3 = Jiffy("2010-01-01", "yyyy-MM-dd");

jiffy1.isSame(jiffy2, "year"); // false
jiffy1.isSame(jiffy3, "year"); // true
```

#### Is After
Check if date time is after another date time. See below
```dart
var jiffy1 = Jiffy("2010-10-20", "yyyy-MM-dd");
var jiffy2 = Jiffy("2010-10-19", "yyyy-MM-dd");
jiffy1.isAfter(jiffy2); // true
```

You can also check in terms of units of measurement. The below example checks if year is before.
```dart
var jiffy1 = Jiffy("2010-10-20", "yyyy-MM-dd");

var jiffy2 = Jiffy("2010-01-01", "yyyy-MM-dd");
var jiffy3 = Jiffy("2009-12-31", "yyyy-MM-dd");

jiffy1.isAfter(jiffy2, "year"); // false
jiffy1.isAfter(jiffy3, "year"); // true
```

#### Is Same or Before
Check if date time is same or before with another date time. See below
```dart
var jiffy1 = Jiffy("2010-10-20", "yyyy-MM-dd");

var jiffy2 = Jiffy("2009-12-31", "yyyy-MM-dd");
var jiffy3 = Jiffy("2010-12-31", "yyyy-MM-dd");
var jiffy4 = Jiffy("2011-01-01", "yyyy-MM-dd");

jiffy1.isSameOrBefore(jiffy2, "year"); // false
jiffy1.isSameOrBefore(jiffy3, "year"); // true
jiffy1.isSameOrBefore(jiffy4, "year"); // true
```
#### Is Same or After
Check if date time is same or after with another date time. See below
```dart
var jiffy1 = Jiffy("2010-10-20", "yyyy-MM-dd");

var jiffy2 = Jiffy("2011-12-31", "yyyy-MM-dd");
var jiffy3 = Jiffy("2010-01-01", "yyyy-MM-dd");
var jiffy4 = Jiffy("2009-12-31", "yyyy-MM-dd");

jiffy1.isSameOrAfter(jiffy2, "year"); // false
jiffy1.isSameOrAfter(jiffy3, "year"); // true
jiffy1.isSameOrAfter(jiffy4, "year"); // true
```

#### Is Between
Check if a date time is between two date times. See below
```dart
var jiffy1 = Jiffy("2010-10-20", "yyyy-MM-dd");

var jiffy2 = Jiffy("2010-01-01", "yyyy-MM-dd");
var jiffy3 = Jiffy("2012-01-01", "yyyy-MM-dd");

var jiffy4 = Jiffy("2009-12-31", "yyyy-MM-dd");
var jiffy5 = Jiffy("2012-01-01", "yyyy-MM-dd");

jiffy1.isBetween(jiffy2, jiffy3, "year"); // false
jiffy1.isBetween(jiffy4, jiffy5, "year"); // true
```

#### Is LeapYear
Check if date time is a leap year or not. See below
```dart
Jiffy("2019", "yyyy").isLeapYear; // false
Jiffy("2016", "yyyy").isLeapYear; // true
```

#### Is Jiffy
Check if it is a Jiffy instance. See below
```dart
Jiffy.isJiffy("string"); // false
Jiffy.isJiffy(Jiffy()); // true
Jiffy.isJiffy(DateTime.now()); // false
```

#### Is DateTime
Check if it is a dart DateTime instance. See below
```dart
Jiffy.isDateTime("string"); // false
Jiffy.isDateTime(DateTime.now()); // true
Jiffy.isDateTime(Jiffy()); // false
```

# Locale Support

Since Jiffy runs on top of Intl Dateformat, locale for all regions are almost supported. Example
```dart
await Jiffy.locale("fr");
Jiffy().yMMMMEEEEdjm; // samedi 19 octobre 2019 19:25
```
But for relative time e.g `fromNow() and from()` are written manually in Jiffy

Below are the locales that are supported for relative time. More will be added

| Key  | Locale |
| ------------- | ------------- |
| English  | en / en-sg / en-au / en-ca / en-gb / en-ie / en-il / en-nz |
| Spanish  | es / es-do / es-us |
| Chinese  | zh / zh-cn / zh-hk / zh-tw |
| Japanese  | ja |
| German  | de / de-at / de-ch |
| French  | fr / fr-ch / fr-ca |
| Italian  | it / it-ch |
| Korean  | ko |
| Russian  | ru |
| Hindi  | hi |
| Arabic  | ar / ar-ly / ar-dz / ar-kw / ar-sa / ar-ma / ar-tn |
| Portuguese  | pt / pt-br |

Getting and setting locales in Jiffy **_always returns a future_**

```dart
// Get the locale (By default, the locale is "en")
await Jiffy.locale(); // en

// To set locale
await Jiffy.locale("fr");
Jiffy().yMMMMEEEEdjm; // samedi 19 octobre 2019 19:25

await Jiffy.locale("ar");
Jiffy().yMMMMEEEEdjm; // السبت، ١٩ أكتوبر ٢٠١٩ ٧:٢٧ م

await Jiffy.locale("zh-cn");
Jiffy().yMMMMEEEEdjm; // 2019年10月19日星期六 下午7:28
```
