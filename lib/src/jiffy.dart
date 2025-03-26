import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as date_intl;

import './default_display.dart';
import './display.dart';
import './enums/start_of_week.dart';
import './enums/unit.dart';
import './getter.dart';
import './locale/jiffy_locale.dart';
import './manipulator.dart';
import './parser.dart';
import './query.dart';
import './utils/jiffy_exception.dart';
import './global/global_ordinals.dart';
import './global/global_relative_date_time.dart';
import './global/global_start_of_week.dart';
import './locale/ordinals.dart';
import './locale/relative_date_time.dart';
import './utils/verify_locale.dart';

/// [Jiffy](https://github.com/jama5262/jiffy) is a
/// Flutter (Android, IOS and Web) date time package for
/// parsing, manipulating, querying and formatting dates
class Jiffy {
  late final Getter _getter;
  late final DefaultDisplay _defaultDisplay;
  late final Parser _parser;
  late final Manipulator _manipulator;
  late final Query _query;
  late final Display _display;

  late JiffyLocale _locale;
  late final DateTime _dateTime;

  /// Sets the locale for this [Jiffy] instance based on the given [locale] string.
  ///
  /// If not provided, the default locale is `en_US`
  ///
  /// The [locale] parameter should be a valid string representation of a
  /// supported locale, such as `'en_US'` or `'fr_FR'`. If the provided locale
  /// is not supported, a [JiffyException] will be thrown.
  ///
  /// Example:
  /// ```dart
  /// await Jiffy.setLocale('en_US');
  /// await Jiffy.setLocale('en_US', startOfWeek: StartOfWeek.monday);
  /// ```
  ///
  /// Throws:
  /// - [JiffyException] if the locale is not supported.
  /// - [JiffyException] if an [ArgumentError] occurs during the process.
  ///
  /// Optional Parameters:
  /// - [startOfWeek]: The first day of the week (e.g., `StartOfWeek.sunday`).
  ///   If not provided, the default start of the week for the locale will be used.
  /// - [ordinals]: A custom ordinal rule set for the locale.
  ///   (e.g Ordinals(first: 'st', second: 'nd', third: 'rd', nth: 'th')).
  ///   If not provided, the default ordinal rules will be used.
  /// - [relativeDateTime]: Custom relative date-time formatting settings.
  ///   (e.g, EnRelativeDateTime()). If not provided, the default relative
  ///   date-time settings will be used.
  static Future<void> setLocale(
    String locale, {
    StartOfWeek? startOfWeek,
    Ordinals? ordinals,
    RelativeDateTime? relativeDateTime,
  }) async {
    try {
      final supportedLocale = verifyLocale(locale);
      Intl.defaultLocale = supportedLocale.NAME;
      await date_intl.initializeDateFormatting();
      defaultStartOfWeek = startOfWeek;
      defaultOrdinals = ordinals;
      defaultRelativeDateTime = relativeDateTime;
    } on ArgumentError catch (e) {
      throw JiffyException(e.message);
    }
  }

  /// Retrieves a list of supported locales in Jiffy.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final supportLocales = Jiffy.getSupportedLocales();
  /// print(supportLocales); // ['en_us', 'en', 'fr', ...]
  /// ```
  static List<String> getSupportedLocales() => getSupportedIntlLocales();

  /// Constructs a new [Jiffy] instance by parsing a [String].
  ///
  /// If [pattern] is not provided, [string] must be in one of the following
  /// formats:
  ///
  /// * `'1997-09-23'`
  /// * `'1997/09/23'`
  /// * `'1997-09-23 11:18:12.946621'`
  /// * `'1997-09-23T11:18:12.947031'`
  ///
  /// If [pattern] is provided, [string] should match the
  /// specified pattern format.
  ///
  /// This method also includes an optional [isUtc] parameter:
  /// - If [isUtc] is `true`, the parsed date-time will be treated as UTC.
  /// - If [isUtc] is `false` (default), the parsed date-time will be
  /// treated as local time.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.parse('1997-09-23');
  /// final jiffy2 = Jiffy.parse('1997 Sep 23th', pattern: 'yyyy MMM do');
  /// final jiffy3 = Jiffy.parse('1997 Sep 23th', isUtc: true);
  /// ```
  ///
  /// Throws a [JiffyException] if the input [string] cannot be parsed.
  factory Jiffy.parse(String string, {String? pattern, bool isUtc = false}) {
    return Jiffy._internal(string, pattern: pattern, isUtc: isUtc);
  }

