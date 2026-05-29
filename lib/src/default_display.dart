import 'package:intl/intl.dart';

class DefaultDisplay {
  static String? _cachedLocale;
  static final Map<String, DateFormat> _formatters = {};

  DateFormat _format(String key, DateFormat Function() build) {
    final currentLocale = Intl.getCurrentLocale();
    if (currentLocale != _cachedLocale) {
      _formatters.clear();
      _cachedLocale = currentLocale;
    }
    return _formatters[key] ??= build();
  }

  String E(DateTime dateTime) =>
      _format('E', () => DateFormat.E()).format(dateTime);

  // ignore: non_constant_identifier_names
  String EEEE(DateTime dateTime) =>
      _format('EEEE', () => DateFormat.EEEE()).format(dateTime);

  // ignore: non_constant_identifier_names
  String Md(DateTime dateTime) =>
      _format('Md', () => DateFormat.Md()).format(dateTime);

  // ignore: non_constant_identifier_names
  String MEd(DateTime dateTime) =>
      _format('MEd', () => DateFormat.MEd()).format(dateTime);

  // ignore: non_constant_identifier_names
  String MMM(DateTime dateTime) =>
      _format('MMM', () => DateFormat.MMM()).format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMd(DateTime dateTime) =>
      _format('MMMd', () => DateFormat.MMMd()).format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMEd(DateTime dateTime) =>
      _format('MMMEd', () => DateFormat.MMMEd()).format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMM(DateTime dateTime) =>
      _format('MMMM', () => DateFormat.MMMM()).format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMMd(DateTime dateTime) =>
      _format('MMMMd', () => DateFormat.MMMMd()).format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMMEEEEd(DateTime dateTime) =>
      _format('MMMMEEEEd', () => DateFormat.MMMMEEEEd()).format(dateTime);

  // ignore: non_constant_identifier_names
  String QQQ(DateTime dateTime) =>
      _format('QQQ', () => DateFormat.QQQ()).format(dateTime);

  // ignore: non_constant_identifier_names
  String QQQQ(DateTime dateTime) =>
      _format('QQQQ', () => DateFormat.QQQQ()).format(dateTime);

  String yM(DateTime dateTime) =>
      _format('yM', () => DateFormat.yM()).format(dateTime);

  String yMd(DateTime dateTime) =>
      _format('yMd', () => DateFormat.yMd()).format(dateTime);

  String yMEd(DateTime dateTime) =>
      _format('yMEd', () => DateFormat.yMEd()).format(dateTime);

  String yMMM(DateTime dateTime) =>
      _format('yMMM', () => DateFormat.yMMM()).format(dateTime);

  String yMMMd(DateTime dateTime) =>
      _format('yMMMd', () => DateFormat.yMMMd()).format(dateTime);

  String yMMMdjm(DateTime dateTime) =>
      _format('yMMMdjm', () => DateFormat.yMMMd().add_jm())
          .format(dateTime)
          .replaceAll(' ', ' ');

  String yMMMEd(DateTime dateTime) =>
      _format('yMMMEd', () => DateFormat.yMMMEd()).format(dateTime);

  String yMMMEdjm(DateTime dateTime) =>
      _format('yMMMEdjm', () => DateFormat.yMMMEd().add_jm())
          .format(dateTime)
          .replaceAll(' ', ' ');

  String yMMMM(DateTime dateTime) =>
      _format('yMMMM', () => DateFormat.yMMMM()).format(dateTime);

  String yMMMMd(DateTime dateTime) =>
      _format('yMMMMd', () => DateFormat.yMMMMd()).format(dateTime);

  String yMMMMdjm(DateTime dateTime) =>
      _format('yMMMMdjm', () => DateFormat.yMMMMd().add_jm())
          .format(dateTime)
          .replaceAll(' ', ' ');

  String yMMMMEEEEd(DateTime dateTime) =>
      _format('yMMMMEEEEd', () => DateFormat.yMMMMEEEEd()).format(dateTime);

  String yMMMMEEEEdjm(DateTime dateTime) =>
      _format('yMMMMEEEEdjm', () => DateFormat.yMMMMEEEEd().add_jm())
          .format(dateTime)
          .replaceAll(' ', ' ');

  String yQQQ(DateTime dateTime) =>
      _format('yQQQ', () => DateFormat.yQQQ()).format(dateTime);

  String yQQQQ(DateTime dateTime) =>
      _format('yQQQQ', () => DateFormat.yQQQQ()).format(dateTime);

  String H(DateTime dateTime) =>
      _format('H', () => DateFormat.H()).format(dateTime);

  // ignore: non_constant_identifier_names
  String Hm(DateTime dateTime) =>
      _format('Hm', () => DateFormat.Hm()).format(dateTime);

  // ignore: non_constant_identifier_names
  String Hms(DateTime dateTime) =>
      _format('Hms', () => DateFormat.Hms()).format(dateTime);

  String j(DateTime dateTime) =>
      _format('j', () => DateFormat.j()).format(dateTime).replaceAll(' ', ' ');

  String jm(DateTime dateTime) => _format('jm', () => DateFormat.jm())
      .format(dateTime)
      .replaceAll(' ', ' ');

  String jms(DateTime dateTime) => _format('jms', () => DateFormat.jms())
      .format(dateTime)
      .replaceAll(' ', ' ');
}
