import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import './default_display.dart';
import './display.dart';
import './enums/unit.dart';
import './getter.dart';
import './locale/available_locales.dart';
import './locale/locale.dart';
import './locale/locales/enLocale.dart';
import './manipulator.dart';
import './parser.dart';
import './query.dart';
import './utils/exception.dart';

// todo understand more of this utc stuff

class Jiffy {
  late final Getter _getter;
  late final DefaultDisplay _defaultDisplay;
  late final Parser _parser;
  late final Manipulator _manipulator;
  late final Query _query;
  late final Display _display;

  late Locale _locale;
  // todo see if we can always make this utc
  late final DateTime _dateTime;

  Jiffy._internal(var input, [String? pattern]) {
    _initializeDependencies();
    _initializeLocale();
    _initializeDateTime(input, pattern);
  }

  factory Jiffy.parse(String string, {String? pattern}) {
    return Jiffy._internal(string, pattern);
  }

  factory Jiffy.parseFromDateTime(DateTime dateTime) {
    return Jiffy._internal(dateTime);
  }

  factory Jiffy.parseFromJiffy(Jiffy jiffy) {
    return Jiffy._internal(jiffy);
  }

  factory Jiffy.parseFromList(List<int> list) {
    return Jiffy._internal(list);
  }

  factory Jiffy.parseFromMap(Map<Unit, int> map) {
    return Jiffy._internal(map);
  }

