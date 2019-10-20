# Jiffy

[![Build Status](https://travis-ci.org/jama5262/jiffy.svg?branch=develop)](https://travis-ci.org/jama5262/jiffy)
[![Coverage Status](https://coveralls.io/repos/github/jama5262/jiffy/badge.svg?branch=develop)](https://coveralls.io/github/jama5262/jiffy?branch=develop)

Jiffy is a date dart package inspired by [momentjs](https://momentjs.com/) for parsing, manipulating, querying and formatting dates

# Table of content
- [Parsing](#parsing)
    - [Now](#now)
    - [String Formating](#string-formatting)
    - [Unix Timestamp](#unix-timestamp)
    - [UTC](#utc)
- [Get](#get)
    - [Milliseconds](#milliseconds)
    - [Seconds](#seconds)
    - [Minute](#minute)
    - [Hour](#hour)
    - [Date of Month](#date-of-month)
    - [Day of Week](#day-of-week)
    - [Day of Year](#day-of-year)
    - [Week of Year](#week-of-year)
    - [Month](#month)
    - [Quarter](#quarter)
    - [Year](#year)
- [Manipulation](#manipulation)
    - [Addition](#add)
    - [Subtraction](#subtract)
    - [Start of Time](#start-of-time)
    - [End of Time](#end-of-time)
    - [Local](#local)
    - [UTC](#utc)

# Parsing
#### Now
To get the date now, just call `Jiffy()` without passing any parameters. This will return a Jiffy instance. See below
```dart
Jiff(); // Returns a Jiffy instance
Jiffy().dateTime; // Returns a dart DateTime.now()
Jiffy().format(); // Return a ISO 8601 date time format
```

#### String Formatting
To get a Jiffy date from a string, pass the string and its pattern to Jiffy as is parameters. See below
```dart
Jiffy("1995-12-25", "yyyy-MM-dd");
```
Jiffy run on top of the [Intl DateFormat](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html) package, you can find all the date time patterns used by Jiffy [here](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html)

This is also same for Jiffy default formats. See below
```dart
Jiffy().yMMMMd;
Jiffy("1995-12-25", "yyyy-MM-dd").yMMMMd;
```

#### Unix Timestamp
Jiffy can also parse timestamp milliseconds and seconds. Just call `Jiffy.unix()` which return a dart Datetime. See below
```dart
// Parsing a milliseconds timestamp
Jiffy.unix(1318781876406);

// Parsing a timestamp in seconds
Jiffy.unix(1318781876);
```

_**Note**: `Jiffy.unix()` returns a timestamp base on local time. You can also get it in UTC which return a UTC in dart Datetime. See below_
```dart
Jiffy.unix(1318781876406).utc();
```

#### UTC
Jiffy can also return date time in UTC. See below
```dart
// No UTC
Jiffy().format(); // 2019-10-20T14:18:45.069304

//Change to UTC
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
#### Date of Month
Get date of month (Returns from 1 - 31)
```dart
Jiffy().date;
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
This adds time to Jiffy by the following units years, months, weeks, days, hours, minutes, seconds and milliseconds. See below
```dart
Jiffy().add(1, "year");
Jiffy().add(3, "d");
```
Below are the units that can be used

| Key  | Units |
| ------------- | ------------- |
| years  | y / year / years  |
| months  | M / month / months  |
| weeks  | w / week / weeks  |
| days  | d / day / days  |
| hours  | h / hour / hours  |
| minutes  | m / minute /minutes  |
| seconds  | s / second / seconds  |
| milliseconds  | ms / millisecond / milliseconds  |

You can also add date time with chaining

```dart
var jiffy = Jiffy()
    ..add(7, "days")
    ..add(1, "month");
jiffy.yMMMMd; // November 27, 2019
```

**_Note: Months and year are added in respect to how many days there are in a months and if is a year is a leap year. See below_**

```dart
Jiffy("2010-1-31", "yyyy-MM-dd"); // This is January 31
Jiffy("2010-1-31", "yyyy-MM-dd").add(1, "month"); // This is February 28
```
#### Subtract
This subtracts time from Jiffy by the following units years, months, weeks, days, hours, minutes, seconds and milliseconds. See below
```dart
Jiffy().subtract(1, "year");
Jiffy().subtract(3, "d");
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
#### End of Time
This set the Jiffy date time to a specific unit in time in terms of years, months, weeks, days, hours, minutes, seconds and milliseconds. See below

```dart
Jiffy().startOf('year');    // Set to December 31st, 23:59:59:999 this year
Jiffy().startOf('month');   // Set to the end of this month, 23:59:59:999
Jiffy().startOf('week');    // Set to the end day of this week, 23:59:59:999
Jiffy().startOf('day');     // Set to 23:59:59:999 today
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