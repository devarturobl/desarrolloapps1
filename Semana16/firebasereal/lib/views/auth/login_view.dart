import 'package:firebasereal/controllers/aut_controller.dart';
import 'package:firebasereal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AutController _authController = Get.find<AutController>();
  bool _obscurePassword = true;

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Icon(
                    Icons.chat_bubble_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text("Welcome Back!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 8),
              Text("Sing in to continue chatting with friend & family",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondaryColor,
                )
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: "Enter your Email"
                ),
                validator: (value) {
                  if(value?.isEmpty ?? true){
                    return 'Please enter your email';
                  }
                  if(!GetUtils.isEmail(value!)){
                    return "Please enter valid email";
                  }
                  return null;
                },
                ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Enter your Password",
                  suffixIcon: IconButton(onPressed: (){
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  }, icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined)
                  )
                  ),
                validator: (value) {
                  if(value?.isEmpty ?? true){
                    return 'Please enter your password';
                  }
                  if(value!.length <6){
                    return "Please enter valid password";
                  }
                  return null;
                },
                ),
            ],
            )
          ),
      )),
    );
  }
}