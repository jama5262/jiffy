import 'package:jiffy/src/exception/exception.dart';

String normalizeUnits(String unit) {
  String lowerCaseUnit = unit.toLowerCase();
  if (lowerCaseUnit == "millisecond" ||
      lowerCaseUnit == "milliseconds" ||
      lowerCaseUnit == "ms") {
    return "ms";
  } else if (lowerCaseUnit == "second" ||
      lowerCaseUnit == "seconds" ||
      lowerCaseUnit == "s") {
    return "s";
  } else if (lowerCaseUnit == "minute" ||
      lowerCaseUnit == "minutes" ||
      lowerCaseUnit == "m") {
    return "m";
  } else if (lowerCaseUnit == "hour" ||
      lowerCaseUnit == "hours" ||
      lowerCaseUnit == "h") {
    return "h";
  } else if (lowerCaseUnit == "day" ||
      lowerCaseUnit == "days" ||
      lowerCaseUnit == "d") {
    return "d";
  } else if (lowerCaseUnit == "week" ||
      lowerCaseUnit == "weeks" ||
      lowerCaseUnit == "w") {
    return "w";
  } else if (lowerCaseUnit == "month" || lowerCaseUnit == "months") {
    return "sM";
  } else if (lowerCaseUnit == "year" ||
      lowerCaseUnit == "years" ||
      lowerCaseUnit == "y") {
    return "y";
  } else {
    return "0";
  }
}

String validateUnits(String unit) {
  unit = unit == "M" ? unit : normalizeUnits(unit);
  if (unit == "0") {
    throw JiffyException(
            "Invalid unit passed, please visit to see all available units")
        .cause;
//      TODO: ADD GITHUB README URL DOC TO UNITS
  }
  return unit;
}
