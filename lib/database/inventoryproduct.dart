import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'inventoryproduct.g.dart';

@HiveType(typeId: 1)
class InventoryProduct extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late double price;
  @HiveField(2)
  late double quantity;

  InventoryProduct({
    required this.name,
    required this.price,
    required this.quantity,
  });
}
