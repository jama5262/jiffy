import 'package:jiffy/src/global/global_ordinals.dart';
import 'package:jiffy/src/locale/ordinals.dart';
import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:jiffy/src/utils/verify_locale.dart';
import 'package:test/test.dart';

void main() {
  group('getOrdinals', () {
    setUp(() async {
      defaultOrdinals = null;
    });

    test('Should return default ordinals if defaultOrdinals is set', () {
      // Setup
      final ordinals = Ordinals(first: 'a', second: 'b', third: 'c', nth: 'd');
      defaultOrdinals = ordinals;

      // Execute
      final result = getOrdinals('en');

      // Verify
      expect(result, ordinals);
    });

    test('Should return built-in ordinals for supported short locale', () {
      // Setup
      final expectedOrdinals =
          Ordinals(first: 'st', second: 'nd', third: 'rd', nth: 'th');

      // Execute
      final result = getOrdinals('en_US');

      // Verify
      expect(result, expectedOrdinals);
    });

    test('Should throw JiffyException for unsupported locale', () {
      // Setup
      final unsupportedLocale = 'xyz';

      // Execute & Verify
      expect(
          () => getOrdinals(unsupportedLocale),
          throwsA(isA<JiffyException>().having(
              (e) => e.toString(),
              'message',
              contains(
                  "Locale `$unsupportedLocale` is not supported for ordinals."))));
    });

    test('Should return ordinals for various supported locales', () {
      // Setup
      final locales = {
        'en': Ordinals(first: 'st', second: 'nd', third: 'rd', nth: 'th'),
        'es': Ordinals(first: 'º', second: 'º', third: 'º', nth: 'º'),
        'fr': Ordinals(first: 'er', second: '', third: '', nth: ''),
        'zh': Ordinals(first: '日', second: '日', third: '日', nth: '日'),
        'de': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
        'it': Ordinals(first: 'º', second: 'º', third: 'º', nth: 'º'),
        'ar': Ordinals(first: '', second: '', third: '', nth: ''),
        'az': Ordinals(first: '', second: '', third: '', nth: ''),
        'id': Ordinals(first: '', second: '', third: '', nth: ''),
        'ja': Ordinals(first: '日', second: '日', third: '日', nth: '日'),
        'ko': Ordinals(first: '일', second: '일', third: '일', nth: '일'),
        'ru': Ordinals(first: '', second: '', third: '', nth: ''),
        'uk': Ordinals(first: '', second: '', third: '', nth: ''),
        'hi': Ordinals(first: '', second: '', third: '', nth: ''),
        'hu': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
        'pt': Ordinals(first: 'º', second: 'º', third: 'º', nth: 'º'),
        'pl': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
        'tr': Ordinals(first: '', second: '', third: '', nth: ''),
        'sv': Ordinals(first: '', second: '', third: '', nth: ''),
        'nb': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
        'fa': Ordinals(first: 'م', second: 'م', third: 'م', nth: 'م'),
        'bn': Ordinals(first: '', second: '', third: '', nth: ''),
        'nl': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
        'th': Ordinals(first: '', second: '', third: '', nth: ''),
        'sk': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
        'cs': Ordinals(first: '.', second: '.', third: '.', nth: '.'),
      };

      // Execute & Verify
      for (var entry in locales.entries) {
        // Verify that the ordinal locales also exist in Intl locales
        expect(() => verifyLocale(entry.key), returnsNormally);

        expect(getOrdinals(entry.key), entry.value);
      }
    });
  });
}
