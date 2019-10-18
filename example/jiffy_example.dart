import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy1 = Jiffy('2010-01-01', "yyyy-MM-dd");
  var jiffy2 = Jiffy('2010-01-01', "yyyy-MM-dd");

  print(jiffy1.isSame(jiffy2, "M"));
}
