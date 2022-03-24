import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_of_sale/Provider.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'Inventory.dart';

class CuentaScreen extends ConsumerWidget {
  const CuentaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        alignment: Alignment.center,
        color: colorprimario,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: colorprimario,
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: colorsecundario,
                ))
          ],
        ));
  }
}
