import 'package:get/get.dart';
import 'package:tution_manager/view/auth/login.dart';
import 'package:tution_manager/view/auth/register.dart';
import 'package:tution_manager/view/dashboard.dart';
import 'package:tution_manager/view/splash_screen.dart';

class AppRoutes {
   static const splash = '/';
  static const dashboard = '/dashboard';
  static const homepage = '/home';
  static const login = '/login';
  static const signup = '/register';
  static const localStorage = '/prefs';
 
  static const profile = '/profile';
  static const noInternet = '/no-internet';

  static const forgetPassword = '$profile/forget_password';
  static const setNewPassword = '$profile/set_new_password';

  static final routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      // middlewares: [TrackRouteMiddleware()],
    ),
    GetPage(
      name: dashboard,
      page: () => Dashboard(),
      // middlewares: [TrackRouteMiddleware()],
    ),
    GetPage(
      name: signup,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: dashboard,
      page: () => Dashboard(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),];
}