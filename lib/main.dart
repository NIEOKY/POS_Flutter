import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:point_of_sale/database/user.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'database/inventoryproduct.dart';
import 'database/user.dart';
import 'screens/start_screen.dart';
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(InventoryProductAdapter());
  await Hive.openBox<InventoryProduct>('products');
  await Hive.openBox<User>('users');
  Box box = Hive.box<InventoryProduct>('products');
  //box.deleteFromDisk();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
