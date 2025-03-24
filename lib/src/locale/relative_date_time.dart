import 'package:quiver/core.dart';
import '../../jiffy.dart';

abstract class RelativeDateTime {
  String prefixAgo();

  String prefixFromNow();

  String suffixAgo();

  String suffixFromNow();

  String lessThanOneMinute(int seconds);

  String aboutAMinute(int minutes);

  String minutes(int minutes);

  String aboutAnHour(int minutes);

  String hours(int hours);

  String aDay(int hours);

  String days(int days);

  String aboutAMonth(int days);

  String months(int months);

  String aboutAYear(int year);

  String years(int years);

  String wordSeparator();

  @override
  bool operator ==(Object other) => (other is RelativeDateTime);

  @override
  int get hashCode => hashObjects([this]);
}

class EnRelativeDateTime extends RelativeDateTime {
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

class EsRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'hace';

  @override
  String prefixFromNow() => 'en';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'un momento';

  @override
  String aboutAMinute(int minutes) => 'un minuto';

  @override
  String minutes(int minutes) => '$minutes minutos';

  @override
  String aboutAnHour(int minutes) => 'una hora';

  @override
  String hours(int hours) => '$hours horas';

  @override
  String aDay(int hours) => 'un día';

  @override
  String days(int days) => '$days días';

  @override
  String aboutAMonth(int days) => 'un mes';

  @override
  String months(int months) => '$months meses';

  @override
  String aboutAYear(int year) => 'un año';

  @override
  String years(int years) => '$years años';

  @override
  String wordSeparator() => ' ';
}

class FrRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'il y a';

  @override
  String prefixFromNow() => 'dans';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'quelques secondes';

  @override
  String aboutAMinute(int minutes) => 'une minute';

  @override
  String minutes(int minutes) => '$minutes minutes';

  @override
  String aboutAnHour(int minutes) => 'une heure';

  @override
  String hours(int hours) => '$hours heures';

  @override
  String aDay(int hours) => 'un jour';

  @override
  String days(int days) => '$days jours';

  @override
  String aboutAMonth(int days) => 'un mois';

  @override
  String months(int months) => '$months mois';

  @override
  String aboutAYear(int year) => 'un an';

  @override
  String years(int years) => '$years ans';

  @override
  String wordSeparator() => ' ';
}

class ZhRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => '前';

  @override
  String suffixFromNow() => '内';

  @override
  String lessThanOneMinute(int seconds) => '幾秒';

  @override
  String aboutAMinute(int minutes) => '1 分鐘';

  @override
  String minutes(int minutes) => '$minutes 分鐘';

  @override
  String aboutAnHour(int minutes) => '1 小時';

  @override
  String hours(int hours) => '$hours 小時';

  @override
  String aDay(int hours) => '1 天';

  @override
  String days(int days) => '$days 天';

  @override
  String aboutAMonth(int days) => '1 個月';

  @override
  String months(int months) => '$months 個月';

  @override
  String aboutAYear(int year) => '1 年';

  @override
  String years(int years) => '$years 年';

  @override
  String wordSeparator() => '';
}

class ZhCnRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => '前';

  @override
  String suffixFromNow() => '内';

  @override
  String lessThanOneMinute(int seconds) => '几秒';

  @override
  String aboutAMinute(int minutes) => '1 分钟';

  @override
  String minutes(int minutes) => '$minutes 分钟';

  @override
  String aboutAnHour(int minutes) => '1 小时';

  @override
  String hours(int hours) => '$hours 小时';

  @override
  String aDay(int hours) => '1 天';

  @override
  String days(int days) => '$days 天';

  @override
  String aboutAMonth(int days) => '1 个月';

  @override
  String months(int months) => '$months 个月';

  @override
  String aboutAYear(int year) => '1 年';

  @override
  String years(int years) => '$years 年';

  @override
  String wordSeparator() => '';
}

class DeRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'vor';

  @override
  String prefixFromNow() => 'in';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'ein paar Sekunden';

  @override
  String aboutAMinute(int minutes) => 'einer Minute';

  @override
  String minutes(int minutes) => '$minutes Minuten';

  @override
  String aboutAnHour(int minutes) => 'einer Stunde';

  @override
  String hours(int hours) => '$hours Stunden';

  @override
  String aDay(int hours) => 'einem Tag';

  @override
  String days(int days) => '$days Tagen';

  @override
  String aboutAMonth(int days) => 'einem Monat';

  @override
  String months(int months) => '$months Monaten';

  @override
  String aboutAYear(int year) => 'einem Jahr';

  @override
  String years(int years) => '$years Jahren';

  @override
  String wordSeparator() => ' ';
}

class ItRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'tra';

  @override
  String suffixAgo() => 'fa';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'alcuni secondi';

  @override
  String aboutAMinute(int minutes) => 'un minuto';

  @override
  String minutes(int minutes) => '$minutes minuti';

  @override
  String aboutAnHour(int minutes) => 'un\'ora';

  @override
  String hours(int hours) => '$hours ore';

  @override
  String aDay(int hours) => 'un giorno';

  @override
  String days(int days) => '$days giorni';

  @override
  String aboutAMonth(int days) => 'un mese';

  @override
  String months(int months) => '$months mesi';

  @override
  String aboutAYear(int year) => 'un anno';

  @override
  String years(int years) => '$years anni';

  @override
  String wordSeparator() => ' ';
}

class ArRelativeDateTime extends RelativeDateTime {
  bool replaceNum;

  ArRelativeDateTime(this.replaceNum);

  @override
  String prefixAgo() => 'منذ';

  @override
  String prefixFromNow() => 'بعد';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'ثانية واحدة';

  @override
  String aboutAMinute(int minutes) => 'دقيقة واحدة';

  @override
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
    return replaceNum ? _replaceToLocaleNum(result, 'ar') : result;
  }

  @override
  String aboutAnHour(int minutes) => 'ساعة واحدة';

  @override
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
    return replaceNum ? _replaceToLocaleNum(result, 'ar') : result;
  }

  @override
  String aDay(int hours) => 'يوم واحد';

  @override
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
    return replaceNum ? _replaceToLocaleNum(result, 'ar') : result;
  }

  @override
  String aboutAMonth(int days) => 'شهر واحد';

  @override
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
    return replaceNum ? _replaceToLocaleNum(result, 'ar') : result;
  }

  @override
  String aboutAYear(int year) => 'عام واحد';

  @override
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
    return replaceNum ? _replaceToLocaleNum(result, 'ar') : result;
  }

  @override
  String wordSeparator() => ' ';
}

class ArSaMaDzKwTnRelativeDateTime extends RelativeDateTime {
  bool replaceNum;

  ArSaMaDzKwTnRelativeDateTime(this.replaceNum);

  @override
  String prefixAgo() => 'منذ';

  @override
  String prefixFromNow() => 'في';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'ثوان';

  @override
  String aboutAMinute(int minutes) => 'دقيقة';

  @override
  String minutes(int minutes) {
    return replaceNum
        ? _replaceToLocaleNum('$minutes دقائق ', 'ar')
        : '$minutes دقائق ';
  }

  @override
  String aboutAnHour(int minutes) => 'ساعة';

  @override
  String hours(int hours) {
    return replaceNum
        ? _replaceToLocaleNum('$hours ساعات ', 'ar')
        : '$hours ساعات ';
  }

  @override
  String aDay(int hours) => 'يوم';

  @override
  String days(int days) {
    return replaceNum
        ? _replaceToLocaleNum('$days أيام ', 'ar')
        : '$days أيام ';
  }

  @override
  String aboutAMonth(int days) => 'شهر';

