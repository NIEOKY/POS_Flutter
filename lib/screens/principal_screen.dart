import 'package:flutter/material.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'Inventory.dart';

class PrincipalScreen extends StatefulWidget {
  PrincipalScreen({Key? key}) : super(key: key);

  @override
  State<PrincipalScreen> createState() => _PrincipalScreenState();
}

class _PrincipalScreenState extends State<PrincipalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [Sidebar(), InventoryScreen()],
    ));
  }
}
