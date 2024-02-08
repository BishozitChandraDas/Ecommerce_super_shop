import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class HiveProduct extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  int quantity;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? price;
  @HiveField(5)
  String? weight;
  @HiveField(6)
  String? image;

  HiveProduct({
    required this.id,
    required this.quantity,
    required this.name,
    required this.description,
    required this.price,
    required this.weight,
    required this.image,
  });
}
