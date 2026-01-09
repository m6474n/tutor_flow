import 'package:flutter/material.dart';
import 'package:tution_manager/component/custom_appbar.dart';
import 'package:tution_manager/main.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorManager.bgDark,
      appBar: CustomAppBar(canNavigate: true, title: 'Settings'),
      body: SingleChildScrollView(child: Column(children: [
           
          ],
        )),
    );
  }
}
