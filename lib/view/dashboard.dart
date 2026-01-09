import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tution_manager/component/custom_appbar.dart';
import 'package:tution_manager/component/custom_drawer.dart';
import 'package:tution_manager/main.dart';
import 'package:tution_manager/utils/helpers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: colorManager.bgDark,
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        // drawer button
        leading: Padding(
          padding: EdgeInsetsGeometry.only(left: 16, right: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                toggleDrawer(_scaffoldKey);
              });
            },
            child: HugeIcon(icon: HugeIcons.strokeRoundedMenu02),
          ),
        ),
        title: "Dashboard",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          spacing: 12,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
