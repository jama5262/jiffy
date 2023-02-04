import 'package:intl/intl.dart';

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

// todo add a script to run analyze, format and test
// todo understand more of this utc stuff
// todo understand if I should only pass datatime and jiffy or all and
// todo also

class Jiffy {
  late final Getter _getter;
  late final DefaultDisplay _defaultDisplay;
  late final Parser _parser;
  late final Manipulator _manipulator;
  late final Query _query;
  late final Display _display;

  late Locale _locale;
  // todo see if we can always make this utc
  late DateTime _dateTime;

  Jiffy._internal(var input, [String? pattern]) {
    _initializeDependencies();
    _initializeLocale();
    _initializeDateTime(input, pattern);
  }

  factory Jiffy.parse(String string, [String? pattern]) {
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
      _locale = EnLocale();
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
      throw JiffyException('_message');
    }
    return dateTime;
  }

  Locale get locale => _locale;

  // todo should this function return or use the getter above
  void setLocale(String locale) {
    if (isLocalAvailable(locale)) {
      Intl.defaultLocale = locale;
      _locale = getLocale(locale);
    } else {
      // todo write an exception
      throw JiffyException('_message');
    }
  }

  Jiffy clone(DateTime dateTime) => Jiffy.parseFromDateTime(dateTime);

  // todo add docs here

  DateTime get dateTime => _getter.dateTime(_dateTime);

  int get microsecond => _getter.microsecond(_dateTime);

  int get microsecondsSinceEpoch => _getter.microsecondsSinceEpoch(_dateTime);

  int get millisecond => _getter.millisecond(_dateTime);

  int get millisecondsSinceEpoch => _getter.millisecondsSinceEpoch(_dateTime);

  int get second => _getter.second(_dateTime);

  int get minute => _getter.minute(_dateTime);

  int get hour => _getter.hour(_dateTime);

  int get date => _getter.date(_dateTime);

  int get dayOfWeek => _getter.dayOfWeek(_dateTime, _locale.startOfWeek());

  int get daysInMonth => _getter.daysInMonth(_dateTime);

  int get dayOfYear => _getter.dayOfYear(_dateTime);

  int get week => _getter.weekOfYear(_dateTime, _locale.startOfWeek());

  int get month => _getter.month(_dateTime);

  int get quarter => _getter.quarterOfYear(_dateTime);

  int get year => _getter.year(_dateTime);

  // todo add docs here

  Jiffy addDuration(Duration duration) {
    _dateTime = _manipulator.addDuration(_dateTime, duration);
    // todo, test by return class or cloning it
    return this;
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
    _dateTime = _manipulator.add(_dateTime, microseconds, milliseconds, seconds,
        minutes, hours, days, weeks, months, years);
    return clone(_dateTime);
  }

  Jiffy subtractDuration(Duration duration) {
    _dateTime = _manipulator.subtractDuration(_dateTime, duration);
    return clone(_dateTime);
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
    _dateTime = _manipulator.subtract(_dateTime, microseconds, milliseconds,
        seconds, minutes, hours, days, weeks, months, years);
    return clone(_dateTime);
  }

  Jiffy startOf(Unit unit) {
    _dateTime = _manipulator.startOf(_dateTime, unit, _locale.startOfWeek());
    return clone(_dateTime);
  }

  Jiffy endOf(Unit unit) {
    _dateTime = _manipulator.endOf(_dateTime, unit, _locale.startOfWeek());
    return clone(_dateTime);
  }

  // todo look at this more together with toutc
  Jiffy toLocal() {
    return clone(Query.isUtc(_dateTime) ? _dateTime.toLocal() : _dateTime);
  }

  Jiffy toUtc() {
    return clone(Query.isUtc(_dateTime) ? _dateTime : _dateTime.toUtc());
  }

  // todo add docs here

  String format({String? pattern}) {
    return pattern == null
        ? _display.formatToISO8601(_dateTime)
        : _display.format(_dateTime, pattern, _locale);
  }

  // todo pass in locale

  String get E => _defaultDisplay.E(_dateTime);

  String get EEEE => _defaultDisplay.EEEE(_dateTime);

  String get Md => _defaultDisplay.Md(_dateTime);

  String get MEd => _defaultDisplay.MEd(_dateTime);

  String get MMM => _defaultDisplay.MMM(_dateTime);

  String get MMMd => _defaultDisplay.MMMd(_dateTime);

  String get MMMEd => _defaultDisplay.MMMEd(_dateTime);

  String get MMMM => _defaultDisplay.MMMM(_dateTime);

  String get MMMMd => _defaultDisplay.MMMMd(_dateTime);

  String get MMMMEEEEd => _defaultDisplay.MMMMEEEEd(_dateTime);

  String get QQQ => _defaultDisplay.QQQ(_dateTime);

  String get QQQQ => _defaultDisplay.QQQQ(_dateTime);

  String get yM => _defaultDisplay.yM(_dateTime);

  String get yMd => _defaultDisplay.yMd(_dateTime);

  String get yMEd => _defaultDisplay.yMEd(_dateTime);

  String get yMMM => _defaultDisplay.yMMM(_dateTime);

  String get yMMMd => _defaultDisplay.yMMMd(_dateTime);

  String get yMMMdjm => _defaultDisplay.yMMMdjm(_dateTime);

  String get yMMMEd => _defaultDisplay.yMMMEd(_dateTime);

  String get yMMMEdjm => _defaultDisplay.yMMMEdjm(_dateTime);

  String get yMMMM => _defaultDisplay.yMMMM(_dateTime);

  String get yMMMMd => _defaultDisplay.yMMMMd(_dateTime);

  String get yMMMMdjm => _defaultDisplay.yMMMMdjm(_dateTime);

  String get yMMMMEEEEd => _defaultDisplay.yMMMMEEEEd(_dateTime);

  String get yMMMMEEEEdjm => _defaultDisplay.yMMMMEEEEdjm(_dateTime);

  String get yQQQ => _defaultDisplay.yQQQ(_dateTime);

  String get yQQQQ => _defaultDisplay.yQQQQ(_dateTime);

  String get Hm => _defaultDisplay.Hm(_dateTime);

  String get Hms => _defaultDisplay.Hms(_dateTime);

  String get j => _defaultDisplay.j(_dateTime);

  String get jm => _defaultDisplay.jm(_dateTime);

  String get jms => _defaultDisplay.jms(_dateTime);

  String from(Jiffy jiffy) {
    return _display.fromAsRelativeDateTime(_dateTime, jiffy.dateTime, _locale);
  }

  String fromNow() => from(Jiffy.now());

  String to(Jiffy jiffy) {
    return _display.toAsRelativeDateTime(_dateTime, jiffy.dateTime, _locale);
  }

  String toNow() => to(Jiffy.now());

  num diff(Jiffy jiffy, {Unit unit = Unit.MILLISECOND, bool asFloat = false}) {
    return _display.diff(_dateTime, jiffy.dateTime, unit, asFloat);
  }

  // todo add docs here

  bool isBefore(Jiffy jiffy, {Unit unit = Unit.MILLISECOND}) {
    return _query.isBefore(
        _dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isAfter(Jiffy jiffy, {Unit unit = Unit.MILLISECOND}) {
    return _query.isAfter(
        _dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isSame(Jiffy jiffy, {Unit unit = Unit.MILLISECOND}) {
    return _query.isSame(
        _dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isSameOrBefore(Jiffy jiffy, {Unit unit = Unit.MILLISECOND}) {
    return _query.isSameOrBefore(
        _dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isSameOrAfter(Jiffy jiffy, {Unit unit = Unit.MILLISECOND}) {
    return _query.isSameOrAfter(
        _dateTime, jiffy.dateTime, unit, _locale.startOfWeek());
  }

  bool isBetween(Jiffy jiffyFrom, Jiffy jiffyTo,
      {Unit unit = Unit.MILLISECOND}) {
    return _query.isBetween(_dateTime, jiffyFrom.dateTime, jiffyTo.dateTime,
        unit, _locale.startOfWeek());
  }

  bool get isLeapYear => Query.isLeapYear(_dateTime.year);
}
