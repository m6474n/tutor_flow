import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tution_manager/main.dart';
import 'package:tution_manager/utils/auth_service.dart';
import 'package:tution_manager/utils/helpers.dart';
import 'package:tution_manager/view/dashboard.dart';

class AuthController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailCont = TextEditingController(),
  nameCont = TextEditingController(),
  phoneCont = TextEditingController(),
      passCont = TextEditingController();

  RxBool obscure = true.obs;

  authenticate() async {
    if (loginFormKey.currentState!.validate()) {
      var res = {};
      if (res != null) {
        prettyPrint(res);
        var data = res['data'];
        String email = data['email'] ?? '';
        String token = data['token'] ?? '';
        if (token.isEmpty) {
          log('Token not found!');
          return;
        }
        if (email.isEmpty) {
          log('Token not found!');
          // return;
        }

        await AuthService.updateSession(email: email, token: token);
        Get.offAll(() => Dashboard());
      }
    }
  }
}
