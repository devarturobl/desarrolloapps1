import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key, required this.onTap});

  //declaramos los controladores para los textfield
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: 50),
              //Welcome
              Text(
                'Bienvenido de nuevo, listo para trabajar',
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //email textfield
              SizedBox(height: 25),
              //Ocupamos un componente personalizado MyTextField
              //los Textfield requieren un controlador para obtener el valor ingresado
              MyTextField(
                hintText: "Correo Electronico", 
                obscureText: false, 
                controller: emailController,
                ),
              SizedBox(height: 10),
              //password textfield
               MyTextField(
                hintText: "Contraseña",
                obscureText: true, 
                controller: passwordController,
                ),
              //login button
              
              SizedBox(height: 20),
              
              MyButton(
                onTap: onTap,
                text: "Iniciar Sesion",
                ),
              //register link
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿No eres miembro? "),
                  GestureDetector(
                    onTap: onTap,
                    child: Text("Registrate aqui",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}