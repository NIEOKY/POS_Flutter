import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_of_sale/Provider.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'Inventory.dart';
import 'package:point_of_sale/screens/cuenta.dart';
import 'package:point_of_sale/screens/resumen.dart';
import 'package:point_of_sale/screens/ventas.dart';

class PrincipalScreen extends ConsumerWidget {
  PrincipalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexprovider);
    switch (index) {
      case 0:
        return Scaffold(
            body: Row(
          children: [
            Flexible(flex: 1, child: Sidebar()),
            Flexible(flex: 6, child: ResumenScreen()),
          ],
        ));
      case 1:
        return Scaffold(
            body: Row(
          children: [
            Flexible(flex: 1, child: Sidebar()),
            Flexible(flex: 6, child: CuentaScreen()),
          ],
        ));
      case 2:
        return Scaffold(
            body: Row(
          children: [
            Expanded(flex: 1, child: Sidebar()),
            Expanded(flex: 6, child: InventoryScreen()),
          ],
        ));
      case 3:
        return Scaffold(
            body: Row(
          children: [
            Flexible(flex: 1, child: Sidebar()),
            Flexible(flex: 6, child: VentasScreen()),
          ],
        ));
      default:
        return Scaffold(
            body: Row(
          children: [
            Flexible(flex: 1, child: Sidebar()),
            Flexible(flex: 6, child: ResumenScreen()),
          ],
        ));
    }
  }
}
