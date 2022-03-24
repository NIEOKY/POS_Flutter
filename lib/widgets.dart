import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:point_of_sale/Provider.dart';

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
  final String texto;
  Color? color;
  IconData? icon;
  double? wid;
  double? font;

  EspacioDeTexto(this.texto, this.color, this.icon, {Key? key})
      : super(key: key);
  EspacioDeTexto.widfont(this.texto, this.color, this.font, this.wid,
      {Key? key})
      : super(key: key);

  @override
  State<EspacioDeTexto> createState() => _EspacioDeTextoState();
}

class _EspacioDeTextoState extends State<EspacioDeTexto> {
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
                  ref.read(indexprovider.notifier).state = 0;
                }, 300, 80, 40, null, Icons.home),
              ),
            ),
            SizedBox(
              height: height! * 0.05,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Boton.icono("Cuenta", () {
                  ref.read(indexprovider.notifier).state = 1;
                }, 300, 80, 40, null, Icons.shopping_cart),
              ),
            ),
            SizedBox(
              height: height! * 0.05,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Boton.icono("Inventario", () {
                  ref.read(indexprovider.notifier).state = 2;
                }, 300, 80, 40, null, Icons.inventory),
              ),
            ),
            SizedBox(
              height: height! * 0.05,
            ),
            Flexible(
              flex: 1,
              child: FittedBox(
                child: Boton.icono("ventas", () {
                  ref.read(indexprovider.notifier).state = 3;
                }, 300, 80, 40, null, Icons.sell_rounded),
              ),
            ),
            SizedBox(
              height: height! * 0.2,
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

class ItemInventario extends StatefulWidget {
  String? nombre;
  int? cantidad;
  double? precio;
  Function? onPressed;
  ItemInventario(this.nombre, this.cantidad, this.precio, this.onPressed,
      {Key? key})
      : super(key: key);

  @override
  State<ItemInventario> createState() => _ItemInventarioState();
}

class _ItemInventarioState extends State<ItemInventario> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Expanded(
                  child: Texto('${widget.nombre}', 20),
                  flex: 1,
                ),
              ),
            ),
            Expanded(
              child: Texto('${widget.cantidad}', 20),
              flex: 1,
            ),
            Expanded(
              child: Texto('\$ ${widget.precio}', 20),
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
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
                  child: Icon(
                    Icons.add_circle_outline_rounded,
                    size: 40,
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
  const CuentaItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GridView.count(
      crossAxisSpacing: 1,
      mainAxisSpacing: 2,
      crossAxisCount: 4,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(20),
          child: Expanded(
            child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  shadowColor:
                      MaterialStateProperty.all(Color.fromARGB(0, 0, 0, 0)),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                child: Stack(children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text('Pollo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: colortexto,
                                    fontSize: 20,
                                  )),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(child: Texto('400', 20)),
                                  Expanded(child: Texto('\$250', 20)),
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                  Image.asset('assets/Pollo.png'),
                ])
                /* child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(child: Image.asset('assets/Pollo.png'))),
                  Expanded(
                    child: Container(
                      color: colorfondo,
                      child: Text('Pollo',
                          style: TextStyle(
                            color: colortexto,
                            fontSize: 20,
                          )),
                    ),
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Texto('400', 20)),
                      Expanded(child: Texto('\$250', 20)),
                    ],
                  )),
                ],
              ),*/
                ),
          ),
        ),
      ],
    );
  }
}
