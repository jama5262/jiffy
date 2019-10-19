import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy1 = Jiffy('2010-10-20', "yyyy-MM-dd");
  var jiffy2 = Jiffy('2011-9-19', "yyyy-MM-dd");
  var jiffy3 = Jiffy('2011-11-25', "yyyy-MM-dd");

//  print(Jiffy()..add(1, "y").);

  print(jiffy1.isBetween(jiffy2, jiffy3, "n"));
}
