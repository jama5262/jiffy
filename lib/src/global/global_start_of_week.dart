import 'package:intl/date_symbol_data_local.dart' as date_intl;
import 'package:jiffy/src/utils/jiffy_exception.dart';

import '../enums/start_of_week.dart';

StartOfWeek? _defaultStartOfWeek;

set defaultStartOfWeek(StartOfWeek? startOfWeek) {
  _defaultStartOfWeek = startOfWeek;
}

StartOfWeek getStartOfWeek(String locale) {
  if (_defaultStartOfWeek != null) {
    return _defaultStartOfWeek!;
  } else {
    final supportedLocale = date_intl.dateTimeSymbolMap()[locale];

    if (supportedLocale == null) {
      throw JiffyException("The specified locale '$locale' is not supported.");
    }

    return switch (supportedLocale.FIRSTDAYOFWEEK) {
      0 => StartOfWeek.monday,
      5 => StartOfWeek.saturday,
      6 => StartOfWeek.sunday,
      _ => throw JiffyException(
          "Start of week with index ${supportedLocale.FIRSTDAYOFWEEK} "
          "not supported"),
    };
  }
}
