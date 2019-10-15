import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy1 = Jiffy("2200 1 1", "yyyy M dd");
  var jiffy2 = Jiffy("2019 10 1", "yyyy M dd");

  print(jiffy1.year);
  print(jiffy2.year);

  print(jiffy1.diff(jiffy2, "", true));
}
