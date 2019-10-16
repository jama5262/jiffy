import 'package:jiffy/jiffy.dart';

main() async {
  var j = Jiffy("2019, 10, 16 10:00:00 pm", "yyyy, MM, dd h:mm:ss a")..utc();
  print(j.yMMMMdjm);
}
