import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy = Jiffy()..add(0, "h");
  print(jiffy.local());
  print(Jiffy("2020-02-13 13:12:12:193215", "yyyy-MM-dd hh:mm:ss").local());
  print(Jiffy().local());
  print(Jiffy.unix(1570963450).local());
}
