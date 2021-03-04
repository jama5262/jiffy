import 'package:jiffy/src/locale/locale.dart';
import 'package:jiffy/src/locale/relativeTime.dart';
import 'package:jiffy/src/utils/replace.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';

class FaLocale extends Locale {
  bool replaceNum;
  StartOfWeek strtOfWeek;
  FaLocale(this.replaceNum, this.strtOfWeek);

  @override
  RelativeTime relativeTime() => FaRelativeTime(replaceNum);

  @override
  List<String>? ordinals() => ['م', 'م', 'م', 'م'];

  @override
  StartOfWeek startOfWeek() => strtOfWeek;
}

class FaRelativeTime extends RelativeTime {
  bool replaceNum;
  FaRelativeTime(this.replaceNum);

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
    return replaceNum ? replaceToLocaleNum(result, 'fa') : result;
  }

  @override
  String aboutAnHour(int minutes) => 'یک ساعت';
  @override
  String hours(int hours) {
    String result;
    result = '$hours ساعت ';
    return replaceNum ? replaceToLocaleNum(result, 'fa') : result;
  }

  @override
  String aDay(int hours) => 'یک روز';
  @override
  String days(int days) {
    String result;
    result = '$days روز ';
    return replaceNum ? replaceToLocaleNum(result, 'fa') : result;
  }

  @override
  String aboutAMonth(int days) => 'یک ماه';
  @override
  String months(int months) {
    String result;
    result = '$months ماه ';
    return replaceNum ? replaceToLocaleNum(result, 'fa') : result;
  }

  @override
  String aboutAYear(int year) => 'یک سال';
  @override
  String years(int years) {
    String result;
    result = '$years سال ';
    return replaceNum ? replaceToLocaleNum(result, 'fa') : result;
  }

  @override
  String wordSeparator() => ' ';
}
