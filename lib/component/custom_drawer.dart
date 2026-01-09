import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tution_manager/component/custom_switch.dart';
import 'package:tution_manager/main.dart';
import 'package:tution_manager/utils/auth_service.dart';
import 'package:tution_manager/view/app_settings.dart';
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
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Container(
        height: 400,
        decoration: BoxDecoration(color: colorManager.bgDark),
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
                  color: colorManager.secondaryColor.withOpacity(.1),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    leading: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: colorManager.secondaryColor.withOpacity(.2),
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
                      ),
                    ),
                    subtitle: token.isNotEmpty
                        ? Text(
                            email,
                            style: TextStyle(
                              fontSize: 11,
                              color: colorManager.textColor,
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
                    style: TextStyle(color: colorManager.textColor),
                  ),
                ),
                Divider(color: Colors.grey.withOpacity(.3)),
                if (kDebugMode)
                  DrawerListTile(
                    title: "Shared Prefs",
                    icon: Icons.storage,
                    press: () {
                      Get.to(() => SharePrefScreen());
                    },
                  ),
                if (token.isNotEmpty)
                  DrawerListTile(
                    title: "Settings",
                    icon: Icons.settings,
                    press: () {
                      Get.to(() => AppSettings());
                    },
                  ),
                if (token.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: DrawerListTile(
                      title: "Logout",
                      icon: Icons.logout,
                      press: () {
                        Get.back();
                        AuthService.logout();
                      },
                    ),
                  ),
                Card(
                  elevation: 0,
                  color: colorManager.secondaryColor.withOpacity(.1),
                  child: ListTile(
                    leading: Icon(Icons.dark_mode),
                    title: Text("Dark Mode", style: TextStyle(fontSize: 14)),
                    trailing: CustomSwitch(
                      width: 40,
                      height: 25,
                      value: colorManager.isDark,
                      onChanged: (newValue) {
                        colorManager.toggleTheme();
                      },
                      inactiveIcon: Icon(
                        Icons.dark_mode_outlined,
                        color: colorManager.primaryColor,
                        size: 14,
                      ),
                      activeIcon: Icon(
                        Icons.light_mode_outlined,
                        color: colorManager.primaryColor,
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
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.press,
    this.icon,
  }) : super(key: key);
  final IconData? icon;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      // horizontalTitleGap: 0.0,
      leading: Icon(icon),
      title: Text(
        title,
        // textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