  @override
  String months(int months) {
    return replaceNum
        ? _replaceToLocaleNum('$months أشهر ', 'ar')
        : '$months أشهر ';
  }

  @override
  String aboutAYear(int year) => 'سنة';

  @override
  String years(int years) {
    return replaceNum
        ? _replaceToLocaleNum('$years سنوات ', 'ar')
        : '$years سنوات ';
  }

  @override
  String wordSeparator() => ' ';
}

class AzRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'geri';

  @override
  String suffixFromNow() => 'sonra';

  @override
  String lessThanOneMinute(int seconds) => 'bir neçə saniyə';

  @override
  String aboutAMinute(int minutes) => 'dəqiqə';

  @override
  String minutes(int minutes) => '$minutes ${_convert(minutes, Unit.minute)}';

  @override
  String aboutAnHour(int minutes) => 'saat';

  @override
  String hours(int hours) => '$hours ${_convert(hours, Unit.hour)}';

  @override
  String aDay(int hours) => 'gün';

  @override
  String days(int days) => '$days ${_convert(days, Unit.day)}';

  @override
  String aboutAMonth(int days) => 'ay';

  @override
  String months(int months) => '$months ${_convert(months, Unit.month)}';

  @override
  String aboutAYear(int year) => 'il';

  @override
  String years(int years) => '$years ${_convert(years, Unit.year)}';

  @override
  String wordSeparator() => ' ';

  String _convert(int number, Unit unit) {
    var mod = number % 10;
    var modH = number % 100;
    if (mod == 1 && modH != 11) {
      switch (unit) {
        case Unit.minute:
          return 'dəqiqə';
        case Unit.hour:
          return 'saat';
        case Unit.day:
          return 'gün';
        case Unit.month:
          return 'ay';
        case Unit.year:
          return 'il';
        default:
          return '';
      }
    } else if (<int>[2, 3, 4].contains(mod) &&
        !<int>[12, 13, 14].contains(modH)) {
      switch (unit) {
        case Unit.minute:
          return 'dəqiqə';
        case Unit.hour:
          return 'saat';
        case Unit.day:
          return 'gün';
        case Unit.month:
          return 'ay';
        case Unit.year:
          return 'il';
        default:
          return '';
      }
    }
    switch (unit) {
      case Unit.minute:
        return 'dəqiqə';
      case Unit.hour:
        return 'saat';
      case Unit.day:
        return 'gün';
      case Unit.month:
        return 'ay';
      case Unit.year:
        return 'il';
      default:
        return '';
    }
  }
}

class IdRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'dalam';

  @override
  String suffixAgo() => 'yang lalu';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'beberapa detik';

  @override
  String aboutAMinute(int minutes) => 'satu menit';

  @override
  String minutes(int minutes) => '$minutes menit';

  @override
  String aboutAnHour(int minutes) => 'satu jam';

  @override
  String hours(int hours) => '$hours jam';

  @override
  String aDay(int hours) => 'satu hari';

  @override
  String days(int days) => '$days hari';

  @override
  String aboutAMonth(int days) => 'satu bulan';

  @override
  String months(int months) => '$months bulan';

  @override
  String aboutAYear(int year) => 'satu tahun';

  @override
  String years(int years) => '$years tahun';

  @override
  String wordSeparator() => ' ';
}

class JaRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => '前';

  @override
  String suffixFromNow() => '後';

  @override
  String lessThanOneMinute(int seconds) => '数秒';

  @override
  String aboutAMinute(int minutes) => '1分';

  @override
  String minutes(int minutes) => '$minutes分';

  @override
  String aboutAnHour(int minutes) => '1時間';

  @override
  String hours(int hours) => '$hours時間';

  @override
  String aDay(int hours) => '1日';

  @override
  String days(int days) => '$days日';

  @override
  String aboutAMonth(int days) => '1ヶ月';

  @override
  String months(int months) => '$monthsヶ月';

  @override
  String aboutAYear(int year) => '1年';

  @override
  String years(int years) => '$years年';

  @override
  String wordSeparator() => '';
}

class KoRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => '전';

  @override
  String suffixFromNow() => '후';

  @override
  String lessThanOneMinute(int seconds) => '몇 초';

  @override
  String aboutAMinute(int minutes) => '1분';

  @override
  String minutes(int minutes) => '$minutes분';

  @override
  String aboutAnHour(int minutes) => '한 시간';

  @override
  String hours(int hours) => '$hours시간';

  @override
  String aDay(int hours) => '하루';

  @override
  String days(int days) => '$days일';

  @override
  String aboutAMonth(int days) => '한 달';

  @override
  String months(int months) => '$months달';

  @override
  String aboutAYear(int year) => '일 년';

  @override
  String years(int years) => '$years년';

  @override
  String wordSeparator() => ' ';
}

class RuRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'через';

  @override
  String suffixAgo() => 'назад';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'несколько секунд';

  @override
  String aboutAMinute(int minutes) => 'минуту';

  @override
  String minutes(int minutes) => '$minutes ${_convert(minutes, Unit.minute)}';

  @override
  String aboutAnHour(int minutes) => 'час';

  @override
  String hours(int hours) => '$hours ${_convert(hours, Unit.hour)}';

  @override
  String aDay(int hours) => 'день';

  @override
  String days(int days) => '$days ${_convert(days, Unit.day)}';

  @override
  String aboutAMonth(int days) => 'месяц';

  @override
  String months(int months) => '$months ${_convert(months, Unit.month)}';

  @override
  String aboutAYear(int year) => 'год';

  @override
  String years(int years) => '$years ${_convert(years, Unit.year)}';

  @override
  String wordSeparator() => ' ';

  String _convert(int number, Unit unit) {
    var mod = number % 10;
    var modH = number % 100;
    if (mod == 1 && modH != 11) {
      switch (unit) {
        case Unit.minute:
          return 'минуту';
        case Unit.hour:
          return 'час';
        case Unit.day:
          return 'день';
        case Unit.month:
          return 'месяц';
        case Unit.year:
          return 'год';
        default:
          return '';
      }
    } else if (<int>[2, 3, 4].contains(mod) &&
        !<int>[12, 13, 14].contains(modH)) {
      switch (unit) {
        case Unit.minute:
          return 'минуты';
        case Unit.hour:
          return 'часа';
        case Unit.day:
          return 'дня';
        case Unit.month:
          return 'месяца';
        case Unit.year:
          return 'года';
        default:
          return '';
      }
    } else {
      switch (unit) {
        case Unit.minute:
          return 'минут';
        case Unit.hour:
          return 'часов';
        case Unit.day:
          return 'дней';
        case Unit.month:
          return 'месяцев';
        case Unit.year:
          return 'лет';
        default:
          return '';
      }
    }
  }
}

class UkRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'через';

  @override
  String suffixAgo() => 'тому';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'декілька секунд';

  @override
  String aboutAMinute(int minutes) => 'хвилину';

  @override
  String minutes(int minutes) => '$minutes ${_convert(minutes, Unit.minute)}';

  @override
  String aboutAnHour(int minutes) => 'годину';

  @override
  String hours(int hours) => '$hours ${_convert(hours, Unit.hour)}';

  @override
  String aDay(int hours) => 'день';

  @override
  String days(int days) => '$days ${_convert(days, Unit.day)}';

  @override
  String aboutAMonth(int days) => 'місяць';

  @override
  String months(int months) => '$months ${_convert(months, Unit.month)}';

  @override
  String aboutAYear(int year) => 'рік';

  @override
  String years(int years) => '$years ${_convert(years, Unit.year)}';

  @override
  String wordSeparator() => ' ';

  String _convert(int number, Unit unit) {
    var mod = number % 10;
    var modH = number % 100;
    if (mod == 1 && modH != 11) {
      switch (unit) {
        case Unit.minute:
          return 'хвилину';
        case Unit.hour:
          return 'годину';
        case Unit.day:
          return 'день';
        case Unit.month:
          return 'місяць';
        case Unit.year:
          return 'рік';
        default:
          return '';
      }
    } else if (<int>[2, 3, 4].contains(mod) &&
        !<int>[12, 13, 14].contains(modH)) {
      switch (unit) {
        case Unit.minute:
          return 'хвилини';
        case Unit.hour:
          return 'години';
        case Unit.day:
          return 'дні';
        case Unit.month:
          return 'місяці';
        case Unit.year:
          return 'роки';
        default:
          return '';
      }
    }
    switch (unit) {
      case Unit.minute:
        return 'хвилин';
      case Unit.hour:
        return 'годин';
      case Unit.day:
        return 'днів';
      case Unit.month:
        return 'місяців';
      case Unit.year:
        return 'років';
      default:
        return '';
    }
  }
}

class HiRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'पूर्व';

  @override
  String suffixFromNow() => 'में';

  @override
  String lessThanOneMinute(int seconds) => 'कुछ ही क्षण';

  @override
  String aboutAMinute(int minutes) => 'एक मिनट';

  @override
  String minutes(int minutes) => '$minutes मिनट';

  @override
  String aboutAnHour(int minutes) => 'एक घंटा';

  @override
  String hours(int hours) => '$hours घंटे';

  @override
  String aDay(int hours) => 'एक दिन';

  @override
  String days(int days) => '$days दिन';

  @override
  String aboutAMonth(int days) => 'एक महीने';

  @override
  String months(int months) => '$months महीने';

  @override
  String aboutAYear(int year) => 'एक वर्ष';

  @override
  String years(int years) => '$years वर्ष';

  @override
  String wordSeparator() => ' ';
}

class HuRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'ezelőtt';

  @override
  String suffixFromNow() => 'ezután';

  @override
  String lessThanOneMinute(int seconds) => 'néhány másodperccel';

  @override
  String aboutAMinute(int minutes) => 'egy perccel';

  @override
  String minutes(int minutes) => '$minutes perccel';

  @override
  String aboutAnHour(int minutes) => 'egy órával';

  @override
  String hours(int hours) => '$hours órával';

  @override
  String aDay(int hours) => 'egy nappal';

  @override
  String days(int days) => '$days nappal';

  @override
  String aboutAMonth(int days) => 'egy hónappal';

  @override
  String months(int months) => '$months hónappal';

  @override
  String aboutAYear(int year) => 'egy évvel';

  @override
  String years(int years) => '$years évvel';

  @override
  String wordSeparator() => ' ';
}

class PtRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'há';

  @override
  String prefixFromNow() => 'em';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'segundos';

  @override
  String aboutAMinute(int minutes) => 'um minuto';

  @override
  String minutes(int minutes) => '$minutes minutos';

  @override
  String aboutAnHour(int minutes) => 'uma hora';

  @override
  String hours(int hours) => '$hours horas';

  @override
  String aDay(int hours) => 'um dia';

  @override
  String days(int days) => '$days dias';

  @override
  String aboutAMonth(int days) => 'um mês';

  @override
  String months(int months) => '$months meses';

  @override
  String aboutAYear(int year) => 'um ano';

  @override
  String years(int years) => '$years anos';

  @override
  String wordSeparator() => ' ';
}

class PlRelativeDateTime extends RelativeDateTime {
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

class TrRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'önce';

  @override
  String suffixFromNow() => 'içinde';

  @override
  String lessThanOneMinute(int seconds) => 'birkaç saniye';

  @override
  String aboutAMinute(int minutes) => 'bir dakika';

  @override
  String minutes(int minutes) => '$minutes dakika';

  @override
  String aboutAnHour(int minutes) => 'bir saat';

