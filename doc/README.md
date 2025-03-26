# Jiffy

Jiffy is a Flutter (Android, IOS and Web) date time 
package for parsing, manipulating, querying and formatting dates

# Parsing

Jiffy makes date-time parsing in Dart simple and intuitive. Below are various ways to create and manipulate date-time objects using Jiffy.

## Getting the Current Date-Time

To get the current date-time, use `Jiffy.now()`. This returns a Jiffy instance with the current date-time.

```dart
Jiffy.now(); // Returns a Jiffy instance
Jiffy.now().dateTime; // Returns a Dart DateTime.now()
Jiffy.now().format(); // Returns an ISO 8601 formatted date-time
```

## Parsing from Strings

You can create a Jiffy instance by parsing a string representation of a date.

```dart
Jiffy.parse('2021/05/25'); // Standard date format (YYYY/MM/DD)

Jiffy.parse('2021-05-25 12:00:00.000'); // Parse from Dart's DateTime to string format

// ISO formats
Jiffy.parse('2021-05-25'); // ISO Date format
Jiffy.parse('2021-05-25T12:00:00.000'); // ISO date time format
Jiffy.parse('2021-05-25T12:00:00.000Z'); // ISO date time UTC format
Jiffy.parse('2021-05-25T12:00:00.000+02:00'); // ISO date time UTC offset format
```

## Parsing with Custom String Patterns

If you know the format of an input string, specify a pattern to parse it correctly.

```dart
Jiffy.parse('2021, May 25', pattern: 'yyyy, MMMM dd');
Jiffy.parse('25-05-2021', pattern: 'dd-MM-yyyy');
Jiffy.parse('5-2021', pattern: 'MM-yyyy');
```

### Ordinal Date Formats

Jiffy supports ordinal dates (e.g., "1st", "2nd", "3rd"). Use `do` in the pattern:

```dart
Jiffy.parse('Jan 19th', pattern: 'MMM do');
Jiffy.parse('19th January 2021', pattern: 'do MMMM yyyy');
```

