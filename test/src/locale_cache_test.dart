import 'package:jiffy/jiffy.dart';
import 'package:test/test.dart';

void main() {
  group('Locale cache invalidation', () {
    test('Should reflect locale change in default-display getters', () async {
      final dt = DateTime(1997, 9, 23);

      await Jiffy.setLocale('en');
      final enOutput = Jiffy.parseFromDateTime(dt).yMMMMd;

      await Jiffy.setLocale('fr');
      final frOutput = Jiffy.parseFromDateTime(dt).yMMMMd;

      expect(enOutput, isNot(equals(frOutput)));
      expect(enOutput, contains('September'));
      expect(frOutput, contains('septembre'));
    });

    test('Should reflect locale change in Display.format patterns', () async {
      final dt = DateTime(1997, 9, 23);
      const pattern = 'EEEE, MMMM d, yyyy';

      await Jiffy.setLocale('en');
      final enOutput = Jiffy.parseFromDateTime(dt).format(pattern: pattern);

      await Jiffy.setLocale('fr');
      final frOutput = Jiffy.parseFromDateTime(dt).format(pattern: pattern);

      expect(enOutput, isNot(equals(frOutput)));
      expect(enOutput, contains('September'));
      expect(frOutput, contains('septembre'));
    });

    test('Should round-trip locales without leaking cached state', () async {
      final dt = DateTime(1997, 9, 23);

      await Jiffy.setLocale('en');
      final en1 = Jiffy.parseFromDateTime(dt).yMMMMd;

      await Jiffy.setLocale('fr');
      Jiffy.parseFromDateTime(dt).yMMMMd; // warm the fr cache

      await Jiffy.setLocale('en');
      final en2 = Jiffy.parseFromDateTime(dt).yMMMMd;

      expect(en1, equals(en2));
    });

    test('Should pick up startOfWeek override for the same locale code',
        () async {
      await Jiffy.setLocale('en', startOfWeek: StartOfWeek.monday);
      expect(Jiffy.now().startOfWeek, StartOfWeek.monday);

      await Jiffy.setLocale('en', startOfWeek: StartOfWeek.sunday);
      expect(Jiffy.now().startOfWeek, StartOfWeek.sunday);
    });

    test('Should pick up relativeDateTime override on setLocale', () async {
      final dtFrom = DateTime(2025, 1, 1);
      final dtTo = DateTime(2025, 1, 1, 0, 1, 0);

      await Jiffy.setLocale('en');
      final enRelative = Jiffy.parseFromDateTime(dtFrom)
          .from(Jiffy.parseFromDateTime(dtTo));

      await Jiffy.setLocale('fr');
      final frRelative = Jiffy.parseFromDateTime(dtFrom)
          .from(Jiffy.parseFromDateTime(dtTo));

      expect(enRelative, isNot(equals(frRelative)));
    });

    test('Should keep dayOfYear and quarter locale-independent', () async {
      final dt = DateTime(1997, 9, 23);

      await Jiffy.setLocale('en');
      final enJ = Jiffy.parseFromDateTime(dt);

      await Jiffy.setLocale('bn');
      final bnJ = Jiffy.parseFromDateTime(dt);

      await Jiffy.setLocale('ar');
      final arJ = Jiffy.parseFromDateTime(dt);

      expect(enJ.dayOfYear, 266);
      expect(bnJ.dayOfYear, 266);
      expect(arJ.dayOfYear, 266);

      expect(enJ.quarter, 3);
      expect(bnJ.quarter, 3);
      expect(arJ.quarter, 3);
    });
  });
}
