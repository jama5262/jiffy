import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('New locale tests', () {
    // Oriya (or)
    group('Oriya (or) tests', () {
      test('Test Oriya (or) locale formatting', () async {
        await Jiffy.setLocale('or');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'ଦିନେ ତଳେ');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'ଦିନେ ପରେ');
        expect(
            Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'ମିନିଟେ ତଳେ');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'ମିନିଟେ ପରେ');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'ମାସେ ତଳେ');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            '5 ଦିନ ତଳେ');
      });
      test('Test Oriya (or) locale ordinals', () async {
        await Jiffy.setLocale('or');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1ମ');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2ୟ');
        expect(Jiffy.parseFromList([2020, 1, 3]).format(pattern: 'do'), '3ୟ');
      });
    });

    // Punjabi (pa)
    group('Punjabi (pa) tests', () {
      test('Test Punjabi (pa) locale formatting', () async {
        await Jiffy.setLocale('pa');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            '1 ਦਿਨ ਪਹਿਲਾਂ');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            '1 ਦਿਨ ਵਿੱਚ');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            '5 ਦਿਨ ਪਹਿਲਾਂ');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(hours: 2).fromNow(),
            '2 ਘੰਟੇ ਵਿੱਚ');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            '1 ਮਿੰਟ ਪਹਿਲਾਂ');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            '1 ਮਿੰਟ ਵਿੱਚ');
      });
      test('Test Punjabi (pa) locale ordinals', () async {
        await Jiffy.setLocale('pa');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2');
      });
    });

    // Marathi (mr)
    group('Marathi (mr) tests', () {
      test('Test Marathi (mr) locale formatting', () async {
        await Jiffy.setLocale('mr');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            '१ दिवसापूर्वी');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            '१ दिवसामध्ये');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            '१ मिनिटापूर्वी');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            '१ मिनिटामध्ये');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(years: 1).fromNow(),
            '१ वर्षामध्ये');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            '५ दिवसांपूर्वी');
      });
      test('Test Marathi (mr) locale ordinals', () async {
        await Jiffy.setLocale('mr');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '१');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '२');
      });
    });

    // Sinhala (si)
    group('Sinhala (si) tests', () {
      test('Test Sinhala (si) locale formatting', () async {
        await Jiffy.setLocale('si');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'දින 1 කට පෙර');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'දින 1 කින්');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'මිනිත්තු 1 කට පෙර');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'මිනිත්තු 1 කින්');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'මාස 1 කට පෙර');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'දින 5 කට පෙර');
      });
      test('Test Sinhala (si) locale ordinals', () async {
        await Jiffy.setLocale('si');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2');
      });
    });

    // Malay (ms)
    group('Malay (ms) tests', () {
      test('Test Malay (ms) locale formatting', () async {
        await Jiffy.setLocale('ms');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Malay (ms) locale ordinals', () async {
        await Jiffy.setLocale('ms');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Swahili (sw)
    group('Swahili (sw) tests', () {
      test('Test Swahili (sw) locale formatting', () async {
        await Jiffy.setLocale('sw');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Swahili (sw) locale ordinals', () async {
        await Jiffy.setLocale('sw');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Tamil (ta)
    group('Tamil (ta) tests', () {
      test('Test Tamil (ta) locale formatting', () async {
        await Jiffy.setLocale('ta');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Tamil (ta) locale ordinals', () async {
        await Jiffy.setLocale('ta');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Telugu (te)
    group('Telugu (te) tests', () {
      test('Test Telugu (te) locale formatting', () async {
        await Jiffy.setLocale('te');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Telugu (te) locale ordinals', () async {
        await Jiffy.setLocale('te');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Kannada (kn)
    group('Kannada (kn) tests', () {
      test('Test Kannada (kn) locale formatting', () async {
        await Jiffy.setLocale('kn');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Kannada (kn) locale ordinals', () async {
        await Jiffy.setLocale('kn');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Malayalam (ml)
    group('Malayalam (ml) tests', () {
      test('Test Malayalam (ml) locale formatting', () async {
        await Jiffy.setLocale('ml');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Malayalam (ml) locale ordinals', () async {
        await Jiffy.setLocale('ml');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Vietnamese (vi)
    group('Vietnamese (vi) tests', () {
      test('Test Vietnamese (vi) locale formatting', () async {
        await Jiffy.setLocale('vi');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Vietnamese (vi) locale ordinals', () async {
        await Jiffy.setLocale('vi');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Urdu (ur)
    group('Urdu (ur) tests', () {
      test('Test Urdu (ur) locale formatting', () async {
        await Jiffy.setLocale('ur');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Urdu (ur) locale ordinals', () async {
        await Jiffy.setLocale('ur');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Gujarati (gu)
    group('Gujarati (gu) tests', () {
      test('Test Gujarati (gu) locale formatting', () async {
        await Jiffy.setLocale('gu');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Gujarati (gu) locale ordinals', () async {
        await Jiffy.setLocale('gu');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Romanian (ro)
    group('Romanian (ro) tests', () {
      test('Test Romanian (ro) locale formatting', () async {
        await Jiffy.setLocale('ro');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Romanian (ro) locale ordinals', () async {
        await Jiffy.setLocale('ro');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Uzbek (uz)
    group('Uzbek (uz) tests', () {
      test('Test Uzbek (uz) locale formatting', () async {
        await Jiffy.setLocale('uz');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'a day ago');
      });
      test('Test Uzbek (uz) locale ordinals', () async {
        await Jiffy.setLocale('uz');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Amharic (am)
    group('Amharic (am) tests', () {
      test('Test Amharic (am) locale formatting', () async {
        await Jiffy.setLocale('am');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'ከ 1 ቀን በፊት');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'በ 1 ቀን ውስጥ');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'ከ 1 ደቂቃ በፊት');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'በ 1 ደቂቃ ውስጥ');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'ከ 1 ወር በፊት');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(years: 1).fromNow(),
            'በ 1 ዓመት ውስጥ');
      });
      test('Test Amharic (am) locale ordinals', () async {
        await Jiffy.setLocale('am');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2');
      });
    });

    // Kazakh (kk)
    group('Kazakh (kk) tests', () {
      test('Test Kazakh (kk) locale formatting', () async {
        await Jiffy.setLocale('kk');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            '1 күн бұрын');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            '1 күннен кейін');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            '1 минут бұрын');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            '1 минуттан кейін');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            '1 ай бұрын');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            '5 күн бұрын');
      });
      test('Test Kazakh (kk) locale ordinals', () async {
        await Jiffy.setLocale('kk');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1-ші');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2-ші');
      });
    });

    // Greek (el)
    group('Greek (el) tests', () {
      test('Test Greek (el) locale formatting', () async {
        await Jiffy.setLocale('el');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'πριν από 1 μέρα');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'σε 1 μέρα');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'πριν από 1 λεπτό');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'σε 1 λεπτό');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'πριν από 1 μήνα');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'πριν από 5 μέρες');
      });
      test('Test Greek (el) locale ordinals', () async {
        await Jiffy.setLocale('el');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1η');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2η');
      });
    });

    // Tagalog (tl)
    group('Tagalog (tl) tests', () {
      test('Test Tagalog (tl) locale formatting', () async {
        await Jiffy.setLocale('tl');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'nakaraang 1 araw');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'sa 1 araw');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'nakaraang 1 minuto');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'sa 1 minuto');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'nakaraang 1 buwan');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'nakaraang 5 araw');
      });
      test('Test Tagalog (tl) locale ordinals', () async {
        await Jiffy.setLocale('tl');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2');
      });
    });

    // Hebrew (he)
    group('Hebrew (he) tests', () {
      test('Test Hebrew (he) locale formatting', () async {
        await Jiffy.setLocale('he');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'לפני יום');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'בעוד יום');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'לפני דקה');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'בעוד דקה');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'לפני חודש');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'לפני 5 ימים');
      });
      test('Test Hebrew (he) locale ordinals', () async {
        await Jiffy.setLocale('he');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2');
      });
    });

    // Norwegian (no) - uses NbRelativeDateTime
    group('Norwegian (no) tests', () {
      test('Test Norwegian (no) locale formatting', () async {
        await Jiffy.setLocale(
            'no'); // Should use NbRelativeDateTime via global config
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'en dag siden');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'om en dag');
        expect(
            Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'ett minutt siden');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'om ett minutt');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'en måned siden');
      });
      test('Test Norwegian (no) locale ordinals', () async {
        await Jiffy.setLocale('no'); // Should use NbOrdinals via global config
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1.');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2.');
      });
    });

    // Finnish (fi)
    group('Finnish (fi) tests', () {
      test('Test Finnish (fi) locale formatting', () async {
        await Jiffy.setLocale('fi');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'päivä sitten');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'päivän päästä');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'minuutti sitten');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 3).fromNow(),
            '3 päivää sitten');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'kuukausi sitten');
      });
      test('Test Finnish (fi) locale ordinals', () async {
        await Jiffy.setLocale('fi');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1.');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2.');
        expect(Jiffy.parseFromList([2020, 1, 3]).format(pattern: 'do'), '3.');
      });
    });

    // Danish (da)
    group('Danish (da) tests', () {
      test('Test Danish (da) locale formatting', () async {
        await Jiffy.setLocale('da');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'for 1 dag siden');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'om 1 dag');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'for 1 minut siden');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'om 1 minut');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'for 1 måned siden');
      });
      test('Test Danish (da) locale ordinals', () async {
        await Jiffy.setLocale('da');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1.');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2.');
      });
    });

    // Lithuanian (lt)
    group('Lithuanian (lt) tests', () {
      test('Test Lithuanian (lt) locale formatting', () async {
        await Jiffy.setLocale('lt');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'prieš dieną');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'po dienos');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'prieš minutę');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'po minutės');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'prieš mėnesį');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'prieš 5 dienas');
      });
      test('Test Lithuanian (lt) locale ordinals', () async {
        await Jiffy.setLocale('lt');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1-oji');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2-oji');
        expect(Jiffy.parseFromList([2020, 1, 10]).format(pattern: 'do'), '10-oji');
      });
    });

    // Slovenian (sl)
    group('Slovenian (sl) tests', () {
      test('Test Slovenian (sl) locale formatting', () async {
        await Jiffy.setLocale('sl');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'pred 1 dnevom');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'čez 1 dan');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'pred 1 minuto');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'čez 1 minuto');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'pred 1 mesecem');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'pred 5 dnevi');
      });
      test('Test Slovenian (sl) locale ordinals', () async {
        await Jiffy.setLocale('sl');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1.');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2.');
      });
    });

    // Croatian (hr)
    group('Croatian (hr) tests', () {
      test('Test Croatian (hr) locale formatting', () async {
        await Jiffy.setLocale('hr');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'prije 1 dan');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'za 1 dan');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'prije 1 minutu');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'za 1 minutu');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'prije 1 mjesec');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'prije 5 dana');
      });
      test('Test Croatian (hr) locale ordinals', () async {
        await Jiffy.setLocale('hr');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1.');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2.');
      });
    });

    // Catalan (ca)
    group('Catalan (ca) tests', () {
      test('Test Catalan (ca) locale formatting', () async {
        await Jiffy.setLocale('ca');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'fa 1 dia');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'd\'aquí a 1 dia');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'fa 1 minut');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'd\'aquí a 1 minut');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'fa 1 mes');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'fa 5 dies');
      });
      test('Test Catalan (ca) locale ordinals', () async {
        await Jiffy.setLocale('ca');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1r');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2n');
        expect(Jiffy.parseFromList([2020, 1, 3]).format(pattern: 'do'), '3r');
        expect(Jiffy.parseFromList([2020, 1, 4]).format(pattern: 'do'), '4t');
      });
    });

    // Serbian (sr)
    group('Serbian (sr) tests', () {
      test('Test Serbian (sr) locale formatting', () async {
        await Jiffy.setLocale('sr');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'пре 1 дан');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(days: 1).fromNow(),
            'за 1 дан');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(minutes: 1).fromNow(),
            'пре 1 минут');
        expect(Jiffy.parseFromList([2000, 1, 15]).add(minutes: 1).fromNow(),
            'за 1 минут');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(months: 1).fromNow(),
            'пре 1 месец');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 5).fromNow(),
            'пре 5 дана');
      });
      test('Test Serbian (sr) locale ordinals', () async {
        await Jiffy.setLocale('sr');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1.');
        expect(Jiffy.parseFromList([2020, 1, 2]).format(pattern: 'do'), '2.');
      });
    });

    // Bulgarian (bg)
    group('Bulgarian (bg) tests', () {
      test('Test Bulgarian (bg) locale formatting', () async {
        await Jiffy.setLocale('bg');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'преди един ден');
      });
      test('Test Bulgarian (bg) locale ordinals', () async {
        await Jiffy.setLocale('bg');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Georgian (ka)
    group('Georgian (ka) tests', () {
      test('Test Georgian (ka) locale formatting', () async {
        await Jiffy.setLocale('ka');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'ერთი დღე წინ');
      });
      test('Test Georgian (ka) locale ordinals', () async {
        await Jiffy.setLocale('ka');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Estonian (et)
    group('Estonian (et) tests', () {
      test('Test Estonian (et) locale formatting', () async {
        await Jiffy.setLocale('et');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'üks päev tagasi');
      });
      test('Test Estonian (et) locale ordinals', () async {
        await Jiffy.setLocale('et');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Basque (eu)
    group('Basque (eu) tests', () {
      test('Test Basque (eu) locale formatting', () async {
        await Jiffy.setLocale('eu');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'duela egun bat');
      });
      test('Test Basque (eu) locale ordinals', () async {
        await Jiffy.setLocale('eu');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });

    // Galician (gl)
    group('Galician (gl) tests', () {
      test('Test Galician (gl) locale formatting', () async {
        await Jiffy.setLocale('gl');
        expect(Jiffy.parseFromList([2000, 1, 15]).subtract(days: 1).fromNow(),
            'hai un día');
      });
      test('Test Galician (gl) locale ordinals', () async {
        await Jiffy.setLocale('gl');
        expect(Jiffy.parseFromList([2020, 1, 1]).format(pattern: 'do'), '1');
      });
    });
  });
}
