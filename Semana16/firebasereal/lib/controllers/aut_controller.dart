import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasereal/models/user_model.dart';
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
  bool get isInitialized => _user.value != null;
  bool get isinicialized => _isinitialized.value;
}