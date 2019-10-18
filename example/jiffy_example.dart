import 'package:jiffy/jiffy.dart';

main() async {
  var j = Jiffy("2016, 10, 16 10:00:00 am", "yyyy, MM, dd h:mm:ss a");
  print(j.yMMMMdjm);
  print(Jiffy().unix());
  print(Jiffy.isDateTime(j));
}
