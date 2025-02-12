import 'package:jiffy/src/global/global_relative_date_time.dart';
import 'package:jiffy/src/locale/relative_date_time.dart';
import 'package:jiffy/src/utils/jiffy_exception.dart';
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

    test('Should return RelativeDateTime for supported locale (canonicalized)',
        () {
      // Execute
      final result = getRelativeDateTime('zh_CN');

      // Verify
      expect(result, isA<ZhCnRelativeDateTime>());
    });

    test('Should return RelativeDateTime for supported locale (short)', () {
      // Execute
      final result = getRelativeDateTime('zh_CH');

      // Verify
      expect(result, isA<ZhRelativeDateTime>());
    });

    test('Should return RelativeDateTime for specific locale', () {
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
        'ar_LY': ArRelativeDateTime(false),
        'ar_DZ': ArSaMaDzKwTnRelativeDateTime(false),
        'ar_KW': ArSaMaDzKwTnRelativeDateTime(false),
        'ar_SA': ArSaMaDzKwTnRelativeDateTime(true),
        'ar_MA': ArSaMaDzKwTnRelativeDateTime(false),
        'ar_TN': ArSaMaDzKwTnRelativeDateTime(false),
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
                  "Locale `$unsupportedLocale` is not supported for relative date formatting."))));
    });
  });
}

class MockRelativeDateTime extends EnRelativeDateTime {
  String fromNow(DateTime dateTime) => "Mock fromNow";

  String fromDateTime(DateTime from, DateTime to) => "Mock fromDateTime";
}
