import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasereal/models/user_model.dart';
import 'package:firebasereal/services/firestore_service.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  User? get currentUser => _auth.currentUser;
  String? get currentUserId => _auth.currentUser?.uid;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserModel?> singInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await _firestoreService.updateuserOnlineStatus(user.uid, true);
        return _firestoreService.getUser(user.uid);
      } 
      else{
      return null;
      }
    } catch (e) {
      throw Exception('Error signing in: $e.toString()');
    }
  }

  Future<UserModel?> registerWithEmailAndPassword(String email, String password, String displayName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await 
        user.updateDisplayName(displayName);
        final userModel = UserModel(
          id: user.uid, 
          email: email, 
          displayName: displayName, 
          photoUrl: "",
          lastSeen: DateTime.now(), 
          createdAt: DateTime.now(),
          );

        await _firestoreService.createUser(userModel);
        return userModel;
      } 
      else{
      return null;
      }
    } catch (e) {
      throw Exception('Error Create User: $e.toString()');
    }
  }

  Future<void> sendPasswordResentEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw Exception('Error sending password reset email: $e.toString()');
    }
  }
  
  Future<void> signOut() async {
    try {
      if (currentUser != null) {
        await _firestoreService.updateuserOnlineStatus(currentUserId!, false);
      }
      await _auth.signOut();
    } catch (e) {
      throw Exception('Error to Sign out: $e.toString()');
    }
  }

  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestoreService.deleteUser(user.uid);
        await user.delete();
      }
    } catch (e) {
      throw Exception('Error to Delete Account: $e.toString()');
    }
  }
}