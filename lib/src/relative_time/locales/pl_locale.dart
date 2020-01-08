import 'package:jiffy/src/relative_time/lookup_messages.dart';

class PlLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => 'za';
  String suffixAgo() => 'temu';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'kilka sekund';
  String aboutAMinute(int minutes) => 'minutę';
  String minutes(int minutes) {
    String result;
    if(minutes >= 1 && minutes <= 4) {
      result = "minuty";
    } else {
      result = "minut";
    }
    return "$minutes $result";
  }
  String aboutAnHour(int minutes) => 'godzinę';
  String hours(int hours) {
    String result;
    if(hours >= 1 && hours <= 4) {
      result = "godziny";
    } else {
      result = "godzin";
    }
    return "$hours $result";
  }
  String aDay(int hours) => 'dzień temu';
  String days(int days) => '$days dni';
  String aboutAMonth(int days) => 'miesiąc temu';
  String months(int months) => '$months msc';
  String aboutAYear(int year) => 'rok temu';
  String years(int years) => '$years lat';
  String wordSeparator() => ' ';
}
