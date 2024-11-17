# Jiffy

Jiffy is a Flutter (Android, IOS and Web) date time 
package for parsing, manipulating, querying and formatting dates

# Parsing
### Now
To get the current date time, just call `Jiffy.now()`. 
This will return a Jiffy instance with the current date time.
```dart
Jiffy.now(); // Returns a Jiffy instance
Jiffy.now().dateTime; // Returns a dart DateTime.now()
Jiffy.now().format(); // Return a ISO 8601 date time format
```

### String
Creating a Jiffy date time by parsing a string.
```dart
Jiffy.parse('2021-05-25'); // A calendar date part
Jiffy.parse('2021/05/25'); // A calendar date part separated by slash "/"
Jiffy.parse('2021-05-25 12:00:00.000'); // An hour, minute, second, and millisecond time part
Jiffy.parse('2021-05-25T12:00:00.000'); // ISO date format
Jiffy.parse('2021-05-25T12:00:00.000Z'); // ISO date format (UTC)
```

### String Formatting
Create a Jiffy date time from a string date time pattern. 
Use this if you know the format of an input string
```dart
Jiffy.parse('2021, May 25', pattern: 'yyyy, MMMM dd');
Jiffy.parse('25-05-2021', pattern: 'dd-MM-yyyy');
Jiffy.parse('5-2021', pattern: 'MM-yyyy');
```
You can also parse ordinal date formats. The date pattern for the ordinal date is `do`

```dart
Jiffy.parse('Jan 19th', pattern: 'MMM do');
Jiffy.parse('19th January 2021', pattern: 'do MMMM yyyy');
```

