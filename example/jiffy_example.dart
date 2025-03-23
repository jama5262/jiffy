import 'package:jiffy/jiffy.dart';

void main() {
  // Parsing and formatting date time
  // Parsing from string
  Jiffy.parse('1997/09/23').format(); // 1997-09-23T00:00:00.000
  // Parsing from string and pattern
  Jiffy.parse('Sep 97, 23rd', pattern: 'MMM yy, do')
      .yMMMMEEEEd; // Tuesday, September 23, 1997
  // Parsing from a dart DateTime object
  Jiffy.parseFromDateTime(DateTime(1997, 9, 23)).yMMMM; // September 1997
  // Parsing from a date time list
  Jiffy.parseFromList([1997, 9, 23]).MMMEd; // Tue, Sep 23
  // Parsing from a date time map
  Jiffy.parseFromMap({Unit.year: 1997, Unit.month: 9, Unit.day: 23}).format(
      pattern: '[The date is] do, MMM yyyy'); // The date is 23rd, Sep 1997

  // Relative date time
  // From X
  Jiffy.parse('1997/09/23').from(Jiffy.parse('2002/10/26')); // 5 years ago
  // From Now
  Jiffy.parse('1997/09/23').fromNow(); // 25 years ago

  // To X
  Jiffy.parse('1997/09/23').to(Jiffy.parse('2002/10/26')); // in 5 years
  // To Now
  Jiffy.parse('1997/09/23').toNow(); // in 25 years

  // Manipulating date time
  // Adding to date time using dart Duration object
  Jiffy.parse('1997/09/23')
      .addDuration(Duration(days: 5, hours: 6))
      .format(); // 1997-09-28T06:00:00.000
  // Adding to date time
  Jiffy.parse('1997/09/23')
      .add(years: 2, months: 3, days: 5)
      .yMMMMd; // December 28, 1999

  // Subtracting from date time using dart Duration object
  Jiffy.parse('1997/09/23')
      .subtractDuration(Duration(days: 5, hours: 6))
      .format(); // 1997-09-17T18:00:00.000
  // Subtracting from date time
  Jiffy.parse('1997/09/23')
      .subtract(years: 2, months: 3, days: 5)
      .yMMMMd; // June 18, 1995

  // Getting the start of date time
  Jiffy.parse('1997/09/23')
      .startOf(Unit.year)
      .yMMMMEEEEd; // Wednesday, January 1, 1997
  Jiffy.parse('1997/09/23')
      .startOf(Unit.month)
      .yMMMMEEEEd; // Monday, September 1, 1997
  Jiffy.parse('1997/09/23')
      .startOf(Unit.week)
      .yMMMMEEEEd; // Sunday, September 21, 1997
  // Getting the end of date time
  Jiffy.parse('1997/09/23')
      .endOf(Unit.year)
      .yMMMMEEEEd; // Wednesday, December 31, 1997
  Jiffy.parse('1997/09/23')
      .endOf(Unit.month)
      .yMMMMEEEEd; // Tuesday, September 30, 1997
  Jiffy.parse('1997/09/23')
      .endOf(Unit.week)
      .yMMMMEEEEd; // Saturday, September 27, 1997

  // Querying date time
  // Is before date time
  Jiffy.parse('1997/9/23').isBefore(Jiffy.parse('1997/9/24')); // true
  Jiffy.parse('1997/9/23').isBefore(Jiffy.parse('1997/9/20')); // false
  // Is after date time
  Jiffy.parse('1997/9/23').isAfter(Jiffy.parse('1997/9/24')); // false
  Jiffy.parse('1997/9/23').isAfter(Jiffy.parse('1997/9/20')); // true
  // Is same as date time
  Jiffy.parse('1997/9/23').isSame(Jiffy.parse('1997/9/24')); // false
  Jiffy.parse('1997/9/23').isSame(Jiffy.parse('1997/9/23')); // true
  // Is same or before date time
  Jiffy.parse('1997/9/23').isSameOrBefore(Jiffy.parse('1997/9/23')); // true
  Jiffy.parse('1997/9/23').isSameOrBefore(Jiffy.parse('1997/9/20')); // false
  Jiffy.parse('1997/9/23').isSameOrBefore(Jiffy.parse('1997/9/24')); // true
  // Is same or after date time
  Jiffy.parse('1997/9/23').isSameOrAfter(Jiffy.parse('1997/9/23')); // true
  Jiffy.parse('1997/9/23').isSameOrAfter(Jiffy.parse('1997/9/20')); // true
  Jiffy.parse('1997/9/23').isSameOrAfter(Jiffy.parse('1997/9/24')); // false
  // Is between to date times
  Jiffy.parse('1997/9/23')
      .isBetween(Jiffy.parse('1997/9/20'), Jiffy.parse('1997/9/24')); // true
  Jiffy.parse('1997/9/19')
      .isBetween(Jiffy.parse('1997/9/20'), Jiffy.parse('1997/9/24')); // false
}
