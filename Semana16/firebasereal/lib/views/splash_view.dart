import 'package:firebasereal/controllers/aut_controller.dart';
import 'package:firebasereal/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticInOut,
      ),
    );

    _animationController.forward();

    _checkAuthNavigate();
  } 

  void _checkAuthNavigate() async {
    await Future.delayed(Duration(seconds: 2));

    final authController = Get.put(AutController(), permanent: true);

    await Future.delayed(Duration(milliseconds: 500));

    if(authController.isAuthenticated){
      Get.offAndToNamed(AppRouters.main);
    } else {
      Get.offAllNamed(AppRouters.login);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 77, 40, 223),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController, 
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          )
                        ]
                      ),
                      child: Icon(
                        Icons.chat_bubble,
                        color: Color.fromARGB(255, 77, 40, 223),
                        size: 80,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'ChatApp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Connect with friends instantly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 80),
                    SpinKitPulsingGrid(
                      color: Colors.white,
                      size: 50.0,
            )
                  ],
                ),
                ),
              );
          }
              ),
      ),
    );
  }
} 