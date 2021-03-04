import 'package:jiffy/src/locale/RelativeTime.dart';

abstract class Locale {
  String code();
  RelativeTime relativeTime();
  // If a locale does not have ordinals return null
  List<String>? ordinals();
}