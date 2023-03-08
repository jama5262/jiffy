import '../../enums/start_of_week.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class PlLocale extends Locale {
  @override
  String code() => 'pl';

  @override
  List<String> ordinals() => List.from(['.', '.', '.', '.'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.monday;

  @override
  RelativeDateTime relativeDateTime() => PlRelativeTime();
}

class PlRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'za';
  @override
  String suffixAgo() => 'temu';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'kilka sekund';
  @override
  String aboutAMinute(int minutes) => 'minutę';
  @override
  String minutes(int minutes) {
    String result;
    if (minutes >= 1 && minutes <= 4) {
      result = 'minuty';
    } else {
      result = 'minut';
    }
    return '$minutes $result';
  }

  @override
  String aboutAnHour(int minutes) => 'godzinę';
  @override
  String hours(int hours) {
    String result;
    if (hours >= 1 && hours <= 4) {
      result = 'godziny';
    } else {
      result = 'godzin';
    }
    return '$hours $result';
  }

  @override
  String aDay(int hours) => '1 dzień';
  @override
  String days(int days) => '$days dni';
  @override
  String aboutAMonth(int days) => 'miesiąc';
  @override
  String months(int months) {
    String result;
    if (months >= 1 && months <= 4) {
      result = 'miesiące';
    } else {
      result = 'miesięcy';
    }
    return '$months $result';
  }

  @override
  String aboutAYear(int year) => 'rok';
  @override
  String years(int years) {
    String result;
    if (years >= 1 && years <= 4) {
      result = 'lata';
    } else {
      result = 'lat';
    }
    return '$years $result';
  }

  @override
  String wordSeparator() => ' ';
}
