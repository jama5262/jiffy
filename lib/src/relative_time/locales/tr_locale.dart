import 'package:jiffy/src/relative_time/lookup_messages.dart';

class TrLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => 'önce';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'birkaç saniye';
  String aboutAMinute(int minutes) => 'dakika';
  String minutes(int minutes) => '$minutes dakika';
  String aboutAnHour(int minutes) => 'saat';
  String hours(int hours) => '$hours saat';
  String aDay(int hours) => 'gün';
  String days(int days) => '$days gün';
  String aboutAMonth(int days) => 'ay';
  String months(int months) => '$months ay';
  String aboutAYear(int year) => 'yıl';
  String years(int years) => '$years yıl';
  String wordSeparator() => ' ';
}
