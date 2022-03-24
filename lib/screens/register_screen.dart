import 'package:flutter/material.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EspacioDeTexto("Name", colortexto, null),
          SizedBox(
            height: 20,
          ),
          EspacioDeTexto("UserName", colortexto, null),
          SizedBox(
            height: 20,
          ),
          EspacioDeTexto("Password", colortexto, null),
          SizedBox(
            height: 20,
          ),
          Boton("Registrar", () {
            Navigator.pop(context);
          }, 300, 60, 30, null),
          SizedBox(
            height: 30,
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Volver",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: colortexto),
              )),
          SizedBox(),
        ],
      ),
    ));
  }
}
