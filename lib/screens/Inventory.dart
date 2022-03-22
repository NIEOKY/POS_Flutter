import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';

class InventoryScreen extends StatefulWidget {
  InventoryScreen({Key? key}) : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
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

  Widget build(BuildContext context) {
    final double? wid = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: (MediaQuery.of(context).size.width) - 290 >= 0
            ? (MediaQuery.of(context).size.width) - 290
            : (MediaQuery.of(context).size.width) * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EspacioDeTexto("buscar", colorprimario, null),
                Boton("buscar", () {}, 200, 60, 30, colorprimario),
                Boton("añadir", () {}, 200, 60, 30, colorprimario),
              ],
            ),
            SizedBox(height: 20),
            Container(
              color: colorprimario,
              height: 5,
              width: (MediaQuery.of(context).size.width) - 290 >= 0
                  ? (MediaQuery.of(context).size.width) - 290
                  : (MediaQuery.of(context).size.width) * 0.2,
            ),
            SizedBox(height: 20),
            Container(
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
            Expanded(
              child: ListView.builder(
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
      ),
    );
  }
}
