import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy = Jiffy()..add(0, "h");
  print(jiffy.local().timeZoneName);
  print(jiffy.utc().timeZoneName);
}
