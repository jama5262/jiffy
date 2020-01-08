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
  String aDay(int hours) => '1 dzień';
  String days(int days) => '$days dni';
  String aboutAMonth(int days) => 'miesiąc';
  String months(int months) {
    String result;
    if(months >= 1 && months <= 4) {
      result = "miesiące";
    } else {
      result = "miesięcy";
    }
    return "$months $result";
  }
  String aboutAYear(int year) => 'rok';
  String years(int years) {
    String result;
    if(years >= 1 && years <= 4) {
      result = "lata";
    } else {
      result = "lat";
    }
    return "$years $result";
  }
  String wordSeparator() => ' ';
}
