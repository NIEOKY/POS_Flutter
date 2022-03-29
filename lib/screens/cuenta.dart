import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:point_of_sale/clases/cuenta.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/database/product.dart';
import 'package:point_of_sale/providers.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../database/inventoryproduct.dart';
import 'Inventory.dart';

class CuentaScreen extends ConsumerWidget {
  const CuentaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String nombre = "";
    double precio = 0;

    late Box box = Hive.box<Product>("compoundproducts");
    final compoundproducts = box.values.toList();

    final listaobjetos = ListView.builder(
      itemCount: ref.watch(indexCompoundProductProvider.state).state,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CuentaItem(
            compoundproducts[index].name,
            compoundproducts[index].price,
          ),
        );
      },
    );
    final listaob = [listaobjetos].toList();
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
                        child: Boton("añadir", () {
                          //show a dialog to add a new product
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Añadir producto"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Nombre"),
                                      TextField(
                                        onChanged: (value) {
                                          buscar = value;
                                        },
                                      ),
                                      Text("Precio"),
                                      TextField(
                                        onChanged: (value) {
                                          precio = double.parse(value);
                                        },
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      child: Text("Cancelar"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ElevatedButton(
                                      child: Text("Añadir"),
                                      onPressed: () {
                                        ref
                                            .read(indexCompoundProductProvider
                                                .state)
                                            .state++;
                                        addcuentaproduct(nombre, precio, ref);
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }, 200, 60, 30, colorprimario)),
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
                            desiredItemWidth: 200,
                            minSpacing: 10,
                            //add to children only if the list is not empty
                            children: ref
                                        .watch(
                                            indexCompoundProductProvider.state)
                                        .state >
                                    0
                                ? listaob
                                : [])),
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

Future addcuentaproduct(String nombre, double precio, WidgetRef ref) async {
  bool exist = false;
  final Box box = Hive.box<Product>("compoundproducts");
  final products = box.values.toList();
  for (var produc in products) {
    //change the data of the product if it already exists in the database
    if (produc.name == nombre) {
      exist = true;
      final product = CuentaItem(nombre, precio);
      box.putAt(products.indexOf(produc), product);
    }
  }
  if (!exist) {
    final product = CuentaItem(nombre, precio);
    box.add(product);
  }
}
