import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:point_of_sale/database/product.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/database/inventoryproduct.dart';
import 'package:point_of_sale/providers.dart';
import 'package:point_of_sale/screens/principal_screen.dart';

class Texto extends StatelessWidget {
  final double textsize;
  final String text;

  Texto(this.text, this.textsize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: textsize, fontWeight: FontWeight.bold, color: colortexto),
      softWrap: false,
    );
  }
}

class Boton extends StatefulWidget {
  final String text;
  Function? onPressed;
  final double? textsize;
  double? height;
  double? width;
  Color? color;
  IconData? icon;
  Boton(this.text, this.onPressed, this.width, this.height, this.textsize,
      this.color,
      {Key? key})
      : super(key: key);
  Boton.icono(this.text, this.onPressed, this.width, this.height, this.textsize,
      this.color, this.icon,
      {Key? key})
      : super(key: key);

  @override
  State<Boton> createState() => _BotonState();
}

class _BotonState extends State<Boton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height!,
        child: ElevatedButton.icon(
          icon: widget.icon == null
              ? Container()
              : Icon(widget.icon, size: widget.textsize),
          onPressed: () {
            widget.onPressed!();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all(widget.color ?? colorprimario),
          ),
          label: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.textsize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}

class EspacioDeTexto extends StatefulWidget {
  late String texto;
  void Function(String)? onChanged;
  Color? color;
  IconData? icon;
  double? wid;
  double? font;

  EspacioDeTexto(this.texto, this.color, this.icon, {Key? key})
      : super(key: key);
  EspacioDeTexto.widfont(this.texto, this.color, this.font, this.wid,
      {Key? key})
      : super(key: key);
  EspacioDeTexto.onChanged(this.texto, this.color, this.icon, this.onChanged,
      {Key? key})
      : super(key: key);

  @override
  State<EspacioDeTexto> createState() => _EspacioDeTextoState();
}

class _EspacioDeTextoState extends State<EspacioDeTexto> {
  final textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    widget.color = widget.color ?? colortexto;
    return Container(
      width: widget.wid ?? 300,
      child: Material(
        elevation: 5,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(20),
        child: Theme(
          data: ThemeData(
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: colorprimario),
          ),
          child: TextField(
            controller: textcontroller,
            onChanged: widget.onChanged,
            style: TextStyle(
              color: colortexto,
              fontSize: widget.font ?? 20,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                widget.icon,
              ),
              iconColor: colorprimario,
              hintText: widget.texto,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: widget.color!),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colorprimario),
                borderRadius: BorderRadius.circular(20),
              ),
              labelStyle: const TextStyle(
                color: colortexto,
                fontSize: 20,
              ),
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  color: widget.color!,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  //make a function that will save the data in the variable textovalor and then return it

}

class IconBoton extends StatefulWidget {
  String? texto;
  IconData? icon;
  double? width;
  double? height;
  Color? color;

  IconBoton(this.texto, this.icon, this.width, this.height, this.color,
      {Key? key})
      : super(key: key);

  @override
  State<IconBoton> createState() => _IconBotonState();
}

class _IconBotonState extends State<IconBoton> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion();
  }
}

class Sidebar extends ConsumerWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexprovider);
    //calculate the height of the screen
    final double? height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: colorfondo,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(78, 0, 0, 0),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Flexible(
              flex: 1,
              child: FittedBox(
                child: CircleAvatar(
                    backgroundColor: colorterciario,
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: colorprimario,
                    )),
              ),
            ),
            SizedBox(
              height: height! * 0.05,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Boton.icono("Resumen", () {
                  ref.read(indexprovider.state).state = 0;
                }, 300, 80, 40, null, Icons.home),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Boton.icono("Cuenta", () {
                  ref.read(indexprovider.state).state = 1;
                }, 300, 80, 40, null, Icons.shopping_cart),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Boton.icono("Inventario", () {
                  ref.read(indexprovider.state).state = 2;
                }, 300, 80, 40, null, Icons.inventory),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Boton.icono("ventas", () {
                  ref.read(indexprovider.state).state = 3;
                }, 300, 80, 40, null, Icons.sell_rounded),
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Boton.icono("CerrarSesion", () {
                    Navigator.pop(context);
                  }, 180, 80, 18, Color.fromARGB(255, 146, 19, 3),
                      Icons.logout),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class ItemInventario extends ConsumerWidget {
  var txt = TextEditingController();
  int id;
  String nombre;
  double cantidad;
  double precio;

  ItemInventario(this.nombre, this.precio, this.cantidad, this.id, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late Box box = Hive.box<InventoryProduct>("products");

    double cantidadausar = 0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      // make a alert dialog to confirm if you want to delete the product
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Eliminar"),
                            content:
                                Text("¿Está seguro de eliminar el producto?"),
                            actions: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        colorprimario)),
                                child: Text("Cancelar"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        colorprimario)),
                                child: Text("Eliminar"),
                                onPressed: () {
                                  box.deleteAt(id);
                                  ref
                                      .read(indexinventoryproductprovider.state)
                                      .state--;
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    })),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Texto('$nombre', 20),
              ),
            ),
            Expanded(
              child: Texto('${cantidad}', 20),
              flex: 2,
            ),
            Expanded(
              child: Texto('\$ $precio', 20),
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    if (cantidad - cantidadausar > 0) {
                      box.putAt(
                          id,
                          InventoryProduct(
                              name: nombre,
                              price: precio,
                              quantity: cantidad - cantidadausar));
                      ref.read(itemsproviders[id].state).state =
                          cantidad - cantidadausar;
                    } else {
                      box.putAt(
                          id,
                          InventoryProduct(
                              name: nombre, price: precio, quantity: 0));
                      ref.read(itemsproviders[id].state).state = 0;
                    }
                  },
                  icon: Icon(Icons.remove_circle_outline),
                  color: Colors.red,
                  iconSize: 40,
                ),
                Container(
                  width: 100,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: txt,
                      onChanged: (value) {
                        cantidadausar = double.parse(value);
                      },
                      style: TextStyle(
                        color: colortexto,
                        fontSize: 20,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      box.putAt(
                          id,
                          InventoryProduct(
                              name: nombre,
                              price: precio,
                              quantity: cantidad + cantidadausar));
                      ref.read(itemsproviders[id].state).state =
                          cantidad + cantidadausar;
                    },
                    iconSize: 40,
                    color: Colors.green[900],
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorItem,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(71, 0, 0, 0),
                blurRadius: 2,
                spreadRadius: 1,
                offset: Offset(2, 2),
              ),
            ]),
      ),
    );
  }
}

class CuentaItem extends ConsumerWidget {
  final String nombre;
  final double precio;
  CuentaItem(this.nombre, this.precio, {Key? key}) : super(key: key);

  @override
  final ButtonStyle estilodeboton = ElevatedButton.styleFrom(
    primary: Colors.white,
    onPrimary: colorprimario,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(10),
    textStyle: TextStyle(color: Colors.white),
  );
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 240,
      child: ElevatedButton(
        onPressed: () {},
        style: estilodeboton,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  flex: 3,
                  child: Container(
                    child: Image.asset(
                      'assets/Pollo.png',
                      scale: 1,
                    ),
                  )),
              Expanded(
                child: FittedBox(
                  child: Center(
                    child: Text(nombre.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: colortexto,
                            fontSize: 40,
                            fontStyle: FontStyle.italic)),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: Center(child: Texto('$precio', 20))),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
