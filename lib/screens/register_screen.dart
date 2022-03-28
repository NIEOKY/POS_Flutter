import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/start_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/user.dart';

String name = '';
String username = '';
String password = '';
bool existe = false;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EspacioDeTexto.onChanged("Nombre", colortexto, null, (value) {
            name = value;
          }),
          SizedBox(
            height: 20,
          ),
          EspacioDeTexto.onChanged("UserName", colortexto, null, (value) {
            username = value;
          }),
          SizedBox(
            height: 20,
          ),
          EspacioDeTexto.onChanged("Contraseña", colortexto, null, (value) {
            password = value;
          }),
          SizedBox(
            height: 20,
          ),
          Boton("Registrar", () {
            addUser(name, username, password, context);
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

//create a function to add a user to the box if the user doesn't exist
//the function will recieve the name, username and password

Future addUser(
    String name, String username, String password, BuildContext context) async {
  existe = false;
  final box = await Hive.openBox<User>('users');

  final user = User(name: name, username: username, password: password);

  //check if this user is in
  for (var i = 0; i < box.length; i++) {
    if (box.getAt(i)?.username == username) {
      existe = true;
    }
  }
  if (existe == false) {
    box.add(user);
    print("User added");
    Navigator.pop(context);
  } else {
    //generate a dialog to show the user that the user already exists
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Usuario ya existe"),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(colorprimario)),
                child: Text("Aceptar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
