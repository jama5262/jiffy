import 'package:intl/intl.dart';

class DefaultDisplay {
  String E(DateTime dateTime) => DateFormat.E().format(dateTime);

  // ignore: non_constant_identifier_names
  String EEEE(DateTime dateTime) => DateFormat.EEEE().format(dateTime);

  // ignore: non_constant_identifier_names
  String Md(DateTime dateTime) => DateFormat.Md().format(dateTime);

  // ignore: non_constant_identifier_names
  String MEd(DateTime dateTime) => DateFormat.MEd().format(dateTime);

  // ignore: non_constant_identifier_names
  String MMM(DateTime dateTime) => DateFormat.MMM().format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMd(DateTime dateTime) => DateFormat.MMMd().format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMEd(DateTime dateTime) => DateFormat.MMMEd().format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMM(DateTime dateTime) => DateFormat.MMMM().format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMMd(DateTime dateTime) => DateFormat.MMMMd().format(dateTime);

  // ignore: non_constant_identifier_names
  String MMMMEEEEd(DateTime dateTime) =>
      DateFormat.MMMMEEEEd().format(dateTime);

  // ignore: non_constant_identifier_names
  String QQQ(DateTime dateTime) => DateFormat.QQQ().format(dateTime);

  // ignore: non_constant_identifier_names
  String QQQQ(DateTime dateTime) => DateFormat.QQQQ().format(dateTime);

  String yM(DateTime dateTime) => DateFormat.yM().format(dateTime);

  String yMd(DateTime dateTime) => DateFormat.yMd().format(dateTime);

  String yMEd(DateTime dateTime) => DateFormat.yMEd().format(dateTime);

  String yMMM(DateTime dateTime) => DateFormat.yMMM().format(dateTime);

  String yMMMd(DateTime dateTime) => DateFormat.yMMMd().format(dateTime);

  String yMMMdjm(DateTime dateTime) =>
      DateFormat.yMMMd().add_jm().format(dateTime).replaceAll(' ', ' ');

  String yMMMEd(DateTime dateTime) => DateFormat.yMMMEd().format(dateTime);

  String yMMMEdjm(DateTime dateTime) =>
      DateFormat.yMMMEd().add_jm().format(dateTime).replaceAll(' ', ' ');

  String yMMMM(DateTime dateTime) => DateFormat.yMMMM().format(dateTime);

  String yMMMMd(DateTime dateTime) => DateFormat.yMMMMd().format(dateTime);

  String yMMMMdjm(DateTime dateTime) =>
      DateFormat.yMMMMd().add_jm().format(dateTime).replaceAll(' ', ' ');

  String yMMMMEEEEd(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().format(dateTime);

  String yMMMMEEEEdjm(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().add_jm().format(dateTime).replaceAll(' ', ' ');

  String yQQQ(DateTime dateTime) => DateFormat.yQQQ().format(dateTime);

  String yQQQQ(DateTime dateTime) => DateFormat.yQQQQ().format(dateTime);

  String H(DateTime dateTime) => DateFormat.H().format(dateTime);

  // ignore: non_constant_identifier_names
  String Hm(DateTime dateTime) => DateFormat.Hm().format(dateTime);

  // ignore: non_constant_identifier_names
  String Hms(DateTime dateTime) => DateFormat.Hms().format(dateTime);

  String j(DateTime dateTime) =>
      DateFormat.j().format(dateTime).replaceAll(' ', ' ');

  String jm(DateTime dateTime) =>
      DateFormat.jm().format(dateTime).replaceAll(' ', ' ');

  String jms(DateTime dateTime) =>
      DateFormat.jms().format(dateTime).replaceAll(' ', ' ');
}
