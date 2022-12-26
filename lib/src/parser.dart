import 'package:intl/intl.dart';

import 'enums/units.dart';
import 'locale/locale.dart';
import 'utils/exception.dart';

class Parser {
  DateTime fromString(String input, String? pattern, Locale locale) {
    if (pattern != null) {
      if (pattern.trim().isEmpty) {
        throw JiffyException('The provided pattern for `$input` cannot '
            'be empty');
      }
      return parseString(
          _replaceParseInput(input, locale), _replacePatternInput(pattern));
    }

    if (_matchesHyphenStringDateTime(input)) {
      return parseString(input, 'yyyy-MM-dd');
    } else if (_matchesSlashStringDateTime(input)) {
      return parseString(input, 'yyyy/MM/dd');
    } else if (_matchesDartStringDateTime(input) ||
        _matchesISOStringDateTime(input)) {
      return DateTime.parse(input);
    } else {
      throw JiffyException(
          'Could not read date time `$input`, try using a pattern, e.g. '
          'Jiffy("12, Oct", "dd, MMM")');
    }
  }

  DateTime fromList(List<int> input) {
    if (input.isEmpty) {
      throw JiffyException('The provided datetime list cannot be empty');
    }
    final length = input.length;
    return DateTime(
        input[0],
        length > 1 ? input[1] : 1,
        length > 2 ? input[2] : 1,
        length > 3 ? input[3] : 0,
        length > 4 ? input[4] : 0,
        length > 5 ? input[5] : 0,
        length > 6 ? input[6] : 0,
        length > 7 ? input[7] : 0);
  }

  DateTime fromMap(Map<Units, int> input) {
    if (input.isEmpty) {
      throw JiffyException('The provided datetime map cannot be empty');
    }
    return DateTime(
        input[Units.YEAR] ?? DateTime.now().year,
        input[Units.MONTH] ?? DateTime.now().month,
        input[Units.DAY] ?? DateTime.now().day,
        input[Units.HOUR] ?? DateTime.now().hour,
        input[Units.MINUTE] ?? DateTime.now().minute,
        input[Units.SECOND] ?? DateTime.now().second,
        input[Units.MILLISECOND] ?? DateTime.now().millisecond,
        input[Units.MICROSECOND] ?? DateTime.now().microsecond);
  }

  DateTime parseString(String input, String pattern) {
    try {
      return DateFormat(pattern).parse(input);
    } on FormatException catch (e) {
      throw JiffyException(e.toString());
    }
  }

  String _replacePatternInput(String pattern) {
    return pattern.replaceFirst('do', 'd');
  }

  String _replaceParseInput(String input, Locale locale) {
    return input
        .replaceFirst(' pm', ' PM')
        .replaceFirst(' am', ' AM')
        .replaceFirst(_matchesOrdinalDates(locale), '');
  }

  // todo fix this regex replacement of the ordinals when there is a space between
  // example `12 th`
  Pattern _matchesOrdinalDates(Locale locale) {
    final ordinals = locale.ordinals()!.join('|');
    return RegExp(r'(?<=[0-9])(?:' + ordinals + ')');
  }

  bool _matchesHyphenStringDateTime(String input) {
    return RegExp(r'\d{4}-\d{1,2}-\d{1,2}$').hasMatch(input);
  }

  bool _matchesSlashStringDateTime(String input) {
    return RegExp(r'\d{4}/\d{1,2}/\d{1,2}$').hasMatch(input);
  }

  bool _matchesDartStringDateTime(String input) {
    return RegExp(
            r'\d{4}-\d{1,2}-\d{1,2} \d{1,2}(:\d{1,2})?(:\d{1,2})?(.\d+)?(Z?)$')
        .hasMatch(input);
  }

  bool _matchesISOStringDateTime(String input) {
    return RegExp(
            r'\d{4}-\d{1,2}-\d{1,2}T\d{1,2}(:\d{1,2})?(:\d{1,2})?(.\d+)?(Z?)$')
        .hasMatch(input);
  }
}
