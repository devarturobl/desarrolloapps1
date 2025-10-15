import 'package:flutter/material.dart';
import 'package:notes/auth/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscureText = true;

  void signUp() async {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;

    // Validar que las contraseñas coincidan
    if (password != confirmPassword) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Las contraseñas no coinciden')));
      }
      return;
    }

    try { 
      await authService.signUpWithEmailPassword(email, password);
      //Regresar a la pantalla de login
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error al registrar el usuario: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          Center(
            child: Text(
              "Crea una cuenta",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextField(
            controller: passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Password',
              prefix: Icon(Icons.lock),
              suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              ),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: confirmPasswordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefix: Icon(Icons.lock),
              suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: signUp,
            child: Text('Register'),
          ),
          SizedBox(height: 20),
          GestureDetector(
            child: Center(child: Text('Ya tienes cuenta? Inicia sesión')),
            onTap: () => Navigator.pop(context),
          ),  
          ],
      ),
    );
  }
}