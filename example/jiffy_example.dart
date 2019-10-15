import 'package:jiffy/jiffy.dart';

main() async {
  var locale = await Jiffy.locale("es");
  print(locale);
  print(Jiffy().jm);
  print(Jiffy().jms);
  print(Jiffy().yMd);
  print(Jiffy().yMMMMd);
  print(Jiffy().yMMMd);
  print(Jiffy().yMMMMdjm);
  print(Jiffy().yMMMdjm);
  print(Jiffy().yMMMMEEEEdjm);
  print(Jiffy().yMMMEd);
  print(Jiffy().yMMMEdjm);
}