  factory Jiffy.parseFromMicrosecondsSinceEpoch(int microsecondsSinceEpoch) {
    return Jiffy._internal(
        DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch));
  }

  factory Jiffy.parseFromMillisecondsSinceEpoch(int millisecondsSinceEpoch) {
    return Jiffy._internal(
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch));
  }

  factory Jiffy.now() => Jiffy._internal(DateTime.now());

  void _initializeDependencies() {
    _getter = Getter();
    _defaultDisplay = DefaultDisplay();
    _parser = Parser(_getter);
    _manipulator = Manipulator(_getter);
    _query = Query(_getter, _manipulator);
    _display = Display(_getter, _manipulator, _query);
  }

  void _initializeDateTime(var input, String? pattern) {
    _dateTime = _parse(input, pattern);
  }

  void _initializeLocale() {
    var systemLocale = Intl.getCurrentLocale();

    if (isLocalAvailable(systemLocale)) {
      _locale = getLocale(systemLocale);
    } else {
      // todo print that the current locale is not available in Jiffy and show a link to github with available locales
      _locale = EnUsLocale();
    }
  }

  DateTime _parse(var input, String? pattern) {
    DateTime dateTime;
    if (input is DateTime) {
      dateTime = input;
    } else if (input is Jiffy) {
      dateTime = input.dateTime;
    } else if (input is String) {
      dateTime = _parser.fromString(input, pattern, _locale);
    } else if (input is List<int>) {
      dateTime = _parser.fromList(input);
    } else if (input is Map<Unit, int>) {
      dateTime = _parser.fromMap(input);
    } else {
      throw JiffyException('Could not parse input: `$input`, '
          'only String, List, Map, DateTime and Jiffy are allowed');
    }
    return dateTime;
  }

  Locale get locale => _locale;

  Future<void> setLocale(String locale) async {
    if (isLocalAvailable(locale)) {
      Intl.defaultLocale = locale;
      await initializeDateFormatting();
      _locale = getLocale(locale);
    } else {
      // todo add github readme locale link to this exception
      throw JiffyException('The locale `$locale` is not supported, '
          'please check here for a list of supported locales');
    }
  }

  Jiffy clone() => Jiffy.parseFromDateTime(dateTime);

  Jiffy _clone(DateTime dateTime) =>
      Jiffy.parseFromDateTime(dateTime.copyWith());

  // todo add docs here

  DateTime get dateTime => _getter.dateTime(_dateTime);

  int get microsecond => _getter.microsecond(dateTime);

  int get microsecondsSinceEpoch => _getter.microsecondsSinceEpoch(dateTime);

  int get millisecond => _getter.millisecond(dateTime);

  int get millisecondsSinceEpoch => _getter.millisecondsSinceEpoch(dateTime);

  int get second => _getter.second(dateTime);

  int get minute => _getter.minute(dateTime);

  int get hour => _getter.hour(dateTime);

  int get date => _getter.date(dateTime);

  int get dayOfWeek => _getter.dayOfWeek(dateTime, _locale.startOfWeek());

  int get daysInMonth => _getter.daysInMonth(dateTime);

  int get dayOfYear => _getter.dayOfYear(dateTime);

  int get week => _getter.weekOfYear(dateTime, _locale.startOfWeek());

  int get month => _getter.month(dateTime);

  int get quarter => _getter.quarterOfYear(dateTime);

  int get year => _getter.year(dateTime);

  // todo add docs here

  Jiffy addDuration(Duration duration) {
    final dateTime = _manipulator.addDuration(this.dateTime, duration);
    return _clone(dateTime);
  }

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

  Jiffy subtractDuration(Duration duration) {
    final dateTime = _manipulator.subtractDuration(this.dateTime, duration);
    return _clone(dateTime);
  }

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

  Jiffy startOf(Unit unit) {
    final dateTime =
        _manipulator.startOf(this.dateTime, unit, _locale.startOfWeek());
    return _clone(dateTime);
  }

  Jiffy endOf(Unit unit) {
    final dateTime =
        _manipulator.endOf(this.dateTime, unit, _locale.startOfWeek());
    return _clone(dateTime);
  }

  // todo look at this more together with toutc
  Jiffy toLocal() {
    final dateTime =
        Query.isUtc(this.dateTime) ? this.dateTime.toLocal() : this.dateTime;
    return _clone(dateTime);
  }

  Jiffy toUtc() {
    final dateTime =
        Query.isUtc(this.dateTime) ? this.dateTime : this.dateTime.toUtc();
    return _clone(dateTime);
  }

  // todo add docs here

  String format({String? pattern}) {
    return pattern == null
        ? _display.formatToISO8601(dateTime)
        : _display.format(dateTime, pattern, _locale);
  }

  // todo pass in locale

  String get E => _defaultDisplay.E(dateTime);

  String get EEEE => _defaultDisplay.EEEE(dateTime);

  String get Md => _defaultDisplay.Md(dateTime);

  String get MEd => _defaultDisplay.MEd(dateTime);

  String get MMM => _defaultDisplay.MMM(dateTime);

  String get MMMd => _defaultDisplay.MMMd(dateTime);

  String get MMMEd => _defaultDisplay.MMMEd(dateTime);

  String get MMMM => _defaultDisplay.MMMM(dateTime);

  String get MMMMd => _defaultDisplay.MMMMd(dateTime);

  String get MMMMEEEEd => _defaultDisplay.MMMMEEEEd(dateTime);

  String get QQQ => _defaultDisplay.QQQ(dateTime);

  String get QQQQ => _defaultDisplay.QQQQ(dateTime);

  String get yM => _defaultDisplay.yM(dateTime);

  String get yMd => _defaultDisplay.yMd(dateTime);

  String get yMEd => _defaultDisplay.yMEd(dateTime);

  String get yMMM => _defaultDisplay.yMMM(dateTime);

  String get yMMMd => _defaultDisplay.yMMMd(dateTime);

  String get yMMMdjm => _defaultDisplay.yMMMdjm(dateTime);

  String get yMMMEd => _defaultDisplay.yMMMEd(dateTime);

  String get yMMMEdjm => _defaultDisplay.yMMMEdjm(dateTime);

  String get yMMMM => _defaultDisplay.yMMMM(dateTime);

  String get yMMMMd => _defaultDisplay.yMMMMd(dateTime);

  String get yMMMMdjm => _defaultDisplay.yMMMMdjm(dateTime);

  String get yMMMMEEEEd => _defaultDisplay.yMMMMEEEEd(dateTime);

  String get yMMMMEEEEdjm => _defaultDisplay.yMMMMEEEEdjm(dateTime);

  String get yQQQ => _defaultDisplay.yQQQ(dateTime);

  String get yQQQQ => _defaultDisplay.yQQQQ(dateTime);

  String get Hm => _defaultDisplay.Hm(dateTime);

  String get Hms => _defaultDisplay.Hms(dateTime);

  String get j => _defaultDisplay.j(dateTime);

  String get jm => _defaultDisplay.jm(dateTime);

  String get jms => _defaultDisplay.jms(dateTime);

  String from(Jiffy jiffy) {
    return _display.fromAsRelativeDateTime(dateTime, jiffy.dateTime, _locale);
  }

  String fromNow() => from(Jiffy.now());

  String to(Jiffy jiffy) {
    return _display.toAsRelativeDateTime(dateTime, jiffy.dateTime, _locale);
  }

  String toNow() => to(Jiffy.now());

  num diff(Jiffy jiffy, {Unit unit = Unit.MICROSECOND, bool asFloat = false}) {
    return _display.diff(dateTime, jiffy.dateTime, unit, asFloat);
  }

  // todo add docs here

  bool isBefore(Jiffy jiffy, {Unit unit = Unit.MICROSECOND}) {
    return _query.isBefore(
        dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isAfter(Jiffy jiffy, {Unit unit = Unit.MICROSECOND}) {
    return _query.isAfter(
        dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isSame(Jiffy jiffy, {Unit unit = Unit.MICROSECOND}) {
    return _query.isSame(dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isSameOrBefore(Jiffy jiffy, {Unit unit = Unit.MICROSECOND}) {
    return _query.isSameOrBefore(
        dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isSameOrAfter(Jiffy jiffy, {Unit unit = Unit.MICROSECOND}) {
    return _query.isSameOrAfter(
        dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isBetween(Jiffy jiffyFrom, Jiffy jiffyTo,
      {Unit unit = Unit.MICROSECOND}) {
    return _query.isBetween(dateTime, jiffyFrom.dateTime, jiffyTo.dateTime,
        unit, _locale.startOfWeek());
  }

  bool get isLocal => !isUtc;

  bool get isUtc => Query.isUtc(dateTime);

  bool get isLeapYear => Query.isLeapYear(dateTime.year);
}
