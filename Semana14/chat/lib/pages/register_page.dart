import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  final void Function() onTap;
  void register() {

  }

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
                'Registro de Usuarios',
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
              
              //password textfield
              MyTextField(
                hintText: "Correo Electronico", 
                obscureText: false, 
                controller: emailController,
                ),
               
              //login button
              SizedBox(height: 10),
              MyTextField(
                hintText: "Contraseña",
                obscureText: true, 
                controller: passwordController,
                ),
              
              SizedBox(height: 10),
              
              MyTextField(
                hintText: "Confirmar Password", 
                obscureText: true, 
                controller: confirmController,
                ),

              SizedBox(height: 20),
              
              MyButton(
                onTap: register,
                text: "Registrar",
                ),
              //register link
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("¿Ya Tienes Cuenta? "),
                  Text("Inicia sesion",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
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