> **Note:** Jiffy is built on top of the [Intl DateFormat](https://pub.dev/packages/intl) package.
> You can find supported date-time patterns [here](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html).


## Parsing in UTC

To parse dates that are already in UTC, set `isUtc: true`:

```dart
Jiffy.parse('2021-05-25', isUtc: true).isUtc; // true
```

## Parsing from `DateTime`

You can create a Jiffy instance from a Dart `DateTime` object.

```dart
var dateTime = DateTime.now();
Jiffy.parseFromDateTime(dateTime);
Jiffy.parseFromDateTime(DateTime(2021, 5, 25)).yMMMM; // May 2021
```

## Parsing from Another Jiffy Instance

You can create a Jiffy instance from an existing Jiffy instance.

```dart
var jiffy = Jiffy.now();
Jiffy.parseFromJiffy(jiffy);
```

## Parsing from Lists

Create a Jiffy instance from a list of date components:

But it has to be in the following order

`[ year, month, day, hour, minute, second, millisecond, microsecond ]`

```dart
Jiffy.parseFromList([2021]); // January 1st, 2021
Jiffy.parseFromList([2021, 10]); // October 1st, 2021
Jiffy.parseFromList([2021, 10, 19]); // October 19th, 2021
```

## Parsing from Maps

Jiffy supports parsing from maps with specific date-time units enum.

Here are all the units supported

`[ Unit.year, Unit.month, Unit.day, Unit.hour, Unit.minute, Unit.second, Unit.millisecond and Unit.microsecond ]`.

```dart
Jiffy.parseFromMap({
  Unit.hour: 19,
  Unit.minute: 20
}); // January 1st, 2021 19:20:00

Jiffy.parseFromMap({
  Unit.year: 2019,
  Unit.month: 10,
  Unit.day: 19,
  Unit.hour: 19
}); // October 19th, 2019 19:00:00
```

## Parsing from Epoch Timestamps

Jiffy supports parsing timestamps in microseconds or milliseconds since epoch time.

```dart
// Microseconds since epoch
Jiffy.parseFromMicrosecondsSinceEpoch(874962000000000); // 1997-09-23 00:00:00.000

// Milliseconds since epoch
Jiffy.parseFromMillisecondsSinceEpoch(874962000000); // 1997-09-23 00:00:00.000
```

## Cloning Jiffy Instances

You can clone an existing Jiffy instance using `Jiffy.parseFromJiffy` or `.clone()` function.

```dart
var jiffy1 = Jiffy.parseFromList([2021]);
var jiffy2 = Jiffy.parseFromJiffy(jiffy1);

jiffy1.add(years: 10);
print(jiffy1.year); // 2031
print(jiffy2.year); // 2021
```

Or using `.clone()`:

```dart
var jiffy1 = Jiffy.parseFromList([2021]);
var jiffy2 = jiffy1.clone();

jiffy1.add(years: 10);
print(jiffy1.year); // 2031
print(jiffy2.year); // 2021
```

## Converting to UTC

To convert a Jiffy instance to UTC:

```dart
var jiffy1 = Jiffy.now();
print(jiffy1.isUtc); // false

var jiffy2 = jiffy1.toUtc();
print(jiffy2.isUtc); // true
```

# Get

Jiffy provides various methods to retrieve specific date-time components from a 
Jiffy instance. Below are the available getters and their respective outputs.

### Get `Dart` Date-Time
Returns a `DateTime` instance representing the Jiffy object.
```dart
Jiffy.now().dateTime;
```

### Get Microseconds
Returns the microsecond part of the time, ranging from 0 to 999.
```dart
Jiffy.now().microsecond;
```

### Get Microseconds Since Epoch
Returns the number of microseconds elapsed since the Unix epoch (`January 1, 1970, 00:00:00 UTC`).
```dart
Jiffy.now().microsecondsSinceEpoch;
```

### Get Milliseconds
Returns the millisecond part of the time, ranging from 0 to 999.
```dart
Jiffy.now().millisecond;
```

### Get Milliseconds Since Epoch
Returns the number of milliseconds elapsed since the Unix epoch.
```dart
Jiffy.now().millisecondsSinceEpoch;
```

### Get Seconds
Returns the second component of the time, ranging from 0 to 59.
```dart
Jiffy.now().second;
```

### Get Minutes
Returns the minute component of the time, ranging from 0 to 59.
```dart
Jiffy.now().minute;
```

### Get Hours
Returns the hour component of the time, ranging from 0 to 23.
```dart
Jiffy.now().hour;
```

### Get Day of the Month
Returns the day of the month, ranging from 1 to 31.
```dart
Jiffy.now().date;
```

### Get Day of the Week
Returns the day of the week as an integer (1-7). The value depends on the locale’s start 
of the week (Saturday, Sunday, or Monday).

More on how to override the default start of week can be found 
[here](#start-of-week)
```dart
Jiffy.now().dayOfWeek;
```

### Get Number of Days in a Month
Returns the total number of days in the current month
```dart
Jiffy.now().daysInMonth;
```

### Get Day of the Year
Returns the day number of the year, ranging from 1 to 366.
```dart
Jiffy.now().dayOfYear;
```

### Get Week of the Year
Returns the current week number based on the locale’s start of the week. The week of the year ranges from 1 to 53, where week 1 is the first full week of the year.

More on how to override the default start of week can be found
[here](#start-of-week)
```dart
Jiffy.now().weekOfYear;
```

### Get Month
Returns the month of the year as an integer (1-12), where 1 represents January and 12 represents December.
```dart
Jiffy.now().month;
```

### Get Quarter of the Year
Returns the quarter of the year as an integer (1-4).
```dart
Jiffy.now().quarter;
```

### Get Year
Returns the current year as an integer.
```dart
Jiffy.now().year;
```

# Manipulation

Jiffy allows you to manipulate dates by adding, subtracting, or modifying 
specific time units. Below are various methods for date-time manipulation.

### Add Using Dart's `Duration` Object
Allows you to add time by specifying a `Duration` object.
```dart
Jiffy.parse('1997/09/23')
  .addDuration(Duration(days: 5, hours: 6))
  .format(); // 1997-09-28T06:00:00.000
```

### Add Specific Units
Adds the specified time units to a Jiffy instance. Supported units: `years, months,
 weeks, days, hours, minutes, seconds, milliseconds, microseconds`.
```dart
Jiffy.parse('1997/09/23')
    .add(years: 2, months: 3, days: 5)
    .yMMMMd; // December 28, 1999
```

### Subtract Using Dart's `Duration` Object
Allows you to subtract time using a `Duration` object.
```dart
Jiffy.parse('1997/09/23')
.subtractDuration(Duration(days: 5, hours: 6))
.format(); // 1997-09-17T18:00:00.000
```

### Subtract Specific Units
Subtracts the specified time units from a Jiffy instance. Supported units: `years, 
months, weeks, days, hours, minutes, seconds, milliseconds, microseconds`.
```dart
Jiffy.parse('1997/09/23')
.subtract(years: 2, months: 3, days: 5)
.yMMMMd; // June 18, 1995
```

### Start of Time
Returns a new Jiffy instance representing the start of the specified `unit` of time.

Available units: `microsecond, millisecond, second, minute, hour, day, week, month, year`
```dart
Jiffy.now().startOf(Unit.millisecond); // 2023-02-26T13:28:20.047000
Jiffy.now().startOf(Unit.second); // 2023-02-26T13:28:20.000000
Jiffy.now().startOf(Unit.minute); // 2023-02-26T13:28:00.000000
Jiffy.now().startOf(Unit.hour); // 2023-02-26T13:00:00.000000
Jiffy.now().startOf(Unit.day); // 2023-02-26T00:00:00.000000
Jiffy.now().startOf(Unit.week); // 2023-02-26T00:00:00.000000
Jiffy.now().startOf(Unit.month); // 2023-02-01T00:00:00.000000
Jiffy.now().startOf(Unit.year); // 2023-01-01T00:00:00.000000
```

Additional Example:
```dart
Jiffy.now()
    .startOf(Unit.day)
    .add(days: 1)
    .format('MMMM do yyyy, h:mm:ss a'); // March 3rd 2021, 12:00:00 AM
```

### End of Time
Returns a new Jiffy instance representing the end of the specified `unit` of time.
```dart
Jiffy.now().endOf(Unit.year);    // Set to December 31st, 23:59:59:999 this year
Jiffy.now().endOf(Unit.month);   // Set to the end of this month, 23:59:59:999
Jiffy.now().endOf(Unit.week);    // Set to the last day of this week, 23:59:59:999
Jiffy.now().endOf(Unit.day);     // Set to 23:59:59:999 today
```

### Convert to Local Time
Sets the Jiffy instance to local time.
```dart
var jiffy = Jiffy.parseFromList([2022]).toUtc(); // Time in UTC

jiffy.local(); // Convert to local time
```

### Convert to UTC Time
Sets the Jiffy instance to Coordinated Universal Time (UTC).
```dart
var jiffy = Jiffy.now(); // Time in local timezone

jiffy.toUtc(); // Convert to UTC
```

# Display

### Format
Jiffy runs on top of the [Intl DateFormat](https://pub.dev/packages/intl) package. You can find all the date-time patterns used by Jiffy [here](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html).
```dart
Jiffy.now().format('MMMM do yyyy, h:mm:ss a'); // October 19th 2019, 7:00:53 PM
Jiffy.now().format('EEEE'); // Saturday
Jiffy.now().format('yyyy [escaped] yyyy'); // 2019 escaped 2019

// Default format returns an ISO Date
Jiffy().format(); // 2019-10-19T19:00:53.090646
```
Pre-set formats can also be used:
```dart
Jiffy.now().yMMMMd; // October 19, 2019
Jiffy.now().yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM
```

### Time from Now
Returns the relative time from now.
```dart
Jiffy.parse('2007-01-29').fromNow(); // 14 years ago
Jiffy.parseFromList([2022, 10, 29]).fromNow(); // in a year
Jiffy.parseFromDateTime(DateTime(2050, 10, 29)).fromNow(); // in 30 years
Jiffy.now().startOf(Unit.hour).fromNow(); // 9 minutes ago
```
To omit the `in` and `ago`:
```dart
Jiffy.parse('2007-01-29').fromNow(withPrefixAndSuffix: false); // 14 years
```

### Time from X
Gets the relative time from a specific date-time.
```dart
var jiffy1 = Jiffy.parse('2007-01-28');
var jiffy2 = Jiffy.parse('2017-01-29');

jiffy1.from(jiffy2); // a day ago
```

### Time to Now
Works opposite to `fromNow()`, returning the relative time to now.
```dart
Jiffy.parse('2007-01-29').toNow(); // in 14 years
```

### Difference
Gets the difference between two Jiffy date-times.
```dart
var jiffy1 = Jiffy.parse('2017-1-29');
var jiffy2 = Jiffy.parse('2017-1-28');

jiffy1.diff(jiffy2); // 86400000000 (microseconds)
```
You can get the difference in another unit of measurement. The default is `Unit.microsecond`.
The units that are available are,

`[ Unit.microsecond, Unit.millisecond, Unit.second, Unit.minute, 
Unit.hour, Unit.day, Unit.week, Unit.month, Unit.year ]`
```dart
Jiffy.parseFromList([2007, 1, 28]).diff(Jiffy.parseFromList([2017, 1, 29]), unit: Unit.day); // -3654
```
Also by default `diff` will truncate the result to return a whole number. 
For floating-point values, set `asFloat` to `true`:
```dart
var jiffy1 = Jiffy.parse('2008-10', pattern: 'yyyy-MM');
var jiffy2 = Jiffy.parse('2007-01', pattern: 'yyyy-MM');

jiffy1.diff(jiffy2, unit: Unit.year, asFloat: true); // 1.75
```

# Query

## Checking DateTime Comparisons with Jiffy

### Is Before
Check if a DateTime is before another DateTime.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-10-21");

print(jiffy1.isBefore(jiffy2)); // true
```

You can also check in terms of specific time units. The following example checks if a year is before another year:
```dart
var jiffy1 = Jiffy.parse("2020-10-20");

var jiffy2 = Jiffy.parse("2020-12-31");
var jiffy3 = Jiffy.parse("2021-01-01");

print(jiffy1.isBefore(jiffy2, unit: Unit.year)); // false
print(jiffy1.isBefore(jiffy3, unit: Unit.year)); // true
```

### Is Same
Check if a DateTime is the same as another DateTime.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-10-20");

print(jiffy1.isSame(jiffy2)); // true
```

Checking by a specific unit, such as the year:
```dart
var jiffy1 = Jiffy.parse("2021-10-20");

var jiffy2 = Jiffy.parse("2020-12-31");
var jiffy3 = Jiffy.parse("2021-01-01");

print(jiffy1.isSame(jiffy2, unit: Unit.year)); // false
print(jiffy1.isSame(jiffy3, unit: Unit.year)); // true
```

### Is After
Check if a DateTime is after another DateTime.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-10-19");

print(jiffy1.isAfter(jiffy2)); // true
```

Checking by a specific unit:
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-01-01");
var jiffy3 = Jiffy.parse("2020-12-31");

print(jiffy1.isAfter(jiffy2, unit: Unit.year)); // false
print(jiffy1.isAfter(jiffy3, unit: Unit.year)); // true
```

### Is Same or Before
Check if a DateTime is the same as or before another DateTime.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2020-12-31");
var jiffy3 = Jiffy.parse("2021-12-31");
var jiffy4 = Jiffy.parse("2022-01-01");

print(jiffy1.isSameOrBefore(jiffy2, unit: Unit.year)); // false
print(jiffy1.isSameOrBefore(jiffy3, unit: Unit.year)); // true
print(jiffy1.isSameOrBefore(jiffy4, unit: Unit.year)); // true
```

### Is Same or After
Check if a DateTime is the same as or after another DateTime.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2022-12-31");
var jiffy3 = Jiffy.parse("2021-01-01");
var jiffy4 = Jiffy.parse("2020-12-31");

print(jiffy1.isSameOrAfter(jiffy2, unit: Unit.year)); // false
print(jiffy1.isSameOrAfter(jiffy3, unit: Unit.year)); // true
print(jiffy1.isSameOrAfter(jiffy4, unit: Unit.year)); // true
```

### Is Between
Check if a DateTime is between two other DateTimes.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-01-01");
var jiffy3 = Jiffy.parse("2023-01-01");
var jiffy4 = Jiffy.parse("2020-12-31");
var jiffy5 = Jiffy.parse("2023-01-01");

print(jiffy1.isBetween(jiffy2, jiffy3, unit: Unit.year)); // false
print(jiffy1.isBetween(jiffy4, jiffy5, unit: Unit.year)); // true
```

### Is Leap Year
Check if a year is a leap year.
```dart
print(Jiffy.parse("2019", pattern: "yyyy").isLeapYear); // false
print(Jiffy.parse("2016", pattern: "yyyy").isLeapYear); // true
```

# Locale Support

Jiffy supports all locales that the [Intl](https://pub.dev/packages/intl) package 
provides.

## Setting a locale
Setting locales in Jiffy **_always returns a future_**

```dart
// To set a locale
await Jiffy.setLocale('fr');
Jiffy.now().yMMMMEEEEdjm; // samedi 19 octobre 2019 19:25

await Jiffy.setLocale('ar');
Jiffy.now().yMMMMEEEEdjm; // السبت، ١٩ أكتوبر ٢٠١٩ ٧:٢٧ م

await Jiffy.setLocale('zh-cn');
Jiffy.now().yMMMMEEEEdjm; // 2019年10月19日星期六 下午7:28
```

## Advanced locale setting

Jiffy allows for advanced locale configurations, such as overriding default 
settings for the start of the week, ordinal suffixes, and relative date-time formats.

```dart
await Jiffy.setLocale(
  locale: 'en_US',
  startOfWeek: StartOFWeek.monday,
  ordinals: Ordinals(first: "st", second: "nd", third: "rd", nth: "th"),
  relativeDateTime: EnRelativeDateTime()
);
```

Let's explore these configurations in more detail.

### Start of week
The start of week consists of the following `saturday, sunday, monday`. For example, the
locale `en_US`, the start of week is `StartOfWeek.sunday`.

But sometimes you might want to override this.

```dart
await Jiffy.setLocale(locale: 'en_US');

final jiffy = Jiffy.now().locale.startOfWeek; // Sunday

// Overriding the start of week
await Jiffy.setLocale(
    locale: 'en_US',
    startOfWeek: StartOFWeek.saturday,
);

final jiffy = Jiffy.now().locale.startOfWeek; // Saturday
```

### Ordinals
An ordinal represents the position or rank of a number in a sequence, often 
used for dates. In date formatting, ordinals appear as suffixes like st, nd, 
rd, and th, depending on the number. For example, "1st", "2nd", "3rd", and "4th" 
follow ordinal rules.

Jiffy already has a list of built-in ordinals for a vast list of supported locales. **_But, 
there might be situations a specific locale you might require is not supported, hence, 
when setting a locale, you can provide your own custom ordinals that Jiffy can use, 
for cases like returning a date time format or when parsing a date time to Jiffy._**

```dart
await Jiffy.setLocale(
    locale: 'en_US',
    ordinals: Ordinals(first: "st", second: "nd", third: "rd", nth: "th"),
);

// Formating
final jiffy = Jiffy.now();
print(jiffy.format("pattern: 'do MMMM yyyy'")); // 19th October 2019

// Parsing
final jiffy = Jiffy.parse('19th October 2019', pattern: 'do MMMM yyyy');
print(jiffy.format("pattern: 'do MMMM yyyy'")); // 19th October 2019
```

### Relative Date Time

As documented [here](#Display), relative date-time is used to express how much time has 
passed between a given time and the present moment in a human-readable format.

Example
```dart
Jiffy.parse('2007-01-29').fromNow(); // 14 years ago
```

Jiffy provides pre-built relative date-time support for some locales, but not all. 
To customize this, you can define your own relative date-time formatting by 
creating a custom class that extends the `RelativeDateTime` abstract class.

```dart
class CustomRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'in';
  @override
  String suffixAgo() => 'ago';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'a few seconds';
  @override
  String aboutAMinute(int minutes) => 'a minute';
  @override
  String minutes(int minutes) => '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => 'an hour';
  @override
  String hours(int hours) => '$hours hours';
  @override
  String aDay(int hours) => 'a day';
  @override
  String days(int days) => '$days days';
  @override
  String aboutAMonth(int days) => 'a month';
  @override
  String months(int months) => '$months months';
  @override
  String aboutAYear(int year) => 'a year';
  @override
  String years(int years) => '$years years';
  @override
  String wordSeparator() => ' ';
}

await Jiffy.setLocale(
    locale: 'en_US',
    relativeDateTime: CustomRelativeDateTime(),
);

var jiffy1 = Jiffy.parse('2007-01-28');
var jiffy2 = Jiffy.parse('2017-01-29');

jiffy1.from(jiffy2); // a day ago
```

You can also extend and customize Jiffy's pre-built relative date-time formatting, 
giving you the option to choose what to override. The example below demonstrates 
how to create a custom relative date-time class while building upon 
the existing `EnRelativeDateTime`.

```dart
class CustomRelativeDateTime extends EnRelativeDateTime {
  @override
  String suffixAgo() => 'ago, i think';
  @override
  String aDay(int hours) => 'like a day';
}

await Jiffy.setLocale(
    locale: 'en_US',
    relativeDateTime: CustomRelativeDateTime(),
);


var jiffy1 = Jiffy.parse('2007-01-28');
var jiffy2 = Jiffy.parse('2017-01-29');

jiffy1.from(jiffy2); // like a day ago, i think
```

## Getting the locale information
```dart
final locale = Jiffy.now().locale; // Returns a jiffy locale object
final localeCode = locale.code;
final localeStartOfWeek = locale.startOfWeek;
final localeCode = locale.ordinals;
final localeCode = locale.relativeDateTime;
```
## Getting a list of supported locales
```dart
final supportLocales = Jiffy.getSupportedLocales();
```