import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_of_sale/widgets.dart';

final indexprovider = StateProvider<int>((ref) {
  int counter = 0;
  void increment() {
    counter = counter;
  }

  return counter;
});
