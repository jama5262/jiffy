import 'package:jiffy/src/relative_time/lookup_messages.dart';
import 'package:jiffy/src/utils/replace.dart';

class ArLyLocale extends LookUpMessages {
  bool replaceNum;
  ArLyLocale(this.replaceNum);

  String prefixAgo() => 'منذ';
  String prefixFromNow() => 'بعد';
  String suffixAgo() => '';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'ثانية واحدة';
  String aboutAMinute(int minutes) => 'دقيقة واحدة';
  String minutes(int minutes) {
    String result;
    if (minutes == 1) {
      result = 'دقيقة واحدة';
    } else if (minutes == 2) {
      result = 'دقيقتين';
    } else if (minutes > 2 && minutes < 11) {
      result = '$minutes دقائق ';
    } else if (minutes > 10) {
      result = '$minutes دقيقة ';
    } else {
      result = '$minutes دقائق ';
    }
    return this.replaceNum ? replaceToLocaleNum(result, "ar") : result;
  }

  String aboutAnHour(int minutes) => 'ساعة واحدة';
  String hours(int hours) {
    String result;
    if (hours == 1) {
      result = 'ساعة واحدة';
    } else if (hours == 2) {
      result = ' ساعتين';
    } else if (hours > 2 && hours < 11) {
      result = '$hours ساعات ';
    } else if (hours > 10) {
      result = '$hours ساعة ';
    } else {
      result = '$hours ساعات ';
    }
    return this.replaceNum ? replaceToLocaleNum(result, "ar") : result;
  }

  String aDay(int hours) => 'يوم واحد';
  String days(int days) {
    String result;
    if (days == 1) {
      result = ' يوم واحد';
    } else if (days == 2) {
      result = ' يومين';
    } else if (days > 2 && days < 11) {
      result = '$days ايام ';
    } else if (days > 10) {
      result = '$days يوم ';
    } else {
      result = '$days ايام ';
    }
    return this.replaceNum ? replaceToLocaleNum(result, "ar") : result;
  }

  String aboutAMonth(int days) => 'شهر واحد';
  String months(int months) {
    String result;
    if (months == 1) {
      result = 'شهر واحد';
    } else if (months == 2) {
      result = 'شهرين';
    } else if (months > 2 && months < 11) {
      result = '$months اشهر ';
    } else if (months > 10) {
      result = '$months شهر ';
    } else {
      result = '$months شهور ';
    }
    return this.replaceNum ? replaceToLocaleNum(result, "ar") : result;
  }

  String aboutAYear(int year) => 'عام واحد';
  String years(int years) {
    String result;
    if (years == 1) {
      result = 'عام واحد';
    } else if (years == 2) {
      result = 'عامين';
    } else if (years > 2 && years < 11) {
      result = '$years أعوام ';
    } else if (years > 10) {
      result = '$years عامًا ';
    } else {
      result = '$years أعوام ';
    }
    return this.replaceNum ? replaceToLocaleNum(result, "ar") : result;
  }

  String wordSeparator() => ' ';
}

class ArSaMaDzKwTnLocale extends LookUpMessages {
  bool replaceNum;
  ArSaMaDzKwTnLocale(this.replaceNum);

  String prefixAgo() => 'منذ';
  String prefixFromNow() => 'في';
  String suffixAgo() => '';
  String suffixFromNow() => '';
  String lessThanOneMinute(int seconds) => 'ثوان';
  String aboutAMinute(int minutes) => 'دقيقة';
  String minutes(int minutes) {
    return this.replaceNum
        ? replaceToLocaleNum('$minutes دقائق ', "ar")
        : '$minutes دقائق ';
  }

  String aboutAnHour(int minutes) => 'ساعة';
  String hours(int hours) {
    return this.replaceNum
        ? replaceToLocaleNum('$hours ساعات ', "ar")
        : '$hours ساعات ';
  }

  String aDay(int hours) => 'يوم';
  String days(int days) {
    return this.replaceNum
        ? replaceToLocaleNum('$days أيام ', "ar")
        : '$days أيام ';
  }

  String aboutAMonth(int days) => 'شهر';
  String months(int months) {
    return this.replaceNum
        ? replaceToLocaleNum('$months أشهر ', "ar")
        : '$months أشهر ';
  }

  String aboutAYear(int year) => 'سنة';
  String years(int years) {
    return this.replaceNum
        ? replaceToLocaleNum('$years سنوات ', "ar")
        : '$years سنوات ';
  }

  String wordSeparator() => ' ';
}
