import 'package:jiffy/src/locale/ordinals.dart';
import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:test/test.dart';

void main() {
  group('Ordinals', () {
    test('Should correctly return first for 1', () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Execute
      final result = ordinals.getOrdinal(1);

      // Verify
      expect(result, "st");
    });

    test('Should correctly return second for 2', () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Execute
      final result = ordinals.getOrdinal(2);

      // Verify
      expect(result, "nd");
    });

    test('Should correctly return third for 3', () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Execute
      final result = ordinals.getOrdinal(3);

      // Verify
      expect(result, "rd");
    });

    test(
        'Should correctly return nth for numbers greater than 3 and less than 11',
        () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Execute & Verify
      expect(ordinals.getOrdinal(4), "th");
      expect(ordinals.getOrdinal(10), "th");
      expect(ordinals.getOrdinal(11), "th");
    });

    test('Should correctly return nth for numbers greater than 13', () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Execute & Verify
      expect(ordinals.getOrdinal(14), "th");
      expect(ordinals.getOrdinal(20), "th");
      expect(ordinals.getOrdinal(100), "th");
    });

    test(
        'Should correctly return st, nd, rd for numbers 1,2,3 after 10,20,30 etc',
        () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Execute & Verify
      expect(ordinals.getOrdinal(21), "st");
      expect(ordinals.getOrdinal(32), "nd");
      expect(ordinals.getOrdinal(43), "rd");
    });

    test('Should throw JiffyException for zero or negative numbers', () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Execute & Verify
      expect(
          () => ordinals.getOrdinal(0),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains("The date must be a positive integer."))));
      expect(
          () => ordinals.getOrdinal(-5),
          throwsA(isA<JiffyException>().having((e) => e.toString(), 'message',
              contains("The date must be a positive integer."))));
    });

    test('Should correctly create Ordinals object', () {
      // Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");

      // Verify
      expect(ordinals.first, "st");
      expect(ordinals.second, "nd");
      expect(ordinals.third, "rd");
      expect(ordinals.nth, "th");
    });

    test('Should correctly implement equals and hashcode', () {
      // Setup
      final ordinals1 =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");
      final ordinals2 =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");
      final ordinals3 = Ordinals(first: "a", second: "b", third: "c", nth: "d");

      // Verify
      expect(ordinals1, equals(ordinals2));
      expect(ordinals1.hashCode, equals(ordinals2.hashCode));
      expect(ordinals1, isNot(equals(ordinals3)));
    });

    test('asList should return a correct list', () {
      //Setup
      final ordinals =
          Ordinals(first: "st", second: "nd", third: "rd", nth: "th");
      //Execute
      final list = ordinals.asList();

      //Verify
      expect(list, equals(["st", "nd", "rd", "th"]));
      expect(list.length, 4);
    });
  });
}
