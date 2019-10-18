import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
  var jiffy2 = Jiffy('2009-12-31', "yyyy-MM-dd");

  print(jiffy1.isAfter(jiffy2, "y"));
}
