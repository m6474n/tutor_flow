import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tution_manager/component/custom_switch.dart';
import 'package:tution_manager/controller/theme/theme_controller.dart';
import 'package:tution_manager/utils/auth_service.dart';
import 'package:tution_manager/view/settings/app_setting.dart';
import 'package:tution_manager/view/shared_prefs_screen.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String token = '', subdomain = '', email = '';

  _init() async {
    if (mounted) {
      token = await AuthService.getSessionToken() ?? '';
      subdomain = await AuthService.getSubdomain() ?? '';
      email = await AuthService.getUserEmail() ?? '';
      setState(() {});
    }
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ColorManager>(
      builder: (controller) {
        return Drawer(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Container(
            height: 400,
            decoration: BoxDecoration(color: controller.bgDark),
            child: SafeArea(
              child: Padding(
                // padding: const EdgeInsets.all(8.0),
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 0,
                      color: controller.secondaryColor.withOpacity(.1),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        leading: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: controller.secondaryColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(500),
                          ),
                          child: Image.asset(
                            "assets/icon.png",
                            width: MediaQuery.of(context).size.width * 0.06,
                          ),
                        ),
                        title: Text(
                          "TutorFlow",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: controller
                                .textColor, // Explicitly use controller.textColor
                          ),
                        ),
                        subtitle: token.isNotEmpty
                            ? Text(
                                email,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: controller.textColor,
                                ),
                              )
                            : null,
                      ),
                    ),

                    Divider(color: Colors.grey.withOpacity(.3)),

                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Text(
                        'Prefrences',
                        style: TextStyle(color: controller.textColor),
                      ),
                    ),
                    Divider(color: Colors.grey.withOpacity(.3)),
                    if (kDebugMode)
                      DrawerListTile(
                        title: "Shared Prefs",
                        icon: Icons.storage,
                        textColor: controller.textColor,
                        press: () {
                          Get.to(() => SharePrefScreen());
                        },
                      ),
                    DrawerListTile(
                      title: "Settings",
                      icon: Icons.settings,
                      textColor: controller.textColor,
                      press: () {
                        Get.to(() => AppSettingScreen());
                      },
                    ),
                    if (token.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: DrawerListTile(
                          title: "Logout",
                          icon: Icons.logout,
                          textColor: controller.textColor,
                          press: () {
                            Get.back();
                            AuthService.logout();
                          },
                        ),
                      ),
                    Card(
                      elevation: 0,
                      color: controller.secondaryColor.withOpacity(.1),
                      child: ListTile(
                        leading: Icon(
                          Icons.dark_mode,
                          color: controller.textColor,
                        ),
                        title: Text(
                          "Dark Mode",
                          style: TextStyle(
                            fontSize: 14,
                            color: controller.textColor,
                          ),
                        ),
                        trailing: CustomSwitch(
                          width: 40,
                          height: 25,
                          value: controller.isDark,
                          onChanged: (newValue) {
                            controller.toggleTheme();
                          },
                          inactiveIcon: Icon(
                            Icons.dark_mode_outlined,
                            color: controller.primaryColor,
                            size: 14,
                          ),
                          activeIcon: Icon(
                            Icons.light_mode_outlined,
                            color: controller.primaryColor,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    this.icon,
    this.textColor,
  }) : super(key: key);
  final IconData? icon;
  final String title;
  final VoidCallback press;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      // horizontalTitleGap: 0.0,
      leading: Icon(icon, color: textColor),
      title: Text(
        title,
        // textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: textColor),
      ),
    );
  }
}