**_Note: Jiffy runs on top of the [Intl DateFormat](https://pub.dev/packages/intl) 
package, so you can find all the date time patterns also
used by Jiffy [here](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html)_**

This is also same for Jiffy pre-set formats.
```dart
Jiffy.now().MMMEd; // Tue, May 25
Jiffy.parse('2021-05-25', pattern: 'yyyy-MM-dd').yMMMMd; // May 25, 2021
```

If you want to parse them as `utc` do the following. This will return Jiffy instance in
UTC date time
```dart
Jiffy.parse('2021-05-25', isUtc: true)
Jiffy.parse('2021-05-25', pattern: 'yyyy-MM-dd', isUtc: true)
```

### DateTime
Jiffy date time can be created from a dart `DateTime` instance.
```dart
var dateTime = DateTime.now();
Jiffy.parseFromDateTime(dateTime);

Jiffy.parseFromDateTime(DateTime(2021, 5, 25)).yMMMM; // May 2021
```

### Jiffy
Jiffy date time can be created from another `Jiffy` instance.
```dart
var jiffy = Jiffy.now();
Jiffy.parseFromJiffy(jiffy);
```

### List
You can also create Jiffy from a List. But they should mirror the following order

`[ year, month, day, hour, minute, second, millisecond, microsecond ]`
```dart
Jiffy.parseFromList([2021]); // January 1st 2021
Jiffy.parseFromList([2021, 10]); // October 1st 2021
Jiffy.parseFromList([2021, 10, 19]); // October 19th 2021
```

If you want to parse them as `utc` do the following. This will return Jiffy instance in
UTC date time
```dart
Jiffy.parseFromList([2021, 10], isUtc: true);
```

### Maps
You can also create a Jiffy from a Map, Supported key pairs are,

`[ Unit.year, Unit.month, Unit.day, Unit.hour, 
Unit.minute, Unit.second, Unit.millisecond and Unit.microsecond ]`.

If any of the units are not provided, the current date time will be used

```dart
Jiffy.parseFromMap(
  {
    Unit.hour: 19,
    Unit.minute: 20
  }
);

Jiffy.parseFromMap(
  {
    Unit.year: 2019,
    Unit.month: 10,
    Unit.day: 19,
    Unit.hour: 19
  }
);
```

If you want to parse them as `utc` do the following. This will return Jiffy instance in
UTC date time
```dart
Jiffy.parseFromMap(
  {
    Unit.year: 2019,
    Unit.month: 10,
    Unit.day: 19,
    Unit.hour: 19
  }, 
  isUtc: true
);
```

### Timestamps since epoch
Jiffy can also parse timestamp milliseconds and microseconds since epoch.
```dart
// Parsing a timestamp in microseconds since epoch
Jiffy.parseFromMicrosecondsSinceEpoch(874962000000000); // 1997-09-23 00:00:00.000

// Parsing a timestamp in milliseconds since epoch
Jiffy.parseFromMillisecondsSinceEpoch(874962000000); // 1997-09-23 00:00:00.000
```

If you want to parse them as `utc` do the following. This will return Jiffy instance in
UTC date time
```dart
// Parsing a timestamp in microseconds since epoch
Jiffy.parseFromMicrosecondsSinceEpoch(874962000000000, isUtc: true); // 1997-09-22 21:00:00.000Z

// Parsing a timestamp in milliseconds since epoch
Jiffy.parseFromMillisecondsSinceEpoch(874962000000, isUtc: true); // 1997-09-22 21:00:00.000Z
```

### Jiffy Cloning
Jiffy date time can be created from another Jiffy instance, a way of cloning.
```dart
var jiffy1 = Jiffy.parseFromList([2021]);
var jiffy2 = Jiffy.parseFromJiffy(jiffy1);
jiffy1.add(years: 10);
jiffy1.year; // 2031
jiffy2.year; // 2021
```

Or you can use the clone method itself
```dart
var jiffy1 = Jiffy.parseFromList([2021]);
var jiffy2 = jiffy1.clone();
jiffy1.add(years: 10);
jiffy1.year; // 2031
jiffy2.year; // 2021
```

### UTC
Get date time in UTC.
```dart
// In local time
var jiffy1 = Jiffy.now();
jiffy1.format(); // 2021-03-02T14:35:24.363919

// Change to UTC
var jiffy2 = jiffy1.toUtc();
jiffy2.format(); // 2021-03-02T11:35:24.363919Z
```

# Get
### DateTime
Returns a new `DateTime` instance of the `Jiffy` object.
```dart
Jiffy.now().dateTime;
```
### Microsecond
Returns the microsecond ranging from 0 to 999.
```dart
Jiffy.now().microsecond;
```
### Microsecond since epoch
Returns the number of microseconds since epoch time `January 1, 1970, 00:00:00 UTC`.
```dart
Jiffy.now().microsecondsSinceEpoch;
```
### Millisecond
Returns the millisecond ranging from 0 to 999.
```dart
Jiffy.now().millisecond;
```
### Millisecond since epoch
Returns the number of milliseconds since epoch time `January 1, 1970, 00:00:00 UTC`.
```dart
Jiffy.now().millisecondsSinceEpoch;
```
### Second
Returns the second ranging from 0 to 59.
```dart
Jiffy.now().second;
```
### Minute
Returns the minute ranging from 0 to 59.
```dart
Jiffy.now().minute;
```
### Hour
Returns the hour ranging from 0 to 23.
```dart
Jiffy.now().hour;
```
### Date of month
Returns the date ranging from 1 to 31.
```dart
Jiffy.now().date;
```
### Day of week
Returns the day of the week according to the 
locale's start of week. The return value is an integer 
between 1 and 7, where 1 represents the
locale start of week, either Saturday, Sunday or Monday
```dart
Jiffy.now().dayOfWeek;
```
### Days in a month
Returns the number of days in the month.
```dart
Jiffy.now().daysInMonth;
```
### Day of year
Returns the day of the year ranging from 1 to 366, 
where 1 represents January 1st of the year and 366 represents 
December 31st of a leap year.
```dart
Jiffy.now().dayOfYear;
```
### Week of year
Returns the week of the year based on the current 
locale's start of week. The week of the year ranges from 1 to 53, 
where week 1 is the first week that has at least 'DateTime.daysPerWeek' days in the new year.
```dart
Jiffy.now().weekOfYear;
```
### Month
Returns the month of the year ranging from 1 to 12, 
where 1 represents January and 12 represents December
```dart
Jiffy.now().month;
```
### Quarter
Returns the quarter on the year ranging from 1 to 4.
```dart
Jiffy.now().quarter;
```
### Year
Returns the year.
```dart
Jiffy.now().year;
```

# Manipulation

### Add using Dart's `Duration` object
```dart
Jiffy.parse('1997/09/23')
  .addDuration(Duration(days: 5, hours: 6))
  .format(); // 1997-09-28T06:00:00.000
```

### Add
This adds time to Jiffy by the following units 
`years, months, weeks, days, hours, minutes, seconds, milliseconds, microseconds`.
```dart
Jiffy.parse('1997/09/23')
    .add(years: 2, months: 3, days: 5)
    .yMMMMd; // December 28, 1999
```

### Subtract using Dart's `Duration` object
```dart
Jiffy.parse('1997/09/23')
    .subtractDuration(Duration(days: 5, hours: 6))
    .format(); // 1997-09-17T18:00:00.000
```

### Subtract
This subtracts time from Jiffy by the following units 
`years, months, weeks, days, hours, minutes, seconds, milliseconds, microseconds`.
```dart
Jiffy.parse('1997/09/23')
    .subtract(years: 2, months: 3, days: 5)
    .yMMMMd; // June 18, 1995
```
### Start of Time
Returns a new Jiffy instance representing the start of the specified
`unit` of time

The units that are available are,

`[ Unit.microsecond, Unit.millisecond, Unit.second, Unit.minute, 
Unit.hour, Unit.day, Unit.week, Unit.month, Unit.year ]`

```dart
// Set to now, but with 0 microseconds
Jiffy.now().startOf(Unit.millisecond); // 2023-02-26T13:28:20.047000

// Set to now, but with 0 milliseconds and microseconds
Jiffy.now().startOf(Unit.second); // 2023-02-26T13:28:20.00000

// Set to now, but with 0 seconds, milliseconds and microsecond
Jiffy.now().startOf(Unit.minute); // 2023-02-26T13:28:00.00000

// Set to now, but with 0 minutes, seconds, milliseconds and microseconds
Jiffy.now().startOf(Unit.hour); // 2023-02-26T13:00:00.00000

// Set to now 12:00 am today
Jiffy.now().startOf(Unit.day);  // 2023-02-26T00:00:00.00000

// Set to the first day of this week, 12:00 am
Jiffy.now().startOf(Unit.week); // 2023-02-26T00:00:00.00000

// Set to the first of this month, 12:00 am
Jiffy.now().startOf(Unit.month); // 2023-02-01T00:00:00.00000

// Set to January 1st, 12:00 am this year
Jiffy.now().startOf(Unit.year); // 2023-01-01T00:00:00.000000
```
Another example
```dart
Jiffy.now()
    .startOf(Unit.day)
    .add(days: 1);
    .format('MMMM do yyyy, h:mm:ss a'); // March 3rd 2021, 12:00:00 AM
```

### End of Time
Returns a new Jiffy instance representing the end of the specified unit of time

```dart
Jiffy.now().endOf(Unit.year);    // Set to December 31st, 23:59:59:999 this year
Jiffy.now().endOf(Unit.month);   // Set to the end of this month, 23:59:59:999
Jiffy.now().endOf(Unit.week);    // Set to the end day of this week, 23:59:59:999
Jiffy.now().endOf(Unit.day);     // Set to 23:59:59:999 today
```
### To Local
Sets Jiffy to local time.
```dart
var jiffy = Jiffy.parseFromList([2022]).toUtc(); // Time in utc
var jiffy = Jiffy.parseFromList([2022], isUtc: true).utc(); // Also time in utc

jiffy.local(); // Set to local
```
### To UTC
Sets Jiffy to UTC time.
```dart
var jiffy = Jiffy.now(); // Time in local

jiffy.toUtc(); // Set to utc
```
# Display
### Format
**_Note: Jiffy runs on top of the [Intl DateFormat](https://pub.dev/packages/intl) 
package, so you can find all the date time patterns used 
by Jiffy [here](https://pub.dev/documentation/intl/latest/intl/DateFormat-class.html)_**
```dart
Jiffy.now().format('MMMM do yyyy, h:mm:ss a'); // October 19th 2019, 7:00:53 PM
Jiffy.now().format('EEEE'); // Saturday
Jiffy.now().format('yyyy [escaped] yyyy'); // 2019 escaped 2019

// Not passing a string pattern to the format method will return an ISO Date format
Jiffy().format(); // 2019-10-19T19:00:53.090646
```
You can also use pre-set formats.
```dart
Jiffy.now().yMMMMd; // October 19, 2019
Jiffy.now().yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM
```
### Time from Now
This method is used to get the relative time from now.
```dart
Jiffy.parse('2007-01-29').fromNow(); // 14 years ago
Jiffy.parseFromList([2022, 10, 29]).fromNow(); // in a year
Jiffy.parseFromDateTime(DateTime(2050, 10, 29)).fromNow(); // in 30 years

Jiffy.now().startOf(Unit.hour).fromNow(); // 9 minutes ago
```

You can also omit returning the prefix and suffix like `in` and `ago`.

```dart
Jiffy.parse('2007-01-29').fromNow(withPrefixAndSuffix: false); // 14 years
```

### Time from X
This method is used to get the relative time from a specific date time.
```dart
var jiffy1 = Jiffy.parse('2007-01-28');
var jiffy2 = Jiffy.parse('2017-01-29');

jiffy1.from(jiffy2); // a day ago
```

You can also omit returning the prefix and suffix like `in` and `ago`.

```dart
var jiffy1 = Jiffy.parse('2007-01-28');
var jiffy2 = Jiffy.parse('2017-01-29');

jiffy1.from(jiffy2, withPrefixAndSuffix: false); // a day
```

### Time to Now
This works opposite to the `fromNow()` method. 
This method is used to get the relative time to now.
```dart
Jiffy.parse('2007-01-29').toNow(); // in 14 years
Jiffy.parseFromList([2022, 10, 29]).toNow(); // a year ago
Jiffy.parseFromDateTime(DateTime(2050, 10, 29)).toNow(); // 30 years ago

Jiffy.now().startOf(Unit.hour).toNow(); // in 9 minutes
```

You can also omit returning the prefix and suffix like `in` and `ago`.

```dart
Jiffy.parse('2007-01-29').toNow(withPrefixAndSuffix: false); // 14 years
```

### Time to X
This works opposite to the `from()` method. 
This method is used to get the relative time to a specific date time.
```dart
var jiffy1 = Jiffy.parse('2007-01-28');
var jiffy2 = Jiffy.parse('2017-01-29');

jiffy1.to(jiffy2); // in a day
```

You can also omit returning the prefix and suffix like `in` and `ago`.

```dart
var jiffy1 = Jiffy.parse('2007-01-28');
var jiffy2 = Jiffy.parse('2017-01-29');

jiffy1.to(jiffy2, withPrefixAndSuffix: false); // a day
```
### Difference
Used to get the difference between two Jiffy date times.
```dart
// By default, diff method, get the difference in microseconds
var jiffy1 = Jiffy.parse('2017-1-29');
var jiffy2 = Jiffy.parse('2017-1-28');

jiff1.diff(jiffy2); // 86400000000
```
You can get the difference in another unit of measurement. 
The units that are available are,

`[ Unit.microsecond, Unit.millisecond, Unit.second, Unit.minute, 
Unit.hour, Unit.day, Unit.week, Unit.month, Unit.year ]`
```dart
Jiffy.parseFromList([2007, 1, 28])
  .diff(Jiffy.parseFromList([2017, 1, 29]), unit: Unit.day); // -3654
```

Also by default `diff` will truncate the result to return a whole number. 
To get decimal numbers, just pass a third param `asFloat` to `false`.
```dart
var jiffy1 = Jiffy.parse('2008-10', pattern: 'yyyy-MM');
var jiffy2 = Jiffy.parse('2007-01', pattern: 'yyyy-MM');

jiffy1.diff(jiffy2, unit: Unit.year); // 1
jiffy1.diff(jiffy2, unit: Unit.year, asFloat: false); // 1.75
```

# Query
### Is Before
Check if date time is before another date time.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-10-21");

jiffy1.isBefore(jiffy2); // true
```

You can also check in terms of units of measurement. 
The below example checks if year is before.
```dart
var jiffy1 = Jiffy.parseFromList([2020, 10, 20]);

var jiffy2 = Jiffy.parse("2020-12-31");
var jiffy3 = Jiffy.parse("2021-01-01");

jiffy1.isBefore(jiffy2, unit: Unit.year); // false
jiffy1.isBefore(jiffy3, unit: Unit.year); // true
```

### Is Same
Check if date time is same with another date time.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-10-20");

jiffy1.isSame(jiffy2); // true
```

You can also check in terms of units of measurement. 
The below example checks if years are the same.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");

var jiffy2 = Jiffy.parse("2020-12-31");
var jiffy3 = Jiffy.parse("2021-01-01");

jiffy1.isSame(jiffy2, unit: Unit.year); // false
jiffy1.isSame(jiffy3, unit: Unit.year); // true
```

### Is After
Check if date time is after another date time.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");
var jiffy2 = Jiffy.parse("2021-10-19");

jiffy1.isAfter(jiffy2); // true
```

You can also check in terms of units of measurement. 
The below example checks if year is after.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");

var jiffy2 = Jiffy.parse("2021-01-01");
var jiffy3 = Jiffy.parse("2020-12-31");

jiffy1.isAfter(jiffy2, Unit.year); // false
jiffy1.isAfter(jiffy3, Unit.year); // true
```

### Is Same or Before
Check if date time is same or before with another date time.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");

var jiffy2 = Jiffy.parse("2020-12-31");
var jiffy3 = Jiffy.parse("2021-12-31");
var jiffy4 = Jiffy.parse("2022-01-01");

jiffy1.isSameOrBefore(jiffy2, Unit.year); // false
jiffy1.isSameOrBefore(jiffy3, Unit.year); // true
jiffy1.isSameOrBefore(jiffy4, Unit.year); // true
```
### Is Same or After
Check if date time is same or after with another date time.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");

var jiffy2 = Jiffy.parse("2022-12-31");
var jiffy3 = Jiffy.parse("2021-01-01");
var jiffy4 = Jiffy.parse("2020-12-31");

jiffy1.isSameOrAfter(jiffy2, Unit.year); // false
jiffy1.isSameOrAfter(jiffy3, Unit.year); // true
jiffy1.isSameOrAfter(jiffy4, Unit.year); // true
```

### Is Between
Check if a date time is between two date times.
```dart
var jiffy1 = Jiffy.parse("2021-10-20");

var jiffy2 = Jiffy.parse("2021-01-01");
var jiffy3 = Jiffy.parse("2023-01-01");

var jiffy4 = Jiffy.parse("2020-12-31");
var jiffy5 = Jiffy.parse("2023-01-01");

jiffy1.isBetween(jiffy2, jiffy3, Unit.year); // false
jiffy1.isBetween(jiffy4, jiffy5, Unit.year); // true
```

### Is Local Date Time
Check if date time is local.
```dart
var jiffy = Jiffy.now().toLocal();
jiffy.isLocal; // true
jiffy.toUtc().isLocal; // false
```

### Is UTC Date Time
Check if date time is UTC.
```dart
var jiffy = Jiffy.now().toUtc();
jiffy.isUtc; // true
jiffy.toLocal().isUtc; // false
```

### Is LeapYear
Check if date time is a leap year or not.
```dart
Jiffy.parse("2019", pattern: "yyyy").isLeapYear; // false
Jiffy.parse("2016", pattern: "yyyy").isLeapYear; // true
```

# Locale Support

Below are the locales that are supported in Jiffy. More can be added.

| Locale      | Locale Code                                                        |
|-------------|--------------------------------------------------------------------|
| English     | en / en_us / en_sg / en_au / en_ca / en_gb / en_ie / en_il / en_nz |
| Spanish     | es / es_us / es_do                                                 |
| French      | fr / fr_ch / fr_ca                                                 |
| Chinese     | zh / zh_cn / zh_hk / zh_tw                                         |
| Japan       | ja                                                                 |
| Korean      | ko                                                                 |
| German      | de / de_de / de_at / de_ch                                         |
| Italian     | it / it_ch                                                         |
| Hindi       | hi                                                                 |
| Bangladesh  | bn                                                                 |
| Portuguese  | pt / pt_br                                                         |
| Indonesian  | id                                                                 |
| Russian     | ru                                                                 |
| Swedish     | sv                                                                 |
| Ukrainian   | uk                                                                 |
| Arabic      | ar / ar_ly / ar_dz / ar_kw / ar_sa / ar_ma /_tn                    |
| Hungarian   | hu / hu_hu                                                         |
| Polish      | pl                                                                 |
| Turkish     | tr                                                                 |
| Norwegian   | nb                                                                 |
| Persian     | fa                                                                 |
| Azerbaijani | az                                                                 |
| Dutch       | nl                                                                 |
| Thailand    | th                                                                 |
| Slovak      | sk                                                                 |
| Czech       | cs                                                                 |

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

## Getting the locale code
```dart
var localeCode = Jiffy.now().localeCode; // eu_us
```
## Getting a list of supported locales
```dart
final supportLocales = Jiffy.getSupportedLocales(); // ['en_us', 'en', 'fr', ...]
```
