import 'package:jiffy/jiffy.dart';

main() async {
  var jiffy = Jiffy()..endOf("d");
  print(jiffy.dateTime);
}
