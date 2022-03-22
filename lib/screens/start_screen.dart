import 'package:flutter/material.dart';
import 'package:point_of_sale/constants.dart';
import 'package:point_of_sale/widgets.dart';
import 'package:point_of_sale/screens/register_screen.dart';
import 'package:point_of_sale/screens/principal_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
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
              EspacioDeTexto('Nombre', null, Icons.person),
              const SizedBox(height: 20),
              EspacioDeTexto('Apellido', null, Icons.lock),
              const SizedBox(height: 40),
              Boton.icono('Iniciar Sesión', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrincipalScreen()));
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
}
