import 'package:jiffy/src/locale/RelativeTime.dart';

abstract class Locale {

  // If a locale does not have ordinals return null
  List<String>? ordinals;

  String code();

  RelativeTime relativeTime();

  String ordinal(int day) {
    if (ordinals == null) return '';
    var suffix = ordinals!.last;
    var digit = day % 10;
    if ((digit > 0 && digit < 4) && (day < 11 || day > 13)) {
      suffix = ordinals![digit - 1];
    }
    return suffix;
  }
}