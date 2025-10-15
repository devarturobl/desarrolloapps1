import 'package:flutter/material.dart';
import 'package:notes/login_page.dart';
import 'package:notes/profile_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        // Estado de sesión

        final session = snapshot.hasData ? snapshot.data!.session : null;

        if (session != null) {
          // Usuario autenticado
          return ProfilePage();
        } else {
          // Usuario no autenticado
          return LoginPage();
        }
      },
    );
  }
}
