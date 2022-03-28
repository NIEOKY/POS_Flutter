import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:point_of_sale/providers.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/database/inventoryproduct.dart';
import 'package:point_of_sale/screens/principal_screen.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class InventoryScreen extends ConsumerWidget {
  InventoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    itemsproviders.clear();
    late Box box = Hive.box<InventoryProduct>("products");
    final products = box.values.toList();
    ref.read(indexinventoryproductprovider.state).state = products.length;
    for (var product in products) {
      itemsproviders.add(StateProvider((ref) => product.quantity));
    }

    String nombre = "";
    double precio = 0;
    double cantidad = 0;
    final listtvieww = ListView.builder(
      shrinkWrap: true,
      controller: ScrollController(),
      itemCount: ref.watch(indexinventoryproductprovider.state).state,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ItemInventario(
              box.getAt(index).name,
              box.getAt(index).price,
              //box.getAt(index).quantity,
              ref.watch(itemsproviders[index].state).state,
              index,
            ));
      },
    );

    String buscar = "";
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
                    child: EspacioDeTexto(
                      "buscar",
                      colorprimario,
                      null,
                    )),
                SizedBox(width: 20),
                Flexible(
                    flex: 2,
                    child: Boton("buscar", () {}, 200, 60, 30, colorprimario)),
                SizedBox(width: 20),
                Flexible(
                    flex: 1,
                    child: Boton("añadir", () {
                      //create a pop up to add a new product
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Añadir producto"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Nombre"),
                                TextField(
                                  onChanged: (value) {
                                    nombre = value;
                                  },
                                ),
                                Text("Cantidad"),
                                TextField(
                                  onChanged: (value) {
                                    cantidad = double.parse(value);
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
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        colorprimario)),
                                child: Text("Cancelar"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        colorprimario)),
                                child: Text("Añadir"),
                                onPressed: () {
                                  addProduct(nombre, precio, cantidad, ref);
                                  ref
                                      .read(indexinventoryproductprovider.state)
                                      .state = box.length;
                                  itemsproviders
                                      .add(StateProvider(((ref) => 0)));

                                  Navigator.of(context).pop();

                                  //update the provider

                                  //enter inventory screen again for refresh
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }, 200, 60, 30, colorprimario)),
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
            child: listtvieww,
          )
        ],
      ),
    );
  }

  //create a function to add a new product to the database and update the list of products also check if the product already exists in the database and if it does update the quantity and price of the product
  Future addProduct(
      String nombre, double precio, double cantidad, WidgetRef ref) async {
    bool exist = false;
    final Box box = Hive.box<InventoryProduct>("products");
    final products = box.values.toList();
    for (var product in products) {
      //change the data of the product if it already exists in the database
      if (product.name == nombre) {
        exist = true;
      }
    }
    if (!exist) {
      final product = InventoryProduct(
        name: nombre,
        price: precio,
        quantity: cantidad,
      );
      box.add(product);
    }
  }
}
