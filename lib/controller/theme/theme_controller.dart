// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tution_manager/utils/helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorManager extends GetxController {
  Color primaryColor = const Color(0xFF9d85ff);
  Color secondaryColor = const Color(0xFF9d85ff);
  Color textColor = const Color.fromRGBO(22, 22, 22, 1);

  Color whiteColor = Colors.white;
  Color darkBlue = const Color(0xff1F1D2B);

  Color greyText = Colors.grey.shade200;
  Color bgLight = const Color.fromARGB(255, 244, 244, 244);
  Color bgDark = const Color.fromARGB(255, 255, 255, 255);
  Color borderColor = const Color.fromARGB(255, 237, 237, 237);

  lightTheme() {
    textColor = const Color(0xff161616);
    greyText = Colors.grey.shade200;

    secondaryColor = const Color(0xFF9d85ff);
    bgLight = const Color.fromARGB(255, 244, 244, 244);
    bgDark = const Color.fromARGB(255, 255, 255, 255);
    Get.changeTheme(ThemeData.light());

    borderColor = const Color.fromARGB(255, 217, 217, 217);
    update();
  }

  darkTheme() {
    textColor = Colors.white;
    // greyText = primaryColor;
    secondaryColor = Colors.white;
    bgLight = const Color.fromARGB(255, 67, 67, 67);
    bgDark = const Color.fromARGB(255, 39, 39, 39);
    Get.changeTheme(ThemeData.dark());
    borderColor = const Color.fromARGB(255, 217, 217, 217);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadThemeFromPreferences();
    // getUserRole();
  }

  bool isDark = false;
  void toggleTheme() {
    isDark = !isDark;

    isDark ? darkTheme() : lightTheme();
    saveThemeToPreferences(isDark);
    Get.forceAppUpdate();
  }

  void loadThemeFromPreferences() async {
    await SharedPreferences.getInstance().then((v) {
      isDark = v.getBool('isDarkTheme') ?? false;
      isDark ? darkTheme() : lightTheme();
      primaryColor = Color(
        int.parse(hexToColor(v.getString('color') ?? "#9d85ff")),
      );
      update();
    });
  }

  void saveThemeToPreferences(bool isDarkTheme) async {
    await SharedPreferences.getInstance().then((v) {
      v.setBool('isDarkTheme', isDarkTheme);
      update();
    });
  }
}
