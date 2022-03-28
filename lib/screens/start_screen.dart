import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/register_screen.dart';
import 'package:point_of_sale/screens/principal_screen.dart';
import 'package:point_of_sale/database/user.dart';

String username = '';
String password = '';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<User> users = [];
  @override
  dispose() {
    Hive.close();
    super.dispose();
  }
  //get the height of the screen

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Theme(
          data: ThemeData(
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: colorprimario),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Texto("Bienvenido", 40),
              const SizedBox(height: 40),
              EspacioDeTexto.onChanged('Usuario', null, Icons.person, (value) {
                username = value;
              }),
              const SizedBox(height: 20),
              EspacioDeTexto.onChanged('Contraseña', null, Icons.lock, (value) {
                password = value;
              }),
              const SizedBox(height: 40),
              Boton.icono('Iniciar Sesión', () {
                checkUser(username, password, context);
              }, 300, 60, 30, null, Icons.arrow_forward),
              const SizedBox(height: 40),
              Texto("¿No tienes un usuario?", 20),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                  child: Text(
                    "Registrarse",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colorprimario),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  //make a function to check if the user exists in the box and if it doesnt show a message saying that the user doesnt exist
  //if the user dont
  Future checkUser(
      String username, String password, BuildContext context) async {
    bool exis = false;
    final box = await Hive.openBox<User>('users');
    final users = box.values.toList();
    for (var user in users) {
      if (user.username == username && user.password == password) {
        exis = true;
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PrincipalScreen()));
      }
    }

    if (!exis) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(' EL usuario no existe'),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(colorprimario)),
                  child: Text('Aceptar',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }
}
