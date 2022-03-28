import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:point_of_sale/database/inventoryproduct.dart';
import 'package:point_of_sale/widgets.dart';

final indexprovider = StateProvider<int>((ref) {
  int counter = 0;
  return counter;
});

final indexinventoryproductprovider = StateProvider<int>((ref) {
  late Box box = Hive.box<InventoryProduct>("products");
  final products = box.values.toList();

  int counter = products.length;
  return counter;
});
final lengthprovider = StateProvider<int>((ref) {
  int counter = 0;
  return counter;
});
final textprovider = StateProvider<String>((ref) {
  String text = "";
  return text;
});
final List<StateProvider<double>> itemsproviders = [];
