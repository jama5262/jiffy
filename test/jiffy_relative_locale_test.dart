import 'package:jiffy/jiffy.dart';
import 'package:jiffy/src/enums/startOfWeek.dart';
import 'package:jiffy/src/locale/availableLocales.dart';
import 'package:test/test.dart';

void main() {
  group('Test display all locales', () {
    test('test show all available locales as List<String> type', () {
      var locales = getAllLocales();
      expect(locales, isList);
    });

    test(
        'test show all available locales contains locales en, fr, de, zn_ch, ru, az',
        () {
      var locales = getAllLocales();
      expect(locales, contains('en'));
      expect(locales, contains('fr'));
      expect(locales, contains('de'));
      expect(locales, contains('zh_cn'));
      expect(locales, contains('ru'));
      expect(locales, contains('uk'));
      expect(locales, contains('az'));
    });
  });

  group('Test locale if available', () {
    test('test is unavailable locale exists', () async {
      try {
        await Jiffy.locale('english');
      } catch (e) {
        expect(e.toString(),
            'JiffyException: The locale "english" does not exist in Jiffy, run Jiffy.getAllAvailableLocales() for more locales');
      }
    });
  });

  group('Test for all relative date locales', () {
    var jiffy1 = Jiffy();
    var jiffy2 = Jiffy()..add(duration: Duration(seconds: 1));
    var jiffy3 = Jiffy()..subtract(duration: Duration(minutes: 1));
    var jiffy5 = Jiffy()..subtract(duration: Duration(minutes: 10));
    var jiffy6 = Jiffy()..subtract(duration: Duration(hours: 1));
    var jiffy7 = Jiffy()..subtract(duration: Duration(hours: 10));
    var jiffy8 = Jiffy()..subtract(duration: Duration(days: 1));
    var jiffy9 = Jiffy()..subtract(duration: Duration(days: 10));
    var jiffy10 = Jiffy('2019-09-01');
    var jiffy11 = Jiffy()..subtract(months: 10);
    var jiffy12 = Jiffy()..subtract(years: 1);
    var jiffy13 = Jiffy()..subtract(years: 10);

    test(
        'test Jiffy().locale() method with parsing ar locale should return correct date time in ar locale',
        () async {
      var locale = await Jiffy.locale('ar');
      expect(jiffy1.fromNow(), 'منذ ثانية واحدة');
      expect(jiffy2.fromNow(), 'بعد ثانية واحدة');
      expect(jiffy3.fromNow(), 'منذ دقيقة واحدة');
      expect(jiffy5.fromNow(), 'منذ ۱۰ دقائق ');
      expect(jiffy6.fromNow(), 'منذ ساعة واحدة');
      expect(jiffy7.fromNow(), 'منذ ۱۰ ساعات ');
      expect(jiffy8.fromNow(), 'منذ يوم واحد');
      expect(jiffy9.fromNow(), 'منذ ۱۰ ايام ');
      expect(jiffy10.from(Jiffy([2019, 10, 1])), 'منذ شهر واحد');
      expect(jiffy11.fromNow(), 'منذ ۱۰ اشهر ');
      expect(jiffy12.fromNow(), 'منذ عام واحد');
      expect(jiffy13.fromNow(), 'منذ ۱۰ أعوام ');
      expect(locale.startOfWeek(), StartOfWeek.SATURDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing ar-dz/kw/ma/tn locale should return correct date time in ar-dz locale',
        () async {
      var locale = await Jiffy.locale('ar_dz');
      expect(jiffy1.fromNow(), 'منذ ثوان');
      expect(jiffy2.fromNow(), 'في ثوان');
      expect(jiffy3.fromNow(), 'منذ دقيقة');
      expect(jiffy5.fromNow(), 'منذ 10 دقائق ');
      expect(jiffy6.fromNow(), 'منذ ساعة');
      expect(jiffy7.fromNow(), 'منذ 10 ساعات ');
      expect(jiffy8.fromNow(), 'منذ يوم');
      expect(jiffy9.fromNow(), 'منذ 10 أيام ');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'منذ شهر');
      expect(jiffy11.fromNow(), 'منذ 10 أشهر ');
      expect(jiffy12.fromNow(), 'منذ سنة');
      expect(jiffy13.fromNow(), 'منذ 10 سنوات ');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing ar-sa locale should return correct date time in ar-sa locale',
        () async {
      var locale = await Jiffy.locale('ar_sa');
      expect(jiffy1.fromNow(), 'منذ ثوان');
      expect(jiffy2.fromNow(), 'في ثوان');
      expect(jiffy3.fromNow(), 'منذ دقيقة');
      expect(jiffy5.fromNow(), 'منذ ۱۰ دقائق ');
      expect(jiffy6.fromNow(), 'منذ ساعة');
      expect(jiffy7.fromNow(), 'منذ ۱۰ ساعات ');
      expect(jiffy8.fromNow(), 'منذ يوم');
      expect(jiffy9.fromNow(), 'منذ ۱۰ أيام ');
      expect(jiffy10.from(Jiffy([2019, 10, 1])), 'منذ شهر');
      expect(jiffy11.fromNow(), 'منذ ۱۰ أشهر ');
      expect(jiffy12.fromNow(), 'منذ سنة');
      expect(jiffy13.fromNow(), 'منذ ۱۰ سنوات ');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing de/de-at/de-ch locale should return correct date time in de/de-at/de-ch locale',
        () async {
      var locale = await Jiffy.locale('de');
      expect(jiffy1.fromNow(), 'vor ein paar Sekunden');
      expect(jiffy2.fromNow(), 'in ein paar Sekunden');
      expect(jiffy3.fromNow(), 'vor einer Minute');
      expect(jiffy5.fromNow(), 'vor 10 Minuten');
      expect(jiffy6.fromNow(), 'vor einer Stunde');
      expect(jiffy7.fromNow(), 'vor 10 Stunden');
      expect(jiffy8.fromNow(), 'vor einem Tag');
      expect(jiffy9.fromNow(), 'vor 10 Tagen');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'vor einem Monat');
      expect(jiffy11.fromNow(), 'vor 10 Monaten');
      expect(jiffy12.fromNow(), 'vor einem Jahr');
      expect(jiffy13.fromNow(), 'vor 10 Jahren');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), ['.', '.', '.', '.']);
    });
    test(
        'test Jiffy.locale() method with parsing en locale should return correct date time in en locale',
        () async {
      var locale = await Jiffy.locale('en');
      expect(jiffy1.fromNow(), 'a few seconds ago');
      expect(jiffy2.fromNow(), 'in a few seconds');
      expect(jiffy3.fromNow(), 'a minute ago');
      expect(jiffy5.fromNow(), '10 minutes ago');
      expect(jiffy6.fromNow(), 'an hour ago');
      expect(jiffy7.fromNow(), '10 hours ago');
      expect(jiffy8.fromNow(), 'a day ago');
      expect(jiffy9.fromNow(), '10 days ago');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'a month ago');
      expect(jiffy11.fromNow(), '10 months ago');
      expect(jiffy12.fromNow(), 'a year ago');
      expect(jiffy13.fromNow(), '10 years ago');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), ['st', 'nd', 'rd', 'th']);
    });
    test(
        'test Jiffy.locale() method with parsing id locale should return correct date time in id locale',
        () async {
      var locale = await Jiffy.locale('id');
      expect(jiffy1.fromNow(), 'beberapa detik yang lalu');
      expect(jiffy2.fromNow(), 'dalam beberapa detik');
      expect(jiffy3.fromNow(), 'satu menit yang lalu');
      expect(jiffy5.fromNow(), '10 menit yang lalu');
      expect(jiffy6.fromNow(), 'satu jam yang lalu');
      expect(jiffy7.fromNow(), '10 jam yang lalu');
      expect(jiffy8.fromNow(), 'satu hari yang lalu');
      expect(jiffy9.fromNow(), '10 hari yang lalu');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'satu bulan yang lalu');
      expect(jiffy11.fromNow(), '10 bulan yang lalu');
      expect(jiffy12.fromNow(), 'satu tahun yang lalu');
      expect(jiffy13.fromNow(), '10 tahun yang lalu');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing es locale should return correct date time in es locale',
        () async {
      var locale = await Jiffy.locale('es');
      expect(jiffy1.fromNow(), 'hace un momento');
      expect(jiffy2.fromNow(), 'en un momento');
      expect(jiffy3.fromNow(), 'hace un minuto');
      expect(jiffy5.fromNow(), 'hace 10 minutos');
      expect(jiffy6.fromNow(), 'hace una hora');
      expect(jiffy7.fromNow(), 'hace 10 horas');
      expect(jiffy8.fromNow(), 'hace un día');
      expect(jiffy9.fromNow(), 'hace 10 días');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'hace un mes');
      expect(jiffy11.fromNow(), 'hace 10 meses');
      expect(jiffy12.fromNow(), 'hace un año');
      expect(jiffy13.fromNow(), 'hace 10 años');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), ['º', 'º', 'º', 'º']);
    });
    test(
        'test Jiffy.locale() method with parsing fr locale should return correct date time in fr locale',
        () async {
      var locale = await Jiffy.locale('fr');
      expect(jiffy1.fromNow(), 'il y a quelques secondes');
      expect(jiffy2.fromNow(), 'dans quelques secondes');
      expect(jiffy3.fromNow(), 'il y a une minute');
      expect(jiffy5.fromNow(), 'il y a 10 minutes');
      expect(jiffy6.fromNow(), 'il y a une heure');
      expect(jiffy7.fromNow(), 'il y a 10 heures');
      expect(jiffy8.fromNow(), 'il y a un jour');
      expect(jiffy9.fromNow(), 'il y a 10 jours');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'il y a un mois');
      expect(jiffy11.fromNow(), 'il y a 10 mois');
      expect(jiffy12.fromNow(), 'il y a un an');
      expect(jiffy13.fromNow(), 'il y a 10 ans');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), ['er', '', '', '']);
    });
    test(
        'test Jiffy.locale() method with parsing hi locale should return correct date time in hi locale',
        () async {
      var locale = await Jiffy.locale('hi');
      expect(jiffy1.fromNow(), 'कुछ ही क्षण पहले');
      expect(jiffy2.fromNow(), 'कुछ ही क्षण में');
      expect(jiffy3.fromNow(), 'एक मिनट पहले');
      expect(jiffy5.fromNow(), '10 मिनट पहले');
      expect(jiffy6.fromNow(), 'एक घंटा पहले');
      expect(jiffy7.fromNow(), '10 घंटे पहले');
      expect(jiffy8.fromNow(), 'एक दिन पहले');
      expect(jiffy9.fromNow(), '10 दिन पहले');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'एक महीने पहले');
      expect(jiffy11.fromNow(), '10 महीने पहले');
      expect(jiffy12.fromNow(), 'एक वर्ष पहले');
      expect(jiffy13.fromNow(), '10 वर्ष पहले');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing it locale should return correct date time in it locale',
        () async {
      var locale = await Jiffy.locale('it');
      expect(jiffy1.fromNow(), 'alcuni secondi fa');
      expect(jiffy2.fromNow(), 'tra alcuni secondi');
      expect(jiffy3.fromNow(), 'un minuto fa');
      expect(jiffy5.fromNow(), '10 minuti fa');
      expect(jiffy6.fromNow(), 'un\'ora fa');
      expect(jiffy7.fromNow(), '10 ore fa');
      expect(jiffy8.fromNow(), 'un giorno fa');
      expect(jiffy9.fromNow(), '10 giorni fa');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'un mese fa');
      expect(jiffy11.fromNow(), '10 mesi fa');
      expect(jiffy12.fromNow(), 'un anno fa');
      expect(jiffy13.fromNow(), '10 anni fa');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), ['º', 'º', 'º', 'º']);
    });
    test(
        'test Jiffy.locale() method with parsing ja locale should return correct date time in ja locale',
        () async {
      var locale = await Jiffy.locale('ja');
      expect(jiffy1.fromNow(), '数秒前');
      expect(jiffy2.fromNow(), '数秒後');
      expect(jiffy3.fromNow(), '1分前');
      expect(jiffy5.fromNow(), '10分前');
      expect(jiffy6.fromNow(), '1時間前');
      expect(jiffy7.fromNow(), '10時間前');
      expect(jiffy8.fromNow(), '1日前');
      expect(jiffy9.fromNow(), '10日前');
      expect(jiffy10.from(Jiffy('2019-10-01')), '1ヶ月前');
      expect(jiffy11.fromNow(), '10ヶ月前');
      expect(jiffy12.fromNow(), '1年前');
      expect(jiffy13.fromNow(), '10年前');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), ['日', '日', '日', '日']);
    });
    test(
        'test Jiffy.locale() method with parsing ko locale should return correct date time in ko locale',
        () async {
      var locale = await Jiffy.locale('ko');
      expect(jiffy1.fromNow(), '몇 초 전');
      expect(jiffy2.fromNow(), '몇 초 후');
      expect(jiffy3.fromNow(), '1분 전');
      expect(jiffy5.fromNow(), '10분 전');
      expect(jiffy6.fromNow(), '한 시간 전');
      expect(jiffy7.fromNow(), '10시간 전');
      expect(jiffy8.fromNow(), '하루 전');
      expect(jiffy9.fromNow(), '10일 전');
      expect(jiffy10.from(Jiffy('2019-10-01')), '한 달 전');
      expect(jiffy11.fromNow(), '10달 전');
      expect(jiffy12.fromNow(), '일 년 전');
      expect(jiffy13.fromNow(), '10년 전');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), ['일', '일', '일', '일']);
    });
    test(
        'test Jiffy.locale() method with parsing pt locale should return correct date time in pt locale',
        () async {
      var locale = await Jiffy.locale('pt');
      expect(jiffy1.fromNow(), 'há segundos');
      expect(jiffy2.fromNow(), 'em segundos');
      expect(jiffy3.fromNow(), 'há um minuto');
      expect(jiffy5.fromNow(), 'há 10 minutos');
      expect(jiffy6.fromNow(), 'há uma hora');
      expect(jiffy7.fromNow(), 'há 10 horas');
      expect(jiffy8.fromNow(), 'há um dia');
      expect(jiffy9.fromNow(), 'há 10 dias');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'há um mês');
      expect(jiffy11.fromNow(), 'há 10 meses');
      expect(jiffy12.fromNow(), 'há um ano');
      expect(jiffy13.fromNow(), 'há 10 anos');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), ['º', 'º', 'º', 'º']);
    });
    test(
        'test Jiffy.locale() method with parsing ru locale should return correct date time in ru locale',
        () async {
      var locale = await Jiffy.locale('ru');
      expect(jiffy1.fromNow(), 'несколько секунд назад');
      expect(jiffy2.fromNow(), 'через несколько секунд');
      expect(jiffy3.fromNow(), 'минуту назад');
      expect(jiffy5.fromNow(), '10 минут назад');
      expect(jiffy6.fromNow(), 'час назад');
      expect(jiffy7.fromNow(), '10 часов назад');
      expect(jiffy8.fromNow(), 'день назад');
      expect(jiffy9.fromNow(), '10 дней назад');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'месяц назад');
      expect(jiffy11.fromNow(), '10 месяцев назад');
      expect(jiffy12.fromNow(), 'год назад');
      expect(jiffy13.fromNow(), '10 лет назад');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing uk locale should return correct date time in uk locale',
        () async {
      var locale = await Jiffy.locale('uk');
      expect(jiffy1.fromNow(), 'декілька секунд тому');
      expect(jiffy2.fromNow(), 'через декілька секунд');
      expect(jiffy3.fromNow(), 'хвилину тому');
      expect(jiffy5.fromNow(), '10 хвилин тому');
      expect(jiffy6.fromNow(), 'годину тому');
      expect(jiffy7.fromNow(), '10 годин тому');
      expect(jiffy8.fromNow(), 'день тому');
      expect(jiffy9.fromNow(), '10 днів тому');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'місяць тому');
      expect(jiffy11.fromNow(), '10 місяців тому');
      expect(jiffy12.fromNow(), 'рік тому');
      expect(jiffy13.fromNow(), '10 років тому');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing az locale should return correct date time in az locale',
        () async {
      var locale = await Jiffy.locale('az');
      expect(jiffy1.fromNow(), 'bir neçə saniyə geri');
      expect(jiffy2.fromNow(), 'bir neçə saniyə sonra');
      expect(jiffy3.fromNow(), 'dəqiqə geri');
      expect(jiffy5.fromNow(), '10 dəqiqə geri');
      expect(jiffy6.fromNow(), 'saat geri');
      expect(jiffy7.fromNow(), '10 saat geri');
      expect(jiffy8.fromNow(), 'gün geri');
      expect(jiffy9.fromNow(), '10 gün geri');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'ay geri');
      expect(jiffy11.fromNow(), '10 ay geri');
      expect(jiffy12.fromNow(), 'il geri');
      expect(jiffy13.fromNow(), '10 il geri');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing zh-cn locale should return correct date time in zh-cn locale',
        () async {
      var locale = await Jiffy.locale('zh');
      expect(jiffy1.fromNow(), '几秒前');
      expect(jiffy2.fromNow(), '几秒内');
      expect(jiffy3.fromNow(), '1 分钟前');
      expect(jiffy5.fromNow(), '10 分钟前');
      expect(jiffy6.fromNow(), '1 小时前');
      expect(jiffy7.fromNow(), '10 小时前');
      expect(jiffy8.fromNow(), '1 天前');
      expect(jiffy9.fromNow(), '10 天前');
      expect(jiffy10.from(Jiffy('2019-10-01')), '1 个月前');
      expect(jiffy11.fromNow(), '10 个月前');
      expect(jiffy12.fromNow(), '1 年前');
      expect(jiffy13.fromNow(), '10 年前');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), ['日', '日', '日', '日']);
    });
    test(
        'test Jiffy.locale() method with parsing zh-hk/tw locale should return correct date time in zh-hk/tw locale',
        () async {
      var locale = await Jiffy.locale('zh_hk');
      expect(jiffy1.fromNow(), '幾秒前');
      expect(jiffy2.fromNow(), '幾秒内');
      expect(jiffy3.fromNow(), '1 分鐘前');
      expect(jiffy5.fromNow(), '10 分鐘前');
      expect(jiffy6.fromNow(), '1 小時前');
      expect(jiffy7.fromNow(), '10 小時前');
      expect(jiffy8.fromNow(), '1 天前');
      expect(jiffy9.fromNow(), '10 天前');
      expect(jiffy10.from(Jiffy('2019-10-01')), '1 個月前');
      expect(jiffy11.fromNow(), '10 個月前');
      expect(jiffy12.fromNow(), '1 年前');
      expect(jiffy13.fromNow(), '10 年前');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), ['日', '日', '日', '日']);
    });
    test(
        'test Jiffy.locale() method with parsing pl locale should return correct date time in pl locale',
        () async {
      var locale = await Jiffy.locale('pl');
      expect(jiffy1.fromNow(), 'kilka sekund temu');
      expect(jiffy2.fromNow(), 'za kilka sekund');
      expect(jiffy3.fromNow(), 'minutę temu');
      expect(jiffy5.fromNow(), '10 minut temu');
      expect(jiffy6.fromNow(), 'godzinę temu');
      expect(jiffy7.fromNow(), '10 godzin temu');
      expect(jiffy8.fromNow(), '1 dzień temu');
      expect(jiffy9.fromNow(), '10 dni temu');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'miesiąc temu');
      expect(jiffy11.fromNow(), '10 miesięcy temu');
      expect(jiffy12.fromNow(), 'rok temu');
      expect(jiffy13.fromNow(), '10 lat temu');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), ['.', '.', '.', '.']);
    });
    test(
        'test Jiffy.locale() method with parsing tr locale should return correct date time in tr locale',
        () async {
      var locale = await Jiffy.locale('tr');
      expect(jiffy1.fromNow(), 'birkaç saniye önce');
      expect(jiffy2.fromNow(), 'birkaç saniye içinde');
      expect(jiffy3.fromNow(), 'bir dakika önce');
      expect(jiffy5.fromNow(), '10 dakika önce');
      expect(jiffy6.fromNow(), 'bir saat önce');
      expect(jiffy7.fromNow(), '10 saat önce');
      expect(jiffy8.fromNow(), 'bir gün önce');
      expect(jiffy9.fromNow(), '10 gün önce');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'bir ay önce');
      expect(jiffy11.fromNow(), '10 ay önce');
      expect(jiffy12.fromNow(), 'bir yıl önce');
      expect(jiffy13.fromNow(), '10 yıl önce');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing sv locale should return correct date time in sv locale',
        () async {
      var locale = await Jiffy.locale('sv');
      expect(jiffy1.fromNow(), 'några sekunder sedan');
      expect(jiffy2.fromNow(), 'om några sekunder');
      expect(jiffy3.fromNow(), 'en minut sedan');
      expect(jiffy5.fromNow(), '10 minuter sedan');
      expect(jiffy6.fromNow(), 'en timme sedan');
      expect(jiffy7.fromNow(), '10 timmar sedan');
      expect(jiffy8.fromNow(), 'en dag sedan');
      expect(jiffy9.fromNow(), '10 dagar sedan');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'en månad sedan');
      expect(jiffy11.fromNow(), '10 månader sedan');
      expect(jiffy12.fromNow(), 'ett år sedan');
      expect(jiffy13.fromNow(), '10 år sedan');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing nb locale should return correct date time in nb locale',
        () async {
      var locale = await Jiffy.locale('nb');
      expect(jiffy1.fromNow(), 'noen sekunder siden');
      expect(jiffy2.fromNow(), 'om noen sekunder');
      expect(jiffy3.fromNow(), 'ett minutt siden');
      expect(jiffy5.fromNow(), '10 minutter siden');
      expect(jiffy6.fromNow(), 'en time siden');
      expect(jiffy7.fromNow(), '10 timer siden');
      expect(jiffy8.fromNow(), 'en dag siden');
      expect(jiffy9.fromNow(), '10 dager siden');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'en måned siden');
      expect(jiffy11.fromNow(), '10 måneder siden');
      expect(jiffy12.fromNow(), 'ett år siden');
      expect(jiffy13.fromNow(), '10 år siden');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), ['.', '.', '.', '.']);
    });
    test(
        'test Jiffy.locale() method with parsing fa locale should return correct date time in fa locale',
        () async {
      var locale = await Jiffy.locale('fa');
      expect(jiffy1.fromNow(), 'چند ثانیه پیش');
      expect(jiffy2.fromNow(), 'چند ثانیه بعد');
      expect(jiffy3.fromNow(), 'یک دقیقه پیش');
      expect(jiffy5.fromNow(), '۱۰ دقیقه  پیش');
      expect(jiffy6.fromNow(), 'یک ساعت پیش');
      expect(jiffy7.fromNow(), '۱۰ ساعت  پیش');
      expect(jiffy8.fromNow(), 'یک روز پیش');
      expect(jiffy9.fromNow(), '۱۰ روز  پیش');
      expect(jiffy10.from(Jiffy([2019, 10, 1])), 'یک ماه پیش');
      expect(jiffy11.fromNow(), '۱۰ ماه  پیش');
      expect(jiffy12.fromNow(), 'یک سال پیش');
      expect(jiffy13.fromNow(), '۱۰ سال  پیش');
      expect(locale.startOfWeek(), StartOfWeek.SATURDAY);
      expect(locale.ordinals(), ['م', 'م', 'م', 'م']);
    });
    test(
        'test Jiffy.locale() method with parsing bn locale should return correct date time in bn locale',
        () async {
      var locale = await Jiffy.locale('bn');
      expect(jiffy1.fromNow(), 'কিছু মুহূর্ত আগে');
      expect(jiffy2.fromNow(), 'কিছু মুহূর্ত পরে');
      expect(jiffy3.fromNow(), 'এক মিনিট আগে');
      expect(jiffy5.fromNow(), '১০ মিনিট আগে');
      expect(jiffy6.fromNow(), 'এক ঘন্টা আগে');
      expect(jiffy7.fromNow(), '১০ ঘন্টা আগে');
      expect(jiffy8.fromNow(), 'এক দিন আগে');
      expect(jiffy9.fromNow(), '১০ দিন আগে');
      expect(jiffy10.from(Jiffy([2019, 10, 01])), 'এক মাস আগে');
      expect(jiffy11.fromNow(), '১০ মাস আগে');
      expect(jiffy12.fromNow(), 'এক বছর আগে');
      expect(jiffy13.fromNow(), '১০ বছর আগে');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), null);
    });
    test(
        'test Jiffy.locale() method with parsing nl locale should return correct date time in nl locale',
        () async {
      var locale = await Jiffy.locale('nl');
      expect(jiffy1.fromNow(), 'een ogenblik geleden');
      expect(jiffy2.fromNow(), 'op dit moment');
      expect(jiffy3.fromNow(), 'een minuut geleden');
      expect(jiffy5.fromNow(), '10 minuten geleden');
      expect(jiffy6.fromNow(), 'een uur geleden');
      expect(jiffy7.fromNow(), '10 uur geleden');
      expect(jiffy8.fromNow(), 'een dag geleden');
      expect(jiffy9.fromNow(), '10 dagen geleden');
      expect(jiffy10.from(Jiffy('2019-10-01')), 'een maand geleden');
      expect(jiffy11.fromNow(), '10 maanden geleden');
      expect(jiffy12.fromNow(), 'een jaar geleden');
      expect(jiffy13.fromNow(), '10 jaar geleden');
      expect(locale.startOfWeek(), StartOfWeek.MONDAY);
      expect(locale.ordinals(), ['.', '.', '.', '.']);
    });
    test(
        'test Jiffy.locale() method with parsing th locale should return correct date time in th locale',
        () async {
      var locale = await Jiffy.locale('th');
      expect(jiffy1.fromNow(), 'ไม่กี่วินาทีที่แล้ว');
      expect(jiffy2.fromNow(), 'อีกไม่กี่วินาที');
      expect(jiffy3.fromNow(), '1 นาทีที่แล้ว');
      expect(jiffy5.fromNow(), '10 นาทีที่แล้ว');
      expect(jiffy6.fromNow(), '1 ชั่วโมงที่แล้ว');
      expect(jiffy7.fromNow(), '10 ชั่วโมงที่แล้ว');
      expect(jiffy8.fromNow(), '1 วันที่แล้ว');
      expect(jiffy9.fromNow(), '10 วันที่แล้ว');
      expect(jiffy10.from(Jiffy([2019, 10, 01])), '1 เดือนที่แล้ว');
      expect(jiffy11.fromNow(), '10 เดือนที่แล้ว');
      expect(jiffy12.fromNow(), '1 ปีที่แล้ว');
      expect(jiffy13.fromNow(), '10 ปีที่แล้ว');
      expect(locale.startOfWeek(), StartOfWeek.SUNDAY);
      expect(locale.ordinals(), null);
    });
  });
}
