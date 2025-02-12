import 'package:jiffy/src/utils/jiffy_exception.dart';
import 'package:quiver/core.dart';

class Ordinals {
  final String first;
  final String second;
  final String third;
  final String nth;

  Ordinals({
    required this.first,
    required this.second,
    required this.third,
    required this.nth,
  });

  String getOrdinal(int date) {
    if (date <= 0) throw JiffyException('The date must be a positive integer.');
    final ordinals = asList();
    var suffix = ordinals.last;
    final digit = date % 10;
    if ((digit > 0 && digit < 4) && (date < 11 || date > 13)) {
      suffix = ordinals[digit - 1];
    }
    return suffix;
  }

  List<String> asList() =>
      List.from([first, second, third, nth], growable: false);

  @override
  bool operator ==(Object other) => (other is Ordinals)
      ? (first == other.first &&
          second == other.second &&
          third == other.third &&
          nth == other.nth)
      : false;

  @override
  int get hashCode => hash4(first, second, third, nth);
}
