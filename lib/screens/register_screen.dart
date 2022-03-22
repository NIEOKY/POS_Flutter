import 'package:flutter/material.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';

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
          SizedBox(height: 20),
          EspacioDeTexto("Name", colortexto, null),
          SizedBox(height: 20),
          EspacioDeTexto("UserName", colortexto, null),
          SizedBox(height: 20),
          EspacioDeTexto("Password", colortexto, null),
          SizedBox(height: 20),
          Boton("Registrar", () {
            Navigator.pop(context);
          }, 300, 60, 30, null)
        ],
      ),
    ));
  }
}
