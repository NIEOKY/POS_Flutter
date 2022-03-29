import 'package:hive_flutter/hive_flutter.dart';
import 'package:point_of_sale/database/inventoryproduct.dart';

part 'product.g.dart';

@HiveType(typeId: 2)
class Product {
  @HiveField(1)
  late String name;
  @HiveField(2)
  late List<InventoryProduct> products;
  @HiveField(3)
  late List<int> productint;
  @HiveField(4)
  late double price;
}
