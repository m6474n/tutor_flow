import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tution_manager/component/custom_appbar.dart';
import 'package:tution_manager/component/custom_drawer.dart';
import 'package:tution_manager/main.dart';
import 'package:tution_manager/utils/helpers.dart';
import 'package:tution_manager/utils/custom_styles.dart';

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
          children: [
            Text("Headin h1",style: CustomStyles.h1(),),
            Text("Headin h2",style: CustomStyles.h2(),),
            Text("Headin h3",style: CustomStyles.h3(),),
            Text("Headin h4",style: CustomStyles.h4(),),
            Text("Headin h5",style: CustomStyles.h5(),),
            Text("Headin h6",style: CustomStyles.h6(),),
            Text("Paragraph",style: CustomStyles.paragraph(),),
          ],
        ),
      ),
    );
  }
}
