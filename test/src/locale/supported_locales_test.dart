import 'package:jiffy/src/locale/supported_locales.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Test available locales', () {
    test('Should successfully return a list of available locales', () {
      // Setup
      final expectedSupportedLocales = supportedLocales();

      // Execute
      final actualSupportedLocales = getSupportedLocales();

      actualSupportedLocales.sort();
      expectedSupportedLocales.sort();

      // Verify
      expect(actualSupportedLocales, expectedSupportedLocales);
    });
  });
}

List<String> supportedLocales() {
  return [
    'en_us',
    'en',
    'en_sg',
    'en_au',
    'en_ca',
    'en_gb',
    'en_ie',
    'en_il',
    'en_nz',
    'es',
    'es_do',
    'es_us',
    'fr',
    'fr_ch',
    'fr_ca',
    'zh',
    'zh_cn',
    'zh_hk',
    'zh_tw',
    'de',
    'de_de',
    'de_at',
    'de_ch',
    'it',
    'it_ch',
    'ar',
    'ar_ly',
    'ar_dz',
    'ar_kw',
    'ar_sa',
    'ar_ma',
    'ar_tn',
    'az',
    'id',
    'ja',
    'ko',
    'ru',
    'uk',
    'hi',
    'hu',
    'hu_hu',
    'pt',
    'pt_br',
    'pl',
    'tr',
    'sv',
    'nb',
    'fa',
    'bn',
    'nl',
    'th',
    'sk',
    'cs',
  ];
}
