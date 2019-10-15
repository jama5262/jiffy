import 'package:jiffy/jiffy.dart';

main() async {
  var locale = await Jiffy.locale("ardz");
  print(locale);
  var jiffy1 = Jiffy().fromNow();
  var jiffy2 = Jiffy()..subtract(1, "m");
  var jiffy3 = Jiffy()..subtract(10, "m");
  var jiffy4 = Jiffy()..subtract(1, "h");
  var jiffy5 = Jiffy()..subtract(10, "h");
  var jiffy6 = Jiffy()..subtract(1, "d");
  var jiffy7 = Jiffy()..subtract(10, "d");
  var jiffy8 = Jiffy()..subtract(1, "M");
  var jiffy9 = Jiffy()..subtract(10, "M");
  var jiffy10 = Jiffy()..subtract(1, "y");
  var jiffy11 = Jiffy()..subtract(10, "y");
  var jiffy12 = Jiffy()..add(10, "y");
  var jiffy13 = Jiffy()..add(20, "m");

  print(Jiffy().yMMMMEEEEdjm);

  print(jiffy1 + " - now");
  print(jiffy2.fromNow() + " - a minute ago");
  print(jiffy3.fromNow() + " - 10 minute ago");
  print(jiffy4.fromNow() + " - a hour ago");
  print(jiffy5.fromNow() + " - 10 hours ago");
  print(jiffy6.fromNow() + " - a day ago");
  print(jiffy7.fromNow() + " - 10 day ago");
  print(jiffy8.fromNow() + " - a month ago");
  print(jiffy9.fromNow() + " - 10 month ago");
  print(jiffy10.fromNow() + " - a year ago");
  print(jiffy11.fromNow() + " - 10 year ago");
  print(jiffy12.fromNow() + " - in 10 year");
  print(jiffy13.fromNow() + " - in 20 minutes");
}
