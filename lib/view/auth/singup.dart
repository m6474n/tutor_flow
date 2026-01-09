
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tution_manager/component/custom_appbar.dart';
import 'package:tution_manager/component/custom_button.dart';
import 'package:tution_manager/component/custom_drawer.dart';
import 'package:tution_manager/component/custom_input_field.dart';
import 'package:tution_manager/controller/auth_controller.dart';
import 'package:tution_manager/main.dart';
import 'package:tution_manager/service/api_service.dart';
import 'package:tution_manager/utils/app_routes.dart';
import 'package:tution_manager/utils/auth_service.dart';
import 'package:tution_manager/utils/constants.dart';
import 'package:tution_manager/utils/helpers.dart';
import 'package:tution_manager/view/dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: AuthController(),
      builder: (cont) {
        return Scaffold(
          key: cont.scaffoldKey,
          backgroundColor: colorManager.bgDark,
          drawer: CustomDrawer(),
          appBar: CustomAppBar(
            // drawer button
            leading: Padding(
              padding: EdgeInsetsGeometry.only(left: 16, right: 10),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    toggleDrawer(cont.scaffoldKey);
                  });
                },
                child: HugeIcon(icon: HugeIcons.strokeRoundedMenu02),
              ),
            ),
            title: "Register",
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cont.formKey,
              child: Column(
                spacing: 12,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(tag: 'app-logo', child: 
                  Image.asset(appLogo, height: 120)),
                  Text(
                    'Create new account to continue',
                    style: primaryTextStyle.copyWith(fontSize: 16),
                  ),
                  CustomInputField(
                    controller: cont.nameCont,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedMail01,
                        color: colorManager.secondaryColor,
                      ),
                    ),
                    label: "Name",
                  ),
                  CustomInputField(
                    controller: cont.emailCont,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedMail01,
                        color: colorManager.secondaryColor,
                      ),
                    ),
                    label: "Email",
                  ),
                    CustomInputField(
                    controller: cont.phoneCont,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: HugeIcon(
                        icon: HugeIcons.strokeRoundedMail01,
                        color: colorManager.secondaryColor,
                      ),
                    ),
                    label: "Phone",
                  ),
                  Obx(() {
                    return CustomInputField(
                      obsecure: cont.obscure.value,
                      controller: cont.passCont,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          cont.obscure.value = !cont.obscure.value;
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18),
                          child: HugeIcon(
                            icon: cont.obscure.value
                                ? HugeIcons.strokeRoundedViewOff
                                : HugeIcons.strokeRoundedView,
                            color: colorManager.secondaryColor,
                          ),
                        ),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedLock,
                          color: colorManager.secondaryColor,
                        ),
                      ),
                      label: "Password",
                    );
                  }),
                  CustomButton(
                    label: "Login",
                    onTap: () {
                      cont.authenticate();
                    },
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: primaryTextStyle,
                      children: [
                        TextSpan(
                          recognizer:  TapGestureRecognizer()
                  ..onTap = () {
                   Get.toNamed(AppRoutes.signup);
                  
                  },
                        
                          text: 'Register',
                          style: primaryTextStyle.copyWith(
                            color: colorManager.primaryColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
