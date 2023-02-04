import 'package:intl/intl.dart';

import 'enums/unit.dart';
import 'getter.dart';
import 'locale/locale.dart';
import 'utils/exception.dart';

class Parser {
  final Getter _getter;

  Parser(this._getter);

  DateTime fromString(String input, String? pattern, Locale locale) {
    if (pattern != null) {
      if (pattern.trim().isEmpty) {
        throw JiffyException('The provided pattern for input `$input` cannot '
            'be blank');
      }
      final ordinals = locale.ordinals();
      return _parseString(
          _replaceParseInput(input, ordinals), _replacePatternInput(pattern));
    }

    if (_matchesHyphenStringDateTime(input)) {
      return _parseString(input, 'yyyy-MM-dd');
    } else if (_matchesSlashStringDateTime(input)) {
      return _parseString(input, 'yyyy/MM/dd');
    } else if (_matchesDartStringDateTime(input) ||
        _matchesISOStringDateTime(input)) {
      return DateTime.parse(input);
    } else {
      throw JiffyException(
          'Could not read date time of input `$input`, try using a pattern, '
          'e.g. input: "12, Oct", pattern: "dd, MMM"');
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

  DateTime fromMap(Map<Unit, int> input) {
    if (input.isEmpty) {
      throw JiffyException('The provided datetime map cannot be empty');
    }
    return DateTime(
        input[Unit.YEAR] ?? _getter.year(DateTime.now()),
        input[Unit.MONTH] ?? _getter.month(DateTime.now()),
        input[Unit.DAY] ?? _getter.date(DateTime.now()),
        input[Unit.HOUR] ?? _getter.hour(DateTime.now()),
        input[Unit.MINUTE] ?? _getter.minute(DateTime.now()),
        input[Unit.SECOND] ?? _getter.second(DateTime.now()),
        input[Unit.MILLISECOND] ?? _getter.millisecond(DateTime.now()),
        input[Unit.MICROSECOND] ?? _getter.microsecond(DateTime.now()));
  }

  DateTime _parseString(String input, String pattern) {
    try {
      // todo use utc param here
      return DateFormat(pattern).parse(input);
    } on FormatException catch (e) {
      throw JiffyException('Could not parse input `$input`, failed with the '
          'following error: ${e.toString()}');
    }
  }

  String _replacePatternInput(String pattern) {
    return pattern.replaceFirst('do', 'd');
  }

  String _replaceParseInput(String input, List<String> ordinals) {
    return input
        .replaceFirst(' pm', ' PM')
        .replaceFirst(' am', ' AM')
        .replaceFirst(_matchesOrdinalDates(input, ordinals), '');
  }

  // todo fix this regex replacement of the ordinals when there is a space between
  // example `12 th`
  // todo test if empty ordinals are provided
  String _matchesOrdinalDates(String input, List<String> ordinals) {
    final matches =
        RegExp(r'\d+\s*(' + ordinals.join('|') + ')').allMatches(input);
    return matches.isNotEmpty ? matches.first.group(1) ?? '' : '';
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
