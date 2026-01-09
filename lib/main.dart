import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tution_manager/controller/theme/theme_controller.dart';
import 'package:tution_manager/service/api_service.dart';
import 'package:tution_manager/utils/app_routes.dart';
import 'package:tution_manager/utils/enums.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(url: EnvKey.projectURL.key, anonKey: EnvKey.publisherKey.key);
  runApp(const MyApp());
}

final ColorManager colorManager = Get.put(ColorManager());
final supabase = Supabase.instance.client;
final ApiService api = ApiService();
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..backgroundColor = colorManager.primaryColor
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      // ignore: deprecated_member_use
      ..radius = 30
      ..indicatorSize = 50.0
      ..toastPosition = EasyLoadingToastPosition.bottom
      ..animationStyle = EasyLoadingAnimationStyle.scale;
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 300),
      opaqueRoute: true,
      popGesture: true,
      debugShowCheckedModeBanner: false,
      title: 'Tution Managment System - TRP',
      theme: ThemeData(
        dialogBackgroundColor: colorManager.bgDark,
        fontFamily: 'SF Pro',
        primaryColor: colorManager.primaryColor,
        scaffoldBackgroundColor: colorManager.bgDark,
        appBarTheme: AppBarTheme(backgroundColor: colorManager.bgDark),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(colorManager.primaryColor),
            foregroundColor: WidgetStatePropertyAll(colorManager.whiteColor),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: colorManager.primaryColor,
          background: colorManager.bgDark,
        ),
      ),
      initialRoute: '/dashboard',
      getPages: AppRoutes.routes,
      builder: EasyLoading.init(),
    );
  }
}
