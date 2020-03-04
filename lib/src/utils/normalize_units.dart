import 'package:jiffy/src/utils/exception.dart';

String normalizeUnits(String unit) {
  var lowerCaseUnit = unit.toLowerCase();
  if (lowerCaseUnit == 'millisecond' ||
      lowerCaseUnit == 'milliseconds' ||
      lowerCaseUnit == 'ms') {
    return 'ms';
  } else if (lowerCaseUnit == 'second' ||
      lowerCaseUnit == 'seconds' ||
      lowerCaseUnit == 's') {
    return 's';
  } else if (lowerCaseUnit == 'minute' ||
      lowerCaseUnit == 'minutes' ||
      lowerCaseUnit == 'm') {
    return 'm';
  } else if (lowerCaseUnit == 'hour' ||
      lowerCaseUnit == 'hours' ||
      lowerCaseUnit == 'h') {
    return 'h';
  } else if (lowerCaseUnit == 'day' ||
      lowerCaseUnit == 'days' ||
      lowerCaseUnit == 'd') {
    return 'd';
  } else if (lowerCaseUnit == 'week' ||
      lowerCaseUnit == 'weeks' ||
      lowerCaseUnit == 'w') {
    return 'w';
  } else if (lowerCaseUnit == 'month' || lowerCaseUnit == 'months') {
    return 'M';
  } else if (lowerCaseUnit == 'year' ||
      lowerCaseUnit == 'years' ||
      lowerCaseUnit == 'y') {
    return 'y';
  } else {
    return '0';
  }
}

String validateUnits(String unit) {
  unit = unit == 'M' ? unit : normalizeUnits(unit);
  if (unit == '0') {
    throw JiffyException(
            'Invalid unit passed, the following units are available "year", "month", "week", "day", "hour", "minute", "second", "millisecond"')
        .cause;
  }
  return unit;
}
