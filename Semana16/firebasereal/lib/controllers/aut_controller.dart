import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasereal/models/user_model.dart';
import 'package:firebasereal/routers/app_routers.dart';
import 'package:firebasereal/services/auth_services.dart';
import 'package:get/get.dart';

class AutController extends GetxController {
  final AuthServices _authServices = AuthServices();
  final Rxn<User?> _user = Rxn<User?>();
  final Rx<UserModel?> _userModel = Rx<UserModel?>(null);
  final RxBool _isLoading = false.obs;
  final RxString _error = ''.obs;
  final RxBool _isinitialized = false.obs;

  User? get user => _user.value;
  UserModel? get userModel => _userModel.value; 
  bool get isLoading => _isLoading.value;
  String get error => _error.value;
  bool get isAuthenticated => _user.value != null;
  bool get isinicialized => _isinitialized.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_authServices.authStateChanges);
    ever(_user, _handleAuthStateChanged);
  }

  void _handleAuthStateChanged(User? user) {
    if (user == null) {
      if(Get.currentRoute != AppRouters.login){
        Get.offAllNamed(AppRouters.login);
      }
    } else {
      if(Get.currentRoute != AppRouters.main){
        Get.offAllNamed(AppRouters.main);
      }
    }
    if(!_isinitialized.value){
      _isinitialized.value = true;
    }
  }

  void checkInitialAuthState(){
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser == null){
      _user.value = currentUser;
      Get.offAllNamed(AppRouters.login);
    } else {
      _isinitialized.value = true;
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try{
      _isLoading.value = true;
      _error.value = '';

      UserModel? userModel = await _authServices.singInWithEmailAndPassword(email, password);
      if(userModel != null){
        _userModel.value = userModel;
        Get.offAllNamed(AppRouters.main);
      }
    } catch (e){
      _error.value = e.toString();
      Get.snackbar("Error", "Fail to Login");
    }
    finally{
      _isLoading.value = false;
    }
  }

  Future<void> registerWithEmailAndPassword(String email, String password, String displayName) async {
    try{
      _isLoading.value = true;
      _error.value = '';

      UserModel? userModel = await _authServices.registerWithEmailAndPassword(email, password, displayName);
      if(userModel != null){
        _userModel.value = userModel;
        Get.offAllNamed(AppRouters.main);
      }
    } catch (e){
      _error.value = e.toString();
      Get.snackbar("Error", "Fail to Create Account");
    }
    finally{
      _isLoading.value = false;
    }
  }

  Future<void> singOut() async {
    try{
      _isLoading.value = true;
      await _authServices.signOut();
      _userModel.value = null;
      Get.offAllNamed(AppRouters.login);
    } catch (e){
      _error.value = e.toString();
      Get.snackbar("Error", "Fail to Sing Out");
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> deleteAccount() async {
    try{
      _isLoading.value = true;
      await _authServices.deleteAccount();
      _userModel.value = null;
      Get.offAllNamed(AppRouters.login);
    } catch (e){
      _error.value = e.toString();
      Get.snackbar("Error", "Fail to Delete Account");
    } finally {
      _isLoading.value = false;
    }
  }

  void clearError(){ 
    _error.value = "";
  }
}