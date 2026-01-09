// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tution_manager/utils/app_routes.dart';
import 'package:tution_manager/utils/auth_service.dart';

class SplashService {
  isLogin(BuildContext context, {String? userRole}) async {

    Timer(const Duration(seconds: 3), () async {
      if (await AuthService.isUserLoggedIn()) {
        Get.offAllNamed(AppRoutes.dashboard);
      }
      //  else if (await AuthService.isSubdomainAvailable()) {
      //   log("User Session is Not  Found!");
      //   Get.offAll(const LoginScreen());
      // }
       else {
        log("Session Not Found!");
        Get.offAllNamed(AppRoutes.login);

      }
    });
  }
}
