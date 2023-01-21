import '../../enums/startOfWeek.dart';
import '../locale.dart';
import '../relative_date_time.dart';

class EnLocale extends Locale {
  @override
  String code() => 'en';

  @override
  List<String> ordinals() =>
      List.from(['st', 'nd', 'rd', 'th'], growable: false);

  @override
  StartOfWeek startOfWeek() => StartOfWeek.SUNDAY;

  @override
  RelativeDateTime relativeDateTime() => EnRelativeTime();
}

class EnUsLocale extends EnLocale {
  @override
  String code() => 'en_us';
}

class EnSgLocale extends EnLocale {
  @override
  String code() => 'en_sg';
}

class EnAuLocale extends EnLocale {
  @override
  String code() => 'en_au';
}

class EnCaLocale extends EnLocale {
  @override
  String code() => 'en_ca';
}

class EnGbLocale extends EnLocale {
  @override
  String code() => 'en_gb';

  @override
  StartOfWeek startOfWeek() => StartOfWeek.MONDAY;
}

class EnIeLocale extends EnLocale {
  @override
  String code() => 'en_ie';

  @override
  StartOfWeek startOfWeek() => StartOfWeek.MONDAY;
}

class EnLiLocale extends EnLocale {
  @override
  String code() => 'en_li';
}

class EnNzLocale extends EnLocale {
  @override
  String code() => 'en_nz';
}

class EnRelativeTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => 'in';
  @override
  String suffixAgo() => 'ago';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'a few seconds';
  @override
  String aboutAMinute(int minutes) => 'a minute';
  @override
  String minutes(int minutes) => '$minutes minutes';
  @override
  String aboutAnHour(int minutes) => 'an hour';
  @override
  String hours(int hours) => '$hours hours';
  @override
  String aDay(int hours) => 'a day';
  @override
  String days(int days) => '$days days';
  @override
  String aboutAMonth(int days) => 'a month';
  @override
  String months(int months) => '$months months';
  @override
  String aboutAYear(int year) => 'a year';
  @override
  String years(int years) => '$years years';
  @override
  String wordSeparator() => ' ';
}
