import 'package:hive/hive.dart';

import 'hive_model.dart';

class Boxes {
  static Box<HiveProduct> getData() => Hive.box<HiveProduct>("cart");
}
