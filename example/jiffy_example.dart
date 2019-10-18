import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
  var jiffy2 = Jiffy('2010-10-20', "yyyy-MM-dd")..add(1, "w");

  print(jiffy1.isBefore(jiffy2, "w"));
}
