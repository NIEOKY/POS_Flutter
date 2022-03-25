import 'package:flutter/material.dart';
import 'package:point_of_sale/Provider.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:point_of_sale/provider.dart';
import 'package:riverpod/riverpod.dart';

class InventoryScreen extends ConsumerWidget {
  List<String> nombres = <String>[
    "Producto 1",
    "Producto 2",
    "Producto 3",
    '4',
    '5',
    '76',
    '7',
    '8'
  ];
  List<int> cantidades = <int>[1, 2, 3, 4, 5, 6, 7, 8];
  List<double> precio = <double>[1, 2, 3, 4, 5, 6, 7, 8];
  InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(62, 0, 0, 0),
            offset: Offset(5, 5),
            blurRadius: 10,
          )
        ],
        color: colorfondo,
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            flex: 10,
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
          SizedBox(height: 20),
          Expanded(
            flex: 1,
            child: Container(
              color: colorprimario,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 6,
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Texto("Nombre", 20),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Texto("Cantidad", 20),
                      ),
                    ),
                    Expanded(flex: 1, child: Texto("Precio", 20)),
                    SizedBox(width: 200),
                  ]),
            ),
          ),
          Expanded(
            flex: 100,
            child: ListView.builder(
              shrinkWrap: true,
              controller: ScrollController(),
              itemCount: nombres.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ItemInventario(
                    nombres[index],
                    cantidades[index],
                    precio[index],
                    () {},
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
