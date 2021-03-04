## 4.0.0

### Major Changes

1. Implemented null safety
2. Jiffy cloning
   ```dart
   var jiffy1 = Jiffy();
   var jiffy2 = jiffy1.clone();
   // or 
   var jiffy1 = Jiffy();
   var jiffy2 = Jiffy(jiffy1);
   ```
3. Bug fix `diff()` function
4. All methods return `Jiffy`, except `utc()` and `local()` functions
5. Added Persian `fa` locale contributed by [mozaffari](https://github.com/mozaffari)
6. Added Norwegian `nb` locale contributed by [Yilmaz Guleryuz](https://github.com/zeusbaba)
7. Added `de_DE` mapping locale contributed by [Sebastian Rutofski](https://github.com/SebRut)

_**More changes to come, not yet ready for publish**_

## 3.0.1

### Patch changes

1. Fixed `Undefined name 'Units'` bug
2. Swedish locale `sv` contributed by [Erik Carlsson](https://github.com/ercadev)

## 3.0.0

### Major changes

1. Unit of time are now in enums. Examples, previously `startOf("day")` can now be set as `startOf(Units.DAY)`
String escape changes to use square braces `[]`. Examples, previously
2. `Jiffy().format("yyyy 'escaped' yyyy");` and now updated to `Jiffy().format("yyyy [escaped] yyyy");`
3. Added Indonsia local `id` by [ampersanda](https://github.com/ampersanda) and Turkish local `tr` by [iozozturk](https://github.com/iozozturk)


## 2.2.0

### Minor Changes

1.  Added more string parsing functionality. See below

```
Jiffy("1995/12/25"); // A calendar date part separated by slash "/"
Jiffy("19951225"); // Basic (short) full date
Jiffy("1995-12-25 12:00:00.000"); // An hour, minute, second, and millisecond time part
Jiffy("1995-12-25T12:00:00.000"); ISO dart format
Jiffy("1995-12-25T12:00:00.000Z"); ISO dart format (UTC)
```
2. Added support to Polish locale `pl` added by [leszekkrol](https://github.com/leszekkrol)

## 2.1.2

### Patch Changes

1. Bug fix to support `startOf` and `endOf` for locales
2. Bug fix on week getter by [MrCasCode](https://github.com/MrCasCode)

## 2.1.1

### Patch Changes

Previously

`Jiffy([2014, 4, 23]).format("EEEE MMMM do, yyyy"); // Wednesday April 23o, 2014`

Updated

`Jiffy([2014, 4, 23]).format("EEEE MMMM do, yyyy"); // Wednesday April 23rd, 2014`

## 2.1.0

### Minor Changes

1. Ordinal date parsing and formating
In Jiffy you can now parse and format with ordinal date. e.g
```dart
Jiffy().format("MMM do yyyy"); // Oct 19th 2019
```
2. It also supports locales for the following

`"en", "es", "fr", "frch", "frca", "it", "itch", "ja", "ko", "pt", "ptbr", "zh", "zhcn", "zhhk", "zhtw", "de", "deat", "dech"`

3. Added `daysInMonth` method to get number of days for specific months .e.g
```dart
Jiffy([2016, 1]).daysInMonth; // 31
Jiffy([2016, 2]).daysInMonth; // 28
Jiffy([2017, 2]).daysInMonth; // 29
```

## 2.0.0

### Major Changes

1. Added params to add and subtract methods by [yongjhih](https://github.com/yongjhih)
Example
```dart
Jiffy().add(days: 1);
Jiffy().add(years: 2, months: 1, duration: Duration(days: 1, hours: 30));
```

## 1.1.0

### Minor Changes

1. Add more functionality to parsing. These are
- Array parsing `Jiffy([2019, 10, 21]);`
- Map parsing `Jiffy({"year": 2019, "month": 10});`
- Dart DateTime parsing `Jiffy(DateTime.now());`
- String parsing `Jiffy("2019-10-21");`

## 1.0.0

1. Launch 🚀
