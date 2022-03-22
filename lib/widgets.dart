import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/screens/start_screen.dart';

class Texto extends StatelessWidget {
  final double textsize;
  final String text;

  Texto(this.text, this.textsize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: textsize,
        fontWeight: FontWeight.bold,
      ),
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
                borderRadius: BorderRadius.circular(35),
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
        borderRadius: BorderRadius.circular(35),
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
                borderRadius: BorderRadius.circular(35),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colorprimario),
                borderRadius: BorderRadius.circular(35),
              ),
              labelStyle: const TextStyle(
                color: colortexto,
                fontSize: 20,
              ),
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(35),
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

class Sidebar extends StatefulWidget {
  Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    //calculate the height of the screen
    final double? height = MediaQuery.of(context).size.height;
    return Container(
      width: 250,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Drawer(
          backgroundColor: colorfondo,
          elevation: 20,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(bottom: height! * 0.08),
              child: CircleAvatar(
                  backgroundColor: colorterciario,
                  radius: 60,
                  child: Icon(
                    Icons.person,
                    size: 100,
                    color: colorprimario,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Boton.icono("Resumen", () {}, 300, 50, 30, null, Icons.home),
            ),
            SizedBox(height: 0.08 * height),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Boton.icono(
                  "Cuenta", () {}, 300, 50, 30, null, Icons.shopping_cart),
            ),
            SizedBox(height: 0.08 * height),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Boton.icono(
                  "Inventario", () {}, 300, 50, 30, null, Icons.inventory),
            ),
            SizedBox(height: 0.08 * height),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Boton.icono("CerrarSesion", () {
                Navigator.pop(context);
              }, 180, 50, 18, Color.fromARGB(255, 146, 19, 3), Icons.logout),
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
  ItemInventario(this.nombre, this.cantidad, this.precio, {Key? key})
      : super(key: key);

  @override
  State<ItemInventario> createState() => _ItemInventarioState();
}

class _ItemInventarioState extends State<ItemInventario> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 80, left: 20),
              child: Texto('${widget.nombre}', 20),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70),
              child: Texto('${widget.cantidad}', 20),
            ),
            Texto('\$ ${widget.precio}', 20),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.remove_circle_outline),
                color: Colors.red,
                iconSize: 40,
              ),
            ),
            Container(
              width: 100,
              height: 80,
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
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.add_circle_outline_rounded,
                size: 40,
                color: Colors.green[900],
              ),
            ),
          ],
        )
      ],
    );
  }
}
