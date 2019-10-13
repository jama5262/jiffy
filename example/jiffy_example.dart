import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy = Jiffy().subtract(1, "y");
  print(jiffy);
}
