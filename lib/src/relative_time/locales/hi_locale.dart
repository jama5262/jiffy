import 'package:jiffy/src/relative_time/lookup_messages.dart';
import 'package:jiffy/src/utils/replace_to_locale_num.dart';

class HiLocale extends LookUpMessages {
  String prefixAgo() => '';
  String prefixFromNow() => '';
  String suffixAgo() => 'पहले';
  String suffixFromNow() => 'में';
  String lessThanOneMinute(int seconds) => 'कुछ ही क्षण';
  String aboutAMinute(int minutes) => 'एक मिनट';
  String minutes(int minutes) {
    return replaceToLocaleNum('${minutes} मिनट', "hi");
  }

  String aboutAnHour(int minutes) => 'एक घंटा';
  String hours(int hours) {
    return replaceToLocaleNum('${hours} घंटे', "hi");
  }

  String aDay(int hours) => 'एक दिन';
  String days(int days) {
    return replaceToLocaleNum('${days} दिन', "hi");
  }

  String aboutAMonth(int days) => 'एक महीने';
  String months(int months) {
    return replaceToLocaleNum('${months} महीने', "hi");
  }

  String aboutAYear(int year) => 'एक वर्ष';
  String years(int years) {
    return replaceToLocaleNum('${years} वर्ष', "hi");
  }

  String wordSeparator() => ' ';
}
