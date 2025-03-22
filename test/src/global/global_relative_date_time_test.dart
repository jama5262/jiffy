import 'package:jiffy/src/global/global_relative_date_time.dart';
import 'package:jiffy/src/locale/relative_date_time.dart';
import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:jiffy/src/utils/verify_locale.dart';
import 'package:test/test.dart';

void main() {
  group('getRelativeDateTime', () {
    setUp(() async {
      defaultRelativeDateTime = null;
    });

    test('Should return default RelativeDateTime if set', () {
      // Setup
      final mockRdt = MockRelativeDateTime();
      defaultRelativeDateTime = mockRdt;

      // Execute
      final result = getRelativeDateTime('en');

      // Verify
      expect(result, mockRdt);
    });

    for (var testData in canonicalizedAndShortLocales()) {
      test('Should return RelativeDateTime for supported locale', () {
        // Execute
        final result = getRelativeDateTime(testData['locale']);

        // Verify
        expect(result, equals(testData['expectedRelativeDateTime']));
      });
    }

    test('Should return RelativeDateTime for pre set locales', () {
      // Setup
      final relativeDateTimes = {
        'en': EnRelativeDateTime(),
        'es': EsRelativeDateTime(),
        'fr': FrRelativeDateTime(),
        'zh': ZhRelativeDateTime(),
        'zh_CN': ZhCnRelativeDateTime(),
        'de': DeRelativeDateTime(),
        'it': ItRelativeDateTime(),
        'ar': ArRelativeDateTime(true),
        'ar_DZ': ArSaMaDzKwTnRelativeDateTime(false),
        'az': AzRelativeDateTime(),
        'id': IdRelativeDateTime(),
        'ja': JaRelativeDateTime(),
        'ko': KoRelativeDateTime(),
        'ru': RuRelativeDateTime(),
        'uk': UkRelativeDateTime(),
        'hi': HiRelativeDateTime(),
        'hu': HuRelativeDateTime(),
        'pt': PtRelativeDateTime(),
        'pl': PlRelativeDateTime(),
        'tr': TrRelativeDateTime(),
        'sv': SvRelativeDateTime(),
        'nb': NbRelativeDateTime(),
        'fa': FaRelativeDateTime(),
        'bn': BnRelativeDateTime(),
        'nl': NlRelativeDateTime(),
        'th': ThRelativeDateTime(),
        'sk': SkRelativeDateTime(),
        'cs': CsRelativeDateTime(),
      };

      // Execute & Verify
      for (var entry in relativeDateTimes.entries) {
        // Verify that the relative date time locales also exist in Intl locales
        expect(() => verifyLocale(entry.key), returnsNormally);

        expect(getRelativeDateTime(entry.key), entry.value);
      }
    });

    test('Should throw JiffyException for unsupported locale', () {
      // Setup
      final unsupportedLocale = 'xyz';

      // Execute & Verify
      expect(
          () => getRelativeDateTime(unsupportedLocale),
          throwsA(isA<JiffyException>().having(
              (e) => e.toString(),
              'message',
              contains(
                  "Locale `$unsupportedLocale` is not supported for relative date time formatting."))));
    });
  });
}

List<Map<String, dynamic>> canonicalizedAndShortLocales() {
  return [
    {'locale': 'en', 'expectedRelativeDateTime': EnRelativeDateTime()},
    {'locale': 'en_us', 'expectedRelativeDateTime': EnRelativeDateTime()},
    {'locale': 'en-US', 'expectedRelativeDateTime': EnRelativeDateTime()},
    {'locale': 'en_US', 'expectedRelativeDateTime': EnRelativeDateTime()},
    {'locale': 'en_XYZ', 'expectedRelativeDateTime': EnRelativeDateTime()}
  ];
}

class MockRelativeDateTime extends EnRelativeDateTime {
  String fromNow(DateTime dateTime) => "Mock fromNow";

  String fromDateTime(DateTime from, DateTime to) => "Mock fromDateTime";
}
