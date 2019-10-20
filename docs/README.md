# Jiffy

[![Build Status](https://travis-ci.org/jama5262/jiffy.svg?branch=develop)](https://travis-ci.org/jama5262/jiffy)
[![Coverage Status](https://coveralls.io/repos/github/jama5262/jiffy/badge.svg?branch=develop)](https://coveralls.io/github/jama5262/jiffy?branch=develop)

Jiffy is a date dart package inspired by [momentjs](https://momentjs.com/) for parsing, manipulating, querying and formatting dates

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
