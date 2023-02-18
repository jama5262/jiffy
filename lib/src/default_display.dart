import 'package:intl/intl.dart';

class DefaultDisplay {
  String E(DateTime dateTime) => DateFormat.E().format(dateTime);

  String EEEE(DateTime dateTime) => DateFormat.EEEE().format(dateTime);

  String Md(DateTime dateTime) => DateFormat.Md().format(dateTime);

  String MEd(DateTime dateTime) => DateFormat.MEd().format(dateTime);

  String MMM(DateTime dateTime) => DateFormat.MMM().format(dateTime);

  String MMMd(DateTime dateTime) => DateFormat.MMMd().format(dateTime);

  String MMMEd(DateTime dateTime) => DateFormat.MMMEd().format(dateTime);

  String MMMM(DateTime dateTime) => DateFormat.MMMM().format(dateTime);

  String MMMMd(DateTime dateTime) => DateFormat.MMMMd().format(dateTime);

  String MMMMEEEEd(DateTime dateTime) =>
      DateFormat.MMMMEEEEd().format(dateTime);

  String QQQ(DateTime dateTime) => DateFormat.QQQ().format(dateTime);

  String QQQQ(DateTime dateTime) => DateFormat.QQQQ().format(dateTime);

  String yM(DateTime dateTime) => DateFormat.yM().format(dateTime);

  String yMd(DateTime dateTime) => DateFormat.yMd().format(dateTime);

  String yMEd(DateTime dateTime) => DateFormat.yMEd().format(dateTime);

  String yMMM(DateTime dateTime) => DateFormat.yMMM().format(dateTime);

  String yMMMd(DateTime dateTime) => DateFormat.yMMMd().format(dateTime);

  String yMMMdjm(DateTime dateTime) =>
      DateFormat.yMMMd().add_jm().format(dateTime);

  String yMMMEd(DateTime dateTime) => DateFormat.yMMMEd().format(dateTime);

  String yMMMEdjm(DateTime dateTime) =>
      DateFormat.yMMMEd().add_jm().format(dateTime);

  String yMMMM(DateTime dateTime) => DateFormat.yMMMM().format(dateTime);

  String yMMMMd(DateTime dateTime) => DateFormat.yMMMMd().format(dateTime);

  String yMMMMdjm(DateTime dateTime) =>
      DateFormat.yMMMMd().add_jm().format(dateTime);

  String yMMMMEEEEd(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().format(dateTime);

  String yMMMMEEEEdjm(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().add_jm().format(dateTime);

  String yQQQ(DateTime dateTime) => DateFormat.yQQQ().format(dateTime);

  String yQQQQ(DateTime dateTime) => DateFormat.yQQQQ().format(dateTime);

  String H(DateTime dateTime) => DateFormat.H().format(dateTime);

  String Hm(DateTime dateTime) => DateFormat.Hm().format(dateTime);

  String Hms(DateTime dateTime) => DateFormat.Hms().format(dateTime);

  String j(DateTime dateTime) => DateFormat.j().format(dateTime);

  String jm(DateTime dateTime) => DateFormat.jm().format(dateTime);

  String jms(DateTime dateTime) => DateFormat.jms().format(dateTime);
}
