import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart' as date_intl;
import 'package:intl/date_symbols.dart';

import 'jiffy_exception.dart';

List<String> getSupportedIntlLocales() =>
    date_intl.dateTimeSymbolMap().keys.cast<String>().toList();

DateSymbols verifyLocale(String locale,
    {bool Function(String)? onLocaleExists,
    String Function(String)? onFailureMessage}) {
  final failureMessage = onFailureMessage != null
      ? onFailureMessage(locale)
      : "The specified locale '$locale' is not supported.";

  final supportedLocale = Intl.verifiedLocale(
      locale, (onLocaleExists ?? _doesLocaleExist),
      onFailure: (_) => _throwLocaleNotSupported(failureMessage))!;

  return date_intl.dateTimeSymbolMap()[supportedLocale]!;
}

bool _doesLocaleExist(String locale) {
  return getSupportedIntlLocales().contains(locale);
}

String _throwLocaleNotSupported(String message) {
  throw JiffyException(message);
}
