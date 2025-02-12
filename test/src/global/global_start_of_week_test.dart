import 'package:jiffy/src/enums/start_of_week.dart';
import 'package:jiffy/src/global/global_start_of_week.dart';
import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:test/test.dart';

void main() {
  setUp(() async {
    defaultStartOfWeek = null;
  });

  group('getStartOfWeek', () {
    test('Should return default StartOfWeek if set', () {
      // Setup
      defaultStartOfWeek = StartOfWeek.monday;

      // Execute
      final result = getStartOfWeek('en_US');

      // Verify
      expect(result, StartOfWeek.monday);
    });

    test('Should return correct start of week for locale', () {
      // Setup
      final startOfWeekTestData = {
        "fa": StartOfWeek.saturday,
        "af": StartOfWeek.sunday,
        "de_AT": StartOfWeek.monday,
      };

      // Execute and Verify
      for (var entry in startOfWeekTestData.entries) {
        expect(getStartOfWeek(entry.key), entry.value);
      }
    });

    test('Should throw JiffyException for unsupported locale', () {
      // Setup
      final unsupportedLocale = 'unsupported_locale';

      // Execute & Verify
      expect(
          () => getStartOfWeek(unsupportedLocale),
          throwsA(isA<JiffyException>().having(
              (e) => e.toString(),
              'message',
              contains(
                  "The specified locale '$unsupportedLocale' is not supported."))));
    });
  });
}
