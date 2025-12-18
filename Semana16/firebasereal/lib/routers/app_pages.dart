import 'package:firebasereal/routers/app_routers.dart';
import 'package:firebasereal/views/auth/login_view.dart';
import 'package:firebasereal/views/splash_view.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/utils.dart';

class AppPages {
  static const initial = AppRouters.splash;
  static final routes = [
  GetPage(name: AppRouters.splash, page: () => SplashView()),
  GetPage(name: AppRouters.login, page: () => LoginView()),
    // Define your app routes here
    /*GetPage(name: AppRouters.splash, page: () => SplashView()),
    GetPage(name: AppRouters.home, page: () => HomeView()),
    GetPage(name: AppRouters.login, page: () => LoginView()),
    GetPage(name: AppRouters.register, page: () => RegisterView()),
    GetPage(name: AppRouters.forgotPassword, page: () => ForgotPasswordView()),
    GetPage(name: AppRouters.changePassword, page: () => ChangePasswordView()),
    GetPage(name: AppRouters.profile, page: () => ProfileView()),
    GetPage(
      name: AppRouters.chat, page: () => ChatView(),
      binding: BindingsBuilder(() {
        Get.put(ChatController());
      }
      )
    ),
    GetPage(
      name: AppRouters.userList, page: () => UserListView(),
      binding: BindingsBuilder(() {
        Get.put(UserListController());
      }
      )   
    ),
    GetPage(
      name: AppRouters.friends, page: () => FriendsView(),
      binding: BindingsBuilder(() {
        Get.put(FriendsController());
      } 
      )
    ),
    GetPage(
      name: AppRouters.friendRequests, page: () => FriendRequestsView(),
      binding: BindingsBuilder(() {
        Get.put(FriendRequestsController());
      }
      )
    ),
    GetPage(
      name: AppRouters.notifications, page: () => NotificationsView(),
      binding: BindingsBuilder(() {
        Get.put(NotificationsController());
      }
      )
    ),*/ 
  ];
}