  @override
  String hours(int hours) => '$hours saat';

  @override
  String aDay(int hours) => 'bir gün';

  @override
  String days(int days) => '$days gün';

  @override
  String aboutAMonth(int days) => 'bir ay';

  @override
  String months(int months) => '$months ay';

  @override
  String aboutAYear(int year) => 'bir yıl';

  @override
  String years(int years) => '$years yıl';

  @override
  String wordSeparator() => ' ';
}

class SvRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'om';

  @override
  String suffixAgo() => 'sedan';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'några sekunder';

  @override
  String aboutAMinute(int minutes) => 'en minut';

  @override
  String minutes(int minutes) => '$minutes minuter';

  @override
  String aboutAnHour(int minutes) => 'en timme';

  @override
  String hours(int hours) => '$hours timmar';

  @override
  String aDay(int hours) => 'en dag';

  @override
  String days(int days) => '$days dagar';

  @override
  String aboutAMonth(int days) => 'en månad';

  @override
  String months(int months) => '$months månader';

  @override
  String aboutAYear(int year) => 'ett år';

  @override
  String years(int years) => '$years år';

  @override
  String wordSeparator() => ' ';
}

class NbRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'om';

  @override
  String suffixAgo() => 'siden';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'noen sekunder';

  @override
  String aboutAMinute(int minutes) => 'ett minutt';

  @override
  String minutes(int minutes) => '$minutes minutter';

  @override
  String aboutAnHour(int minutes) => 'en time';

  @override
  String hours(int hours) => '$hours timer';

  @override
  String aDay(int hours) => 'en dag';

  @override
  String days(int days) => '$days dager';

  @override
  String aboutAMonth(int days) => 'en måned';

  @override
  String months(int months) => '$months måneder';

  @override
  String aboutAYear(int year) => 'ett år';

  @override
  String years(int years) => '$years år';

  @override
  String wordSeparator() => ' ';
}

class FaRelativeDateTime extends RelativeDateTime {
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
    return _replaceToLocaleNum(result, 'fa');
  }

  @override
  String aboutAnHour(int minutes) => 'یک ساعت';

  @override
  String hours(int hours) {
    String result;
    result = '$hours ساعت ';
    return _replaceToLocaleNum(result, 'fa');
  }

  @override
  String aDay(int hours) => 'یک روز';

  @override
  String days(int days) {
    String result;
    result = '$days روز ';
    return _replaceToLocaleNum(result, 'fa');
  }

  @override
  String aboutAMonth(int days) => 'یک ماه';

  @override
  String months(int months) {
    String result;
    result = '$months ماه ';
    return _replaceToLocaleNum(result, 'fa');
  }

  @override
  String aboutAYear(int year) => 'یک سال';

  @override
  String years(int years) {
    String result;
    result = '$years سال ';
    return _replaceToLocaleNum(result, 'fa');
  }

  @override
  String wordSeparator() => ' ';
}

class BnRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'আগে';

  @override
  String suffixFromNow() => 'পরে';

  @override
  String lessThanOneMinute(int seconds) => 'কিছু মুহূর্ত';

  @override
  String aboutAMinute(int minutes) => 'এক মিনিট';

  @override
  String minutes(int minutes) => _replaceToLocaleNum('$minutes মিনিট', 'bn');

  @override
  String aboutAnHour(int minutes) => 'এক ঘন্টা';

  @override
  String hours(int hours) => _replaceToLocaleNum('$hours ঘন্টা', 'bn');

  @override
  String aDay(int hours) => 'এক দিন';

  @override
  String days(int days) => _replaceToLocaleNum('$days দিন', 'bn');

  @override
  String aboutAMonth(int days) => 'এক মাস';

  @override
  String months(int months) => _replaceToLocaleNum('$months মাস', 'bn');

  @override
  String aboutAYear(int year) => 'এক বছর';

  @override
  String years(int years) => _replaceToLocaleNum('$years বছর', 'bn');

  @override
  String wordSeparator() => ' ';
}

class NlRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => '';

  @override
  String suffixAgo() => 'geleden';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) =>
      seconds > 0 ? 'op dit moment' : 'een ogenblik';

  @override
  String aboutAMinute(int minutes) => 'een minuut';

  @override
  String minutes(int minutes) => '$minutes minuten';

  @override
  String aboutAnHour(int minutes) => 'een uur';

  @override
  String hours(int hours) => '$hours uur';

  @override
  String aDay(int hours) => 'een dag';

  @override
  String days(int days) => '$days dagen';

  @override
  String aboutAMonth(int days) => 'een maand';

  @override
  String months(int months) => '$months maanden';

  @override
  String aboutAYear(int year) => 'een jaar';

  @override
  String years(int years) => '$years jaar';

  @override
  String wordSeparator() => ' ';
}

class ThRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => '';

  @override
  String prefixFromNow() => 'อีก';

  @override
  String suffixAgo() => 'ที่แล้ว';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'ไม่กี่วินาที';

  @override
  String aboutAMinute(int minutes) => '1 นาที';

  @override
  String minutes(int minutes) => '$minutes นาที';

  @override
  String aboutAnHour(int minutes) => '1 ชั่วโมง';

  @override
  String hours(int hours) => '$hours ชั่วโมง';

  @override
  String aDay(int hours) => '1 วัน';

  @override
  String days(int days) => '$days วัน';

  @override
  String aboutAMonth(int days) => '1 เดือน';

  @override
  String months(int months) => '$months เดือน';

  @override
  String aboutAYear(int year) => '1 ปี';

  @override
  String years(int years) => '$years ปี';

  @override
  String wordSeparator() => '';
}

class SkRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'pred';

  @override
  String prefixFromNow() => 'za';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'pár sekundami';

  @override
  String aboutAMinute(int minutes) => 'minútou';

  @override
  String minutes(int minutes) => '$minutes minútami';

  @override
  String aboutAnHour(int minutes) => 'hodinou';

  @override
  String hours(int hours) => '$hours hodinami';

  @override
  String aDay(int hours) => 'dňom';

  @override
  String days(int days) => '$days dňami';

  @override
  String aboutAMonth(int days) => 'mesiacom';

  @override
  String months(int months) => '$months mesiacmi';

  @override
  String aboutAYear(int year) => 'rokom';

  @override
  String years(int years) => '$years rokmi';

  @override
  String wordSeparator() => ' ';
}

class CsRelativeDateTime extends RelativeDateTime {
  @override
  String prefixAgo() => 'před';

  @override
  String prefixFromNow() => 'za';

  @override
  String suffixAgo() => '';

  @override
  String suffixFromNow() => '';

  @override
  String lessThanOneMinute(int seconds) => 'pár sekundami';

  @override
  String aboutAMinute(int minutes) => 'minutou';

  @override
  String minutes(int minutes) => '$minutes minutami';

  @override
  String aboutAnHour(int minutes) => 'hodinou';

  @override
  String hours(int hours) => '$hours hodinami';

  @override
  String aDay(int hours) => 'dnem';

  @override
  String days(int days) => '$days dny';

  @override
  String aboutAMonth(int days) => 'měsícem';

  @override
  String months(int months) => '$months měsíci';

  @override
  String aboutAYear(int year) => 'rokem';

  @override
  String years(int years) => '$years lety';

  @override
  String wordSeparator() => ' ';
}

String _replaceToLocaleNum(String input, String locale) {
  var localeNumbers = {
    'en': ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'],
    'ar': ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'],
    'fa': ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'],
    'bn': ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯']
  };
  for (var i = 0; i < localeNumbers['en']!.length; i++) {
    input =
        input.replaceAll(localeNumbers['en']![i], localeNumbers[locale]![i]);
  }
  return input;
}
