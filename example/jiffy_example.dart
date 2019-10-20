import 'package:jiffy/jiffy.dart';

main() async {
//  FORMATTING DATES
  Jiffy().format("MMMM dd yyyy, h:mm:ss a"); // October 19 2019, 7:00:53 PM
  Jiffy().format("EEEE"); // Saturday
  Jiffy().format("yyyy 'escaped' yyyy"); // 2019 escaped 2019

//  Not passing a string pattern for format method will return an ISO Date format
  Jiffy().format(); // 2019-10-19T19:00:53.090646

//  You can also use default formats
  Jiffy().yMMMMd; // October 19, 2019
  Jiffy().yMMMMEEEEdjm; // Saturday, October 19, 2019 7:00 PM

//  RELATIVE TIME
  Jiffy("2011-10-31", "yyyy-MM-dd").fromNow(); // 8 years ago
  Jiffy("2012-06-20", "yyyy-MM-dd").fromNow(); // 7 years ago

  var jiffy1 = Jiffy()
    ..startOf("day");
  jiffy1.fromNow(); // 19 hours ago

  var jiffy2 = Jiffy()
    ..endOf("day");
  jiffy2.fromNow(); // in 5 hours

  var jiffy3 = Jiffy()
    ..startOf("hour");
  jiffy3.fromNow(); // 9 minutes ago

//  MANIPULATING DATES
  var jiffy4 = Jiffy()
    ..add(1, "day");
  jiffy4.yMMMMd; // October 20, 2019

  var jiffy5 = Jiffy()
    ..subtract(1, "day");
  jiffy5.yMMMMd; // October 18, 2019

//  You can chain methods by using Dart method cascading
  var jiffy6 = Jiffy()
    ..add(1, "day")
    ..add(3, "hours")
    ..subtract(30, "minutes");
  jiffy6.yMMMMEEEEdjm; // Sunday, October 20, 2019 9:50 PM

//  LOCALES
//  The locale method always return a future
//  To get locale (The default locale is English)
  await Jiffy.locale(); // en
//  To set locale
  await Jiffy.locale("fr");
  Jiffy().yMMMMEEEEdjm; // samedi 19 octobre 2019 19:25
  await Jiffy.locale("ar");
  Jiffy().yMMMMEEEEdjm; // السبت، ١٩ أكتوبر ٢٠١٩ ٧:٢٧ م
  await Jiffy.locale("zh-cn");
  Jiffy().yMMMMEEEEdjm; // 2019年10月19日星期六 下午7:28
}
