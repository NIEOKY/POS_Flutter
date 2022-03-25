import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_of_sale/Provider.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'Inventory.dart';

class CuentaScreen extends ConsumerWidget {
  const CuentaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  flex: 1,
                  child: EspacioDeTexto("buscar", colorprimario, null)),
              SizedBox(width: 20),
              Flexible(
                  flex: 2,
                  child: Boton("buscar", () {}, 200, 60, 30, colorprimario)),
              SizedBox(width: 20),
              Flexible(
                  flex: 1,
                  child: Boton("añadir", () {}, 200, 60, 30, colorprimario)),
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          flex: 20,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: ResponsiveGridList(
                    desiredItemWidth: 200,
                    minSpacing: 10,
                    children: [
                      CuentaItem(),
                      CuentaItem(),
                      CuentaItem(),
                      CuentaItem(),
                      CuentaItem(),
                      CuentaItem(),
                      CuentaItem()
                    ]),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: colorprimario,
                  ))
            ],
          ),
        ),
      ],
    ));
  }
}
