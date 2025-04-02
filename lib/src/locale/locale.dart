import 'package:jiffy/src/locale/ordinals.dart';

import '../enums/start_of_week.dart';
import 'relative_date_time.dart';

class Locale {
  /// Returns the locale code for this locale.
  ///
  /// The locale code is a string identifier that uniquely identifies a
  /// Locale. Examples include "en_US" for English as used in the
  /// United States, or "fr_CA" for French as used in Canada.
  final String code;

  /// Returns the day on which the week starts for this locale.
  final StartOfWeek startOfWeek;

  /// Returns a list of ordinal suffixes for this locale.
  ///
  /// Ordinal suffixes are used to format the ordinal number of a day
  /// (For example, "st", "nd", "rd", "th").
  final Ordinals ordinals;

  /// Returns a [RelativeDateTime] instance for this locale.
  ///
  /// A [RelativeDateTime] instance encapsulates the rules for formatting
  /// relative date/time values (For example, "3 hours ago", "in 2 days") for
  /// a specific locale.
  final RelativeDateTime relativeDateTime;

  Locale({
    required this.code,
    required this.ordinals,
    required this.startOfWeek,
    required this.relativeDateTime,
  });
}