  /// Constructs a new [Jiffy] instance from a [DateTime] object.
  ///
  /// The resulting [Jiffy] object will represent the same date and time as
  /// the provided [dateTime] object.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parseFromDateTime(DateTime.now());
  /// ```
  factory Jiffy.parseFromDateTime(DateTime dateTime) {
    return Jiffy._internal(dateTime);
  }

  /// Constructs a new [Jiffy] instance from an existing [Jiffy] object.
  ///
  /// The resulting [Jiffy] object will have the same date and time values as
  /// the provided [Jiffy] object. This can be useful if you need to clone a
  /// new [Jiffy] object based on an existing one.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.now();
  /// final jiffy2 = Jiffy.parseFromJiffy(jiffy1);
  /// ```
  ///
  /// Alternatively, you can use the `clone` method of a [Jiffy] object to
  /// create a new [Jiffy] object.
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.now();
  /// final jiffy2 = jiffy1.clone();
  /// ```
  factory Jiffy.parseFromJiffy(Jiffy jiffy) {
    return Jiffy._internal(jiffy);
  }

  /// Constructs a [Jiffy] instance from a list of integers representing a
  /// date and time.
  ///
  /// The [list] parameter should be a list of integers in the following order:
  ///
  /// `[year, month, day, hour, minute, second, millisecond, microsecond]`.
  ///
  /// At least `year` should be provided. Any other values that are not
  /// provided will default to their minimum value (For example, day and month
  /// will default to 1 and, hour, minute, second, millisecond, and microsecond
  /// will default to 0 if not provided).
  ///
  /// This method also includes an optional [isUtc] parameter:
  /// - If [isUtc] is `true`, the parsed date-time will be treated as UTC.
  /// - If [isUtc] is `false` (default), the parsed date-time will be
  /// treated as local time.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.parseFromList([1997, 9, 23]);
  /// final jiffy2 = Jiffy.parseFromList([1997, 9, 23], isUtc: true);
  /// ```
  /// Throws a [JiffyException] if the input [list] is invalid.
  factory Jiffy.parseFromList(List<int> list, {bool isUtc = false}) {
    return Jiffy._internal(list, isUtc: isUtc);
  }

  /// Constructs a [Jiffy] instance from a [map] of date and time values.
  ///
  /// The [map] parameter should be a map of [Unit] values to integer values.
  /// The [Unit] enum specifies the different date and time units that can be
  /// provided in the map, including year, month, day, hour, minute, second,
  /// millisecond, and microsecond.
  ///
  /// If any of the other keys ('UNIT.YEAR', 'UNIT.MONTH', 'UNIT.DAY',
  /// 'UNIT.HOUR', 'UNIT.MINUTE', 'UNIT.SECOND', 'UNIT.MILLISECOND',
  /// 'UNIT.MICROSECOND') are not provided, they default to the current
  /// date time value.
  ///
  /// This method also includes an optional [isUtc] parameter:
  /// - If [isUtc] is `true`, the parsed date-time will be treated as UTC.
  /// - If [isUtc] is `false` (default), the parsed date-time will be
  /// treated as local time.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.parseFromMap(
  ///   {
  ///     Unit.YEAR: 1997,
  ///     Unit.MONTH: 9,
  ///     Unit.DAY: 23,
  ///   }
  /// );
  /// final jiffy2 = Jiffy.parseFromMap(
  ///   {
  ///     Unit.YEAR: 1997,
  ///     Unit.MONTH: 9,
  ///     Unit.DAY: 23,
  ///   },
  ///   isUtc: true
  /// );
  /// ```
  ///
  /// Throws a [JiffyException] if the input [map] is empty.
  factory Jiffy.parseFromMap(Map<Unit, int> map, {bool isUtc = false}) {
    return Jiffy._internal(map, isUtc: isUtc);
  }

  /// Constructs a [Jiffy] instance from a [microsecondsSinceEpoch] of type
  /// [int].
  ///
  /// The [microsecondsSinceEpoch] represents the number of microseconds since
  /// epoch time, which is `January 1, 1970, 00:00:00 UTC`.
  ///
  /// This method also includes an optional [isUtc] parameter:
  /// - If [isUtc] is `true`, the parsed date-time will be treated as UTC.
  /// - If [isUtc] is `false` (default), the parsed date-time will be
  /// treated as local time.
  ///
  /// ```dart
  /// final now = DateTime.now();
  /// final jiffy1 = Jiffy.parseFromMicrosecondsSinceEpoch(now.microsecondsSinceEpoch);
  /// ```
  factory Jiffy.parseFromMicrosecondsSinceEpoch(int microsecondsSinceEpoch,
      {bool isUtc = false}) {
    return Jiffy._internal(DateTime.fromMicrosecondsSinceEpoch(
        microsecondsSinceEpoch,
        isUtc: isUtc));
  }

