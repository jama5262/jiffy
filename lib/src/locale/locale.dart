import '../enums/startOfWeek.dart';
import 'relative_date_time.dart';

abstract class Locale {
  String code();

  List<String> ordinals();

  StartOfWeek startOfWeek();

  RelativeDateTime relativeDateTime();
}
