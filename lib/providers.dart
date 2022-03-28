import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_of_sale/database/inventoryproduct.dart';
import 'package:point_of_sale/widgets.dart';

final indexprovider = StateProvider<int>((ref) {
  int counter = 0;
  return counter;
});

final indexinventoryproductprovider = StateProvider<int>((ref) {
  int counter = 0;
  return counter;
});
final lengthprovider = StateProvider<int>((ref) {
  int counter = 0;
  return counter;
});

final List<StateProvider<double>> itemsproviders = [];
