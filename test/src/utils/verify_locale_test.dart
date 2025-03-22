import 'package:intl/date_symbol_data_local.dart' as date_intl;
import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:jiffy/src/utils/verify_locale.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('Should successfully get a list of supported Intl locales', () {
    // Setup
    final intlLocales = date_intl.dateTimeSymbolMap().keys;

    // Execute
    final actualSupportedLocales = getSupportedIntlLocales();

    // Verify
    expect(actualSupportedLocales, intlLocales);
  });

  test(
      'Should successfully verify and return a DateSymbol for supported locales',
      () {
    // Setup
    final intlLocales = date_intl.dateTimeSymbolMap();

    // Execute
    for (var dateSymbol in intlLocales.values) {
      expect(() => verifyLocale(dateSymbol.NAME), returnsNormally);
      expect(verifyLocale(dateSymbol.NAME).serializeToMap(),
          equals(dateSymbol.serializeToMap()));
    }
  });

  test(
      'Should successfully verify and accept different valid formated locale codes',
      () {
    // Setup
    final locales = [
      {'locale': 'en_US', 'expectedValidLocale': 'en_US'},
      {'locale': 'en-US', 'expectedValidLocale': 'en_US'},
      {'locale': 'en_us', 'expectedValidLocale': 'en_US'},
      {'locale': 'en_US', 'expectedValidLocale': 'en_US'},
      {'locale': 'EN-US', 'expectedValidLocale': 'en'},
      {'locale': 'EN_US', 'expectedValidLocale': 'en'},
      {'locale': 'EN_us', 'expectedValidLocale': 'en'},
      {'locale': 'EN-us', 'expectedValidLocale': 'en'},
      {'locale': 'en', 'expectedValidLocale': 'en'},
      {'locale': 'EN', 'expectedValidLocale': 'en'}
    ];

    // Execute
    for (var locale in locales) {
      expect(verifyLocale(locale['locale']!).NAME,
          equals(locale['expectedValidLocale']));
    }
  });

  test('Should successfully verify from a list of custom supported locales',
      () {
    // Setup
    final customIntlSupportedLocales = ['ar', 'ja', 'en_US'];

    // Execute
    for (var locale in customIntlSupportedLocales) {
      expect(
          verifyLocale(locale,
              onLocaleExists: (locale) =>
                  customIntlSupportedLocales.contains(locale)).NAME,
          equals(locale));
    }
  });

  test('Should throw exception if custom locales are not found intl', () {
    // Setup
    final customNoneIntlSupportedLocale = 'xyz';

    // Execute and Verify
    expect(
        () => verifyLocale(customNoneIntlSupportedLocale),
        throwsA(isA<JiffyException>().having(
            (e) => e.toString(),
            'message',
            contains(
                "The specified locale '$customNoneIntlSupportedLocale' is not supported."))));
  });

  test('Should successfully use custom failure function', () {
    // Setup
    final locale = 'unsupported_locale';
    failureMessage(locale) =>
        "This is a custom failure message, with locale $locale";
    customerOnFailureMessage(locale) => failureMessage(locale);

    // Execute and Verify
    expect(
        () => verifyLocale(locale, onFailureMessage: customerOnFailureMessage),
        throwsA(isA<JiffyException>().having(
            (e) => e.toString(), 'message', contains(failureMessage(locale)))));
  });
}
