import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  //Sing in
  Future<AuthResponse> singInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  //Sing up
  Future<AuthResponse> singUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return await supabase.auth.signUp(email: email, password: password);
  }

  //Sing out
  Future<void> singOut() async {
    return await supabase.auth.signOut();
  }

  //Get user
  String? getCurrentUserEmail() {
    final session = supabase.auth.currentSession;
    final user = session?.user;
    return user?.id;
  }
}