  /// Constructs a [Jiffy] instance from a [millisecondsSinceEpoch] of type
  /// [int].
  ///
  /// The [millisecondsSinceEpoch] represents the number of milliseconds since
  /// epoch time, which is `January 1, 1970, 00:00:00 UTC`.
  ///
  /// This method also includes an optional [isUtc] parameter:
  /// - If [isUtc] is `true`, the parsed date-time will be treated as UTC.
  /// - If [isUtc] is `false` (default), the parsed date-time will be
  /// treated as local time.
  ///
  /// ```dart
  /// final now = DateTime.now();
  /// final jiffy = Jiffy.parseFromMillisecondsSinceEpoch(now.millisecondsSinceEpoch);
  /// ```
  factory Jiffy.parseFromMillisecondsSinceEpoch(int millisecondsSinceEpoch,
      {bool isUtc = false}) {
    return Jiffy._internal(DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch,
        isUtc: isUtc));
  }

  /// Returns a [Jiffy] instance representing the current date and time.
  ///
  /// ```dart
  /// final now = Jiffy.now();
  /// ```
  factory Jiffy.now() => Jiffy._internal(DateTime.now());

  Jiffy._internal(var input, {String? pattern, bool isUtc = false}) {
    _initializeDependencies();
    _initializeLocale();
    _initializeDateTime(input, pattern, isUtc);
  }

  void _initializeDependencies() {
    _getter = Getter();
    _defaultDisplay = DefaultDisplay();
    _parser = Parser(_getter);
    _manipulator = Manipulator(_getter);
    _query = Query(_getter, _manipulator);
    _display = Display(_getter, _manipulator, _query);
  }

  void _initializeLocale() {
    var currentLocale = Intl.getCurrentLocale();
    _locale = JiffyLocale(
        code: currentLocale,
        startOfWeek: getStartOfWeek(currentLocale),
        ordinals: getOrdinals(currentLocale),
        relativeDateTime: getRelativeDateTime(currentLocale));
  }

  void _initializeDateTime(var input, String? pattern, bool isUtc) {
    if (input is DateTime) {
      _dateTime = _getter.dateTime(input);
    } else if (input is Jiffy) {
      _dateTime = input.dateTime;
    } else if (input is String) {
      _dateTime = _parser.fromString(input, pattern, _locale, isUtc);
    } else if (input is List<int>) {
      _dateTime = _parser.fromList(input, isUtc);
    } else if (input is Map<Unit, int>) {
      _dateTime = _parser.fromMap(input, isUtc);
    } else {
      throw JiffyException('Could not parse input: `$input`, '
          'only String, List, Map, DateTime and Jiffy are allowed');
    }
  }

  /// Returns the [JiffyLocale].
  JiffyLocale get locale => _locale;

  /// Creates and returns a new [Jiffy] instance with the same date and time
  /// as the original instance.
  ///
  /// The cloned instance operates independently, meaning any modifications
  /// to it will not affect the original.
  ///
  /// ```dart
  /// final originalJiffy = Jiffy();
  /// final newJiffy = originalJiffy.clone();
  /// ```
  Jiffy clone() => Jiffy.parseFromDateTime(dateTime);

  Jiffy _clone(DateTime dateTime) =>
      Jiffy.parseFromDateTime(_getter.dateTime(dateTime));

  /// Returns a new [DateTime] instance of the [Jiffy] object.
  DateTime get dateTime => _getter.dateTime(_dateTime);

  /// Returns the microsecond ranging from 0 to 999.
  int get microsecond => _getter.microsecond(dateTime);

  /// Returns the number of microseconds since epoch time
  /// `January 1, 1970, 00:00:00 UTC`.
  int get microsecondsSinceEpoch => _getter.microsecondsSinceEpoch(dateTime);

  /// Returns the millisecond ranging from 0 to 999.
  int get millisecond => _getter.millisecond(dateTime);

  /// Returns the number of milliseconds since epoch time
  /// `January 1, 1970, 00:00:00 UTC`.
  int get millisecondsSinceEpoch => _getter.millisecondsSinceEpoch(dateTime);

  /// Returns the second ranging from 0 to 59.
  int get second => _getter.second(dateTime);

  /// Returns the minute ranging from 0 to 59.
  int get minute => _getter.minute(dateTime);

  /// Returns the hour ranging from 0 to 23.
  int get hour => _getter.hour(dateTime);

  /// Returns the date ranging from 1 to 31.
  int get date => _getter.date(dateTime);

  /// Returns the day of the week based on the locale's start of the week.
  ///
  /// The returned value is an integer between 1 and 7, where:
  /// - `1` corresponds to the start of the week (which could be Saturday,
  /// Sunday, or Monday depending on the locale).
  ///
  /// By default, the calculation of the day of the week follows the locale
  /// set via [Jiffy.setLocale(locale)].
  /// If no specific locale is set, the default locale `en_US` is used, where
  /// Sunday is considered the first day of the week.
  int get dayOfWeek => _getter.dayOfWeek(dateTime, _locale.startOfWeek);

  /// Returns the number of days in the month.
  int get daysInMonth => _getter.daysInMonth(dateTime);

  /// Returns the day of the year.
  ///
  /// The returned value is an integer between 1 and 366, inclusive, where 1
  /// represents January 1st of the year and 366 represents December 31st of a
  /// leap year.
  int get dayOfYear => _getter.dayOfYear(dateTime, _locale);

  /// Returns the week number of the year based on the current [JiffyLocale]'s
  /// defined start of the week.
  ///
  /// The week number ranges from 1 to 53, where week 1 is the first week
  /// containing at least [DateTime.daysPerWeek] days in the new year.
  ///
  /// Week calculation varies by locale:
  /// - In the United States, weeks typically start on Sunday. For example,
  ///   if the date falls on a Monday in the second week of the year (8 days
  ///   after January 1st), this method returns `2`.
  /// - In France, where weeks start on Monday, a date falling on a Sunday in
  ///   the first week of the year (6 days after January 1st) would return `1`.
  int get weekOfYear => _getter.weekOfYear(dateTime, _locale);

  /// Returns the month of the year ranging from 1 to 12.
  int get month => _getter.month(dateTime);

  /// Returns the quarter on the year ranging from 1 to 4.
  int get quarter => _getter.quarterOfYear(dateTime, _locale);

  /// Returns the year.
  int get year => _getter.year(dateTime);

  /// Adds the provided [duration] to the current [Jiffy] instance's date
  /// and time, and returns a new [Jiffy] instance with the updated value.
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parseFromList([1997, 9, 23]);
  /// final updatedJiffy = jiffy.addDuration(Duration(days: 10));
  /// print(updatedJiffy.yMMMMd);
  /// // output: 'October 3, 1997'
  /// ```
  Jiffy addDuration(Duration duration) {
    final dateTime = _manipulator.addDuration(this.dateTime, duration);
    return _clone(dateTime);
  }

  /// Adds date and time to the current [Jiffy] instance and returns a
  /// new [Jiffy] instance with the result.
  ///
  /// The [microseconds], [milliseconds], [seconds], [minutes], [hours],
  /// [days], [weeks], [months], and [years] arguments allow you to specify
  /// additional time to add to the current [Jiffy] instance. These arguments
  /// are all optional and default to 0.
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parse(
  ///   '1997-09-23 13:37:00',
  ///   pattern: 'yyyy-MM-dd HH:mm:ss'
  /// );
  /// final nextHour = jiffy.add(hours: 1);
  /// print(nextHour.format('yyyy-MM-dd HH:mm:ss'));
  /// // output: '1997-09-23 14:37:00'
  /// ```
  Jiffy add({
    int microseconds = 0,
    int milliseconds = 0,
    int seconds = 0,
    int minutes = 0,
    int hours = 0,
    int days = 0,
    int weeks = 0,
    int months = 0,
    int years = 0,
  }) {
    final dateTime = _manipulator.add(this.dateTime, microseconds, milliseconds,
        seconds, minutes, hours, days, weeks, months, years);
    return _clone(dateTime);
  }

  /// Subtracts the provided [duration] from the current [Jiffy] instance's
  /// date and time, and returns a new [Jiffy] instance with the updated value.
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parseFromList([1997, 9, 23]);
  /// final updatedJiffy = jiffy.subtractDuration(Duration(days: 10));
  /// print(updatedJiffy.yMMMMd);
  /// // output: 'September 13, 1997'
  /// ```
  Jiffy subtractDuration(Duration duration) {
    final dateTime = _manipulator.subtractDuration(this.dateTime, duration);
    return _clone(dateTime);
  }

  /// Subtracts the date and time from the current [Jiffy] instance and
  /// returns a new [Jiffy] instance with the result.
  ///
  /// The [microseconds], [milliseconds], [seconds], [minutes], [hours],
  /// [days], [weeks], [months], and [years] arguments allow you to specify
  /// subtractive time to subtract from the current [Jiffy] instance.
  /// These arguments are all optional and default to 0.
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parse(
  ///   '1997-09-23 13:37:00',
  ///   pattern: 'yyyy-MM-dd HH:mm:ss'
  /// );
  /// final previousHour = jiffy.subtract(hours: 1);
  /// print(previousHour.format('yyyy-MM-dd HH:mm:ss'));
  /// // output: '1997-09-23 12:37:00'
  /// ```
  Jiffy subtract({
    int microseconds = 0,
    int milliseconds = 0,
    int seconds = 0,
    int minutes = 0,
    int hours = 0,
    int days = 0,
    int weeks = 0,
    int months = 0,
    int years = 0,
  }) {
    final dateTime = _manipulator.subtract(this.dateTime, microseconds,
        milliseconds, seconds, minutes, hours, days, weeks, months, years);
    return _clone(dateTime);
  }

  /// Returns a new [Jiffy] instance representing the start of the specified
  /// [unit] of time
  ///
  /// [unit] must be one of the values in [Unit] enum.
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parse(
  ///   '1997-09-23 13:37:00',
  ///   pattern: 'yyyy-MM-dd HH:mm:ss'
  /// );
  /// final startOfDay = jiffy.startOf(Unit.DAY);
  /// print(startOfDay.format('yyyy-MM-dd HH:mm:ss'));
  /// // output: '1997-09-23 00:00:00'
  /// ```
  Jiffy startOf(Unit unit) {
    final dateTime =
        _manipulator.startOf(this.dateTime, unit, _locale.startOfWeek);
    return _clone(dateTime);
  }

  /// Returns a new [Jiffy] instance representing the end of the specified
  /// [unit] of time
  ///
  /// [unit] must be one of the values in [Unit] enum.
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parse(
  ///   '1997-09-23 13:37:00',
  ///   pattern: 'yyyy-MM-dd HH:mm:ss'
  /// );
  /// final startOfDay = jiffy.endOf(Unit.DAY);
  /// print(startOfDay.format('yyyy-MM-dd HH:mm:ss');
  /// // output: '1997-09-23 23:59:59'
  /// ```
  Jiffy endOf(Unit unit) {
    final dateTime =
        _manipulator.endOf(this.dateTime, unit, _locale.startOfWeek);
    return _clone(dateTime);
  }

  /// Returns a new instance of [Jiffy] with the same date and time in
  /// local time zone.
  ///
  /// If the current [Jiffy] instance is in UTC time zone, the date and time
  /// will be converted to local time zone. Otherwise, the current instance
  /// will be returned as is.
  Jiffy toLocal() {
    final dateTime = Query.isUtc(this.dateTime)
        ? _manipulator.toLocal(this.dateTime)
        : this.dateTime;
    return _clone(dateTime);
  }

  /// Returns a new instance of [Jiffy] with the same date and time in
  /// UTC time zone.
  ///
  /// If the current [Jiffy] instance is in local time zone, the date and time
  /// will be converted to UTC time zone. Otherwise, the current instance
  /// will be returned as is.
  Jiffy toUtc() {
    final dateTime = Query.isUtc(this.dateTime)
        ? this.dateTime
        : _manipulator.toUtc(this.dateTime);
    return _clone(dateTime);
  }

  /// Returns the formatted date and time string based on the provided
  /// [pattern]. If the [pattern] is not provided, the method will return
  /// the formatted date and time string in the ISO-8601 format.
  ///
  /// Example:
  ///
  /// ```dart
  /// // Formats the date and time in "dd MMM yyyy" format
  /// final jiffy = Jiffy.parseFromList([1997, 9, 23, 11, 30, 22, 123, 456]);
  /// final formattedDate = jiffy.format(pattern: 'dd MMM yyyy');
  /// print(formattedDate);
  /// // output: '23 Sep 1997'
  ///
  /// // Formats the date and time in ISO8601 format
  /// final jiffy = Jiffy.parseFromList([1997, 9, 23, 11, 30, 22, 123, 456]);
  /// final formattedDate = jiffy.format(); // No pattern passed
  /// print(formattedDate);
  /// // output: '1997-09-23T11:30:22.123456'
  /// ```
  String format({String? pattern}) {
    return pattern == null
        ? _display.formatToISO8601(dateTime)
        : _display.format(dateTime, pattern, _locale);
  }

  /// Returns the abbreviated weekday. Example: `Tue`
  String get E => _defaultDisplay.E(dateTime);

  /// Returns the weekday. Example: `Tuesday`
  // ignore: non_constant_identifier_names
  String get EEEE => _defaultDisplay.EEEE(dateTime);

  /// Returns the day of month and date. Example: `9/23`
  // ignore: non_constant_identifier_names
  String get Md => _defaultDisplay.Md(dateTime);

  /// Returns the day of month, abbreviated weekday and date.
  /// Example: `Tue, 9/23`
  // ignore: non_constant_identifier_names
  String get MEd => _defaultDisplay.MEd(dateTime);

  /// Returns the abbreviated month. Example: `Sep`
  // ignore: non_constant_identifier_names
  String get MMM => _defaultDisplay.MMM(dateTime);

  /// Returns the abbreviated month and date. Example: `Sep 23`
  // ignore: non_constant_identifier_names
  String get MMMd => _defaultDisplay.MMMd(dateTime);

  /// Returns the abbreviated month, abbreviated weekday and date.
  /// Example: `Tue, Sep 23`
  // ignore: non_constant_identifier_names
  String get MMMEd => _defaultDisplay.MMMEd(dateTime);

  /// Returns the month. Example: `September`
  // ignore: non_constant_identifier_names
  String get MMMM => _defaultDisplay.MMMM(dateTime);

  /// Returns the month and date. Example: `September 23`
  // ignore: non_constant_identifier_names
  String get MMMMd => _defaultDisplay.MMMMd(dateTime);

  /// Returns the month, weekday and date. Example: `Tuesday, September 23`
  // ignore: non_constant_identifier_names
  String get MMMMEEEEd => _defaultDisplay.MMMMEEEEd(dateTime);

  /// Returns the abbreviated quarter. Example: `Q3`
  // ignore: non_constant_identifier_names
  String get QQQ => _defaultDisplay.QQQ(dateTime);

  /// Returns the quarter. Example: `3rd quarter`
  // ignore: non_constant_identifier_names
  String get QQQQ => _defaultDisplay.QQQQ(dateTime);

  /// Returns the year and day of month. Example: `9/1997`
  String get yM => _defaultDisplay.yM(dateTime);

  /// Returns the year, of month and date. Example: `9/23/1997`
  String get yMd => _defaultDisplay.yMd(dateTime);

  /// Returns the year, of month, abbreviated weekday and date.
  /// Example: `Tue, 9/23/1997`
  String get yMEd => _defaultDisplay.yMEd(dateTime);

  /// Returns the year and abbreviated month. Example: `Sep 1997`
  String get yMMM => _defaultDisplay.yMMM(dateTime);

  /// Returns the year and abbreviated month. Example: `Sep 23, 1997`
  String get yMMMd => _defaultDisplay.yMMMd(dateTime);

  /// Returns the year, abbreviated month, date, hour and minute.
  /// Example: `Sep 23, 1997 12:11 PM`
  String get yMMMdjm => _defaultDisplay.yMMMdjm(dateTime);

  /// Returns the year, abbreviated month, abbreviated weekday and date.
  /// Example: `Tue, Sep 23, 1997`
  String get yMMMEd => _defaultDisplay.yMMMEd(dateTime);

  /// Returns the year, abbreviated month, abbreviated weekday, date, hour
  /// and minute. Example: `Tue, Sep 23, 1997 12:11 PM`
  String get yMMMEdjm => _defaultDisplay.yMMMEdjm(dateTime);

  /// Returns the year and month. Example: `September 1997`
  String get yMMMM => _defaultDisplay.yMMMM(dateTime);

  /// Returns the year, month and date. Example: `September 23, 1997`
  String get yMMMMd => _defaultDisplay.yMMMMd(dateTime);

  /// Returns the year, month, date, hour and minute.
  /// Example: `September 23, 1997 12:11 PM`
  String get yMMMMdjm => _defaultDisplay.yMMMMdjm(dateTime);

  /// Returns the year, month, weekday and date.
  /// Example: `Tuesday, September 23, 1997`
  String get yMMMMEEEEd => _defaultDisplay.yMMMMEEEEd(dateTime);

  /// Returns the year, month, weekday, date, hour and minute.
  /// Example: `Tuesday, September 23, 1997 12:11 PM`
  String get yMMMMEEEEdjm => _defaultDisplay.yMMMMEEEEdjm(dateTime);

  /// Returns the year and abbreviated quarter. Example: `Q3 1997`
  String get yQQQ => _defaultDisplay.yQQQ(dateTime);

  /// Returns the year and quarter. Example: `3rd quarter 1997`
  String get yQQQQ => _defaultDisplay.yQQQQ(dateTime);

  /// Returns 24 hour and minute. Example: `12`
  String get H => _defaultDisplay.H(dateTime);

  /// Returns 24 hour and minute. Example: `12:11`
  // ignore: non_constant_identifier_names
  String get Hm => _defaultDisplay.Hm(dateTime);

  /// Returns 24 hour, minute and second. Example: `12:11:22`
  // ignore: non_constant_identifier_names
  String get Hms => _defaultDisplay.Hms(dateTime);

  /// Returns 12 hour. Example: `12 PM`
  String get j => _defaultDisplay.j(dateTime);

  /// Returns 12 hour and minute. Example: `12:11 PM`
  String get jm => _defaultDisplay.jm(dateTime);

  /// Returns 12 hour, minute and seconds. Example: `12:11:22 PM`
  String get jms => _defaultDisplay.jms(dateTime);

  /// Returns a string representation of current [Jiffy]'s instance relative
  /// from [jiffy]'s date and time, with optional [withPrefixAndSuffix] flag
  /// to include prefix and suffix like "in" or "ago".
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// final jiffy2 = Jiffy.parseFromDateTime(DateTime(2023, 2, 1));
  /// print(jiffy1.from(jiffy2));
  /// // output: a month ago
  /// ```
  ///
  /// Example without returning prefix and suffix:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// final jiffy2 = Jiffy.parseFromDateTime(DateTime(2023, 2, 1));
  /// print(jiffy1.from(jiffy2, withPrefixAndSuffix: false));
  /// // output: a month
  /// ```
  ///
  /// If [withPrefixAndSuffix] is `true` (default), the output string will
  /// include prefix and suffix words like "in" or "ago". Otherwise, only
  /// the relative time difference string will be returned.
  String from(Jiffy jiffy, {bool withPrefixAndSuffix = true}) {
    return _display.fromAsRelativeDateTime(
        dateTime, jiffy.dateTime, _locale, withPrefixAndSuffix);
  }

  /// Returns a string representation of current [Jiffy]'s instance relative
  /// from current date and time, with optional [withPrefixAndSuffix] flag
  /// to include prefix and suffix like "in" or "ago".
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// print(jiffy.fromNow());
  /// // output: a month ago
  /// ```
  ///
  /// Example without returning prefix and suffix:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// print(jiffy.fromNow(withPrefixAndSuffix: false));
  /// // output: a month
  /// ```
  ///
  /// If [withPrefixAndSuffix] is `true` (default), the output string will
  /// include prefix and suffix words like "in" or "ago". Otherwise, only
  /// the relative time difference string will be returned.
  String fromNow({bool withPrefixAndSuffix = true}) =>
      from(Jiffy.now(), withPrefixAndSuffix: withPrefixAndSuffix);

  /// Returns a string representation of current [Jiffy]'s instance relative
  /// to [jiffy]'s date and time, with optional [withPrefixAndSuffix] flag
  /// to include prefix and suffix like "in" or "ago".
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// final jiffy2 = Jiffy.parseFromDateTime(DateTime(2023, 2, 1));
  /// print(jiffy1.to(jiffy2));
  /// // output: in a month
  /// ```
  ///
  /// Example without returning prefix and suffix:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// final jiffy2 = Jiffy.parseFromDateTime(DateTime(2023, 2, 1));
  /// print(jiffy1.to(jiffy2, withPrefixAndSuffix: false));
  /// // output: a month
  /// ```
  ///
  /// If [withPrefixAndSuffix] is `true` (default), the output string will
  /// include prefix and suffix words like "in" or "ago". Otherwise, only
  /// the relative time difference string will be returned.
  String to(Jiffy jiffy, {bool withPrefixAndSuffix = true}) {
    return _display.toAsRelativeDateTime(
        dateTime, jiffy.dateTime, _locale, withPrefixAndSuffix);
  }

  /// Returns a string representation of current [Jiffy]'s instance relative
  /// to current date and time, with optional [withPrefixAndSuffix] flag
  /// to include prefix and suffix like "in" or "ago".
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// print(jiffy.toNow());
  /// // output: in a month
  /// ```
  ///
  /// Example without returning prefix and suffix:
  ///
  /// ```dart
  /// final jiffy = Jiffy.parseFromDateTime(DateTime(2023, 1, 1));
  /// print(jiffy.toNow(withPrefixAndSuffix: false));
  /// // output: a month
  /// ```
  ///
  /// If [withPrefixAndSuffix] is `true` (default), the output string will
  /// include prefix and suffix words like "in" or "ago". Otherwise, only
  /// the relative time difference string will be returned.
  String toNow({bool withPrefixAndSuffix = true}) =>
      to(Jiffy.now(), withPrefixAndSuffix: withPrefixAndSuffix);

  /// Returns the difference between this [Jiffy] instance and the given
  /// [jiffy] instance as a numeric value.
  ///
  /// The [unit] parameter specifies the unit in which to return the difference.
  /// The default value is [Unit.microsecond].
  ///
  /// The optional [asFloat] parameter determines whether to return the
  /// difference as a floating-point number. The default value is [false].
  ///
  /// Example:
  ///
  /// ```dart
  /// final jiffy1 = Jiffy(DateTime(2022, 2, 1, 0, 0, 0));
  /// final jiffy2 = Jiffy(DateTime(2022, 2, 15, 12, 30, 0));
  ///
  /// // Calculate the difference between the two Jiffy instances in days
  /// final diffInDays = jiffy2.diff(jiffy1, unit: Unit.DAY);
  ///
  /// print('Difference in days: $diffInDays');
  /// // output: Difference in days: 14
  /// ```
  num diff(Jiffy jiffy, {Unit unit = Unit.microsecond, bool asFloat = false}) {
    return _display.diff(dateTime, jiffy.dateTime, unit, asFloat);
  }

  /// Returns a boolean value indicating whether this [Jiffy] instance is
  /// before the given [jiffy] instance.
  ///
  /// The [unit] parameter specifies the unit of measurement to use when
  /// comparing the two instances. The default value is [Unit.microsecond].
  bool isBefore(Jiffy jiffy, {Unit unit = Unit.microsecond}) {
    return _query.isBefore(dateTime, jiffy.dateTime, unit, _locale.startOfWeek);
  }

  /// Returns a boolean value indicating whether this [Jiffy] instance is
  /// after the given [jiffy] instance.
  ///
  /// The [unit] parameter specifies the unit of measurement to use when
  /// comparing the two instances. The default value is [Unit.microsecond].
  bool isAfter(Jiffy jiffy, {Unit unit = Unit.microsecond}) {
    return _query.isAfter(dateTime, jiffy.dateTime, unit, _locale.startOfWeek);
  }

  /// Returns a boolean value indicating whether this [Jiffy] instance is
  /// the same as the given [jiffy] instance.
  ///
  /// The [unit] parameter specifies the unit of measurement to use when
  /// comparing the two instances. The default value is [Unit.microsecond].
  bool isSame(Jiffy jiffy, {Unit unit = Unit.microsecond}) {
    return _query.isSame(dateTime, jiffy.dateTime, unit, _locale.startOfWeek);
  }

  /// Returns a boolean value indicating whether this [Jiffy] instance is
  /// the same as or before the given [jiffy] instance.
  ///
  /// The [unit] parameter specifies the unit of measurement to use when
  /// comparing the two instances. The default value is [Unit.microsecond].
  bool isSameOrBefore(Jiffy jiffy, {Unit unit = Unit.microsecond}) {
    return _query.isSameOrBefore(
        dateTime, jiffy.dateTime, unit, _locale.startOfWeek);
  }

  /// Returns a boolean value indicating whether this [Jiffy] instance is
  /// the same as or after the given [jiffy] instance.
  ///
  /// The [unit] parameter specifies the unit of measurement to use when
  /// comparing the two instances. The default value is [Unit.microsecond].
  bool isSameOrAfter(Jiffy jiffy, {Unit unit = Unit.microsecond}) {
    return _query.isSameOrAfter(
        dateTime, jiffy.dateTime, unit, _locale.startOfWeek);
  }

  /// Returns a boolean value indicating whether this [Jiffy] instance is
  /// between the two given [jiffyFrom] and [jiffyTo] instances.
  ///
  /// The [unit] parameter specifies the unit of measurement to use when
  /// comparing the three instances. The default value is [Unit.microsecond].
  bool isBetween(Jiffy jiffyFrom, Jiffy jiffyTo,
      {Unit unit = Unit.microsecond}) {
    return _query.isBetween(dateTime, jiffyFrom.dateTime, jiffyTo.dateTime,
        unit, _locale.startOfWeek);
  }

  /// Returns a boolean value indicating whether this [Jiffy] instance
  /// represents a UTC date and time.
  bool get isUtc => Query.isUtc(dateTime);

  /// Returns a boolean value indicating whether this [Jiffy] instance
  /// represents a local date and time.
  bool get isLocal => !isUtc;

  /// Returns a boolean value indicating whether the [Jiffy] instance
  /// provided falls on a leap year.
  bool get isLeapYear => Query.isLeapYear(dateTime.year);

  @override
  bool operator ==(Object other) {
    if (other is Jiffy) return dateTime == other.dateTime;
    return false;
  }

  @override
  int get hashCode => dateTime.hashCode;

  @override
  String toString() => _display.formatToISO8601(_dateTime);
}
