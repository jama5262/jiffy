import 'package:jiffy/src/relative_time/lookup_messages.dart';
import 'package:jiffy/src/utils/replace.dart';

class HiLocale extends LookUpMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => 'पहले';
  @override
  String suffixFromNow() => 'में';
  @override
  String lessThanOneMinute(int seconds) => 'कुछ ही क्षण';
  @override
  String aboutAMinute(int minutes) => 'एक मिनट';
  @override
  String minutes(int minutes) {
    return replaceToLocaleNum('$minutes मिनट', 'hi');
  }

  @override
  String aboutAnHour(int minutes) => 'एक घंटा';
  @override
  String hours(int hours) {
    return replaceToLocaleNum('$hours घंटे', 'hi');
  }

  @override
  String aDay(int hours) => 'एक दिन';
  @override
  String days(int days) {
    return replaceToLocaleNum('$days दिन', 'hi');
  }

  @override
  String aboutAMonth(int days) => 'एक महीने';
  @override
  String months(int months) {
    return replaceToLocaleNum('$months महीने', 'hi');
  }

  @override
  String aboutAYear(int year) => 'एक वर्ष';
  @override
  String years(int years) {
    return replaceToLocaleNum('$years वर्ष', 'hi');
  }

  @override
  String wordSeparator() => ' ';
}
