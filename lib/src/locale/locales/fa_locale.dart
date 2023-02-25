import '../../enums/start_of_week.dart';
import '../../utils/replace.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class FaLocale extends Locale {
  @override
  String code() => 'fa';

  @override
  List<String> ordinals() => List.from(['م', 'م', 'م', 'م'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.saturday;

  @override
  RelativeDateTime relativeDateTime() => FaRelativeTime();
}

class FaRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'پیش';
  @override
  String suffixFromNow() => 'بعد';
  @override
  String lessThanOneMinute(int seconds) => 'چند ثانیه';
  @override
  String aboutAMinute(int minutes) => 'یک دقیقه';
  @override
  String minutes(int minutes) {
    String result;
    result = '$minutes دقیقه ';
    return replaceToLocaleNum(result, 'fa');
  }

  @override
  String aboutAnHour(int minutes) => 'یک ساعت';
  @override
  String hours(int hours) {
    String result;
    result = '$hours ساعت ';
    return replaceToLocaleNum(result, 'fa');
  }

  @override
  String aDay(int hours) => 'یک روز';
  @override
  String days(int days) {
    String result;
    result = '$days روز ';
    return replaceToLocaleNum(result, 'fa');
  }

  @override
  String aboutAMonth(int days) => 'یک ماه';
  @override
  String months(int months) {
    String result;
    result = '$months ماه ';
    return replaceToLocaleNum(result, 'fa');
  }

  @override
  String aboutAYear(int year) => 'یک سال';
  @override
  String years(int years) {
    String result;
    result = '$years سال ';
    return replaceToLocaleNum(result, 'fa');
  }

  @override
  String wordSeparator() => ' ';
}
