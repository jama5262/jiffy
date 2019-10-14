import 'package:jiffy/jiffy.dart';

main() async {
  print(Jiffy().format());
  var jiffy = Jiffy()..utc();
  print(jiffy.dateTime);
  print(jiffy.format("yyyy, hh:mm a"));
  print(Jiffy().utc());
//  print(Jiffy("Oct 24", "MMM dd").format("yyyy, hh:mm a"));

  Jiffy jiffy2 = Jiffy()
    ..add(1, "M")
    ..utc();

  print(jiffy2.format("MMM, hh:mm a dd yyyy"));
}
