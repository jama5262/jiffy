import 'package:jiffy/jiffy.dart';

main() async {
  Jiffy jiffy2 = Jiffy();

  print(jiffy2.jm);
  print(jiffy2.jms);
  print(jiffy2.yMd);
  print(jiffy2.yMMMMd);
  print(jiffy2.yMMMd);
  print(jiffy2.yMMMMdjm);
  print(jiffy2.yMMMdjm);
  print(jiffy2.yMMMMEEEEdjm);
  print(jiffy2.yMMMEd);
  print(jiffy2.yMMMEd);
  print(jiffy2.valueOf());
  print(jiffy2.unix());
}
