import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'Inventory.dart';

class CuentaScreen extends ConsumerWidget {
  const CuentaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String buscar = '';
    return Scaffold(
        backgroundColor: colorprimario,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(8),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 1,
                        child: EspacioDeTexto(
                          "buscar",
                          colorprimario,
                          null,
                        )),
                    SizedBox(width: 20),
                    Flexible(
                        flex: 2,
                        child:
                            Boton("buscar", () {}, 200, 60, 30, colorprimario)),
                    SizedBox(width: 20),
                    Flexible(
                        flex: 1,
                        child:
                            Boton("añadir", () {}, 200, 60, 30, colorprimario)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 20,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ResponsiveGridList(
                          desiredItemWidth: 200, minSpacing: 10, children: []),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
