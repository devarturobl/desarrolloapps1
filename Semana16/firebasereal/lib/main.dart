import 'package:firebase_core/firebase_core.dart';
import 'package:firebasereal/firebase_options.dart';
import 'package:firebasereal/routers/app_pages.dart';
import 'package:firebasereal/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Habilitar la api de firebase
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat APP',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}