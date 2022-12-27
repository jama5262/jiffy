import 'package:intl/intl.dart';

import 'enums/units.dart';
import 'utils/exception.dart';

class Display {
  String formatToISO8601(DateTime dateTime) => dateTime.toIso8601String();

  String format(DateTime dateTime, String pattern, String ordinal) {
    final escapedPattern = _replaceEscapePattern(pattern);
    final newPattern = _replaceOrdinalDatePattern(escapedPattern, ordinal);
    try {
      return DateFormat(newPattern).format(dateTime);
    } on Exception catch (e) {
      throw JiffyException(e.toString());
    }
  }

  String from(DateTime firstDateTime, DateTime secondDateTime) {
    return '';
  }

  num diff(DateTime firstDateTime, DateTime secondsDateTime, Units units,
      bool asFloat) {
    return 0;
  }

  String _replaceEscapePattern(String input) {
    return input.replaceAll('[', '\'').replaceAll(']', '\'');
  }

  String _replaceOrdinalDatePattern(String input, String suffix) {
    final regex = _matchesOrdinalDatePattern().allMatches(input);
    var pattern = input;
    regex.forEach((match) {
      if (match.group(1) == 'do') {
        pattern = input.replaceRange(
            match.start, match.end, 'd${suffix.isNotEmpty ? "'$suffix'" : ''}');
      }
    });
    return pattern;
  }

  // tod understand what this regex pattern does
  Pattern _matchesOrdinalDatePattern() {
    return RegExp(
        '''(?<unquote>[^"'\\s]\\w*)|(?:["][^"]+?["])|(?:['][^']+?['])''');
  }
}
