import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/components/container/group.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/group_pages.dart/group.dart';
import 'package:terapievim/service/mainController.dart';
import 'screen/activities.dart';

import 'screen/home.dart';
import 'screen/message.dart';
import 'screen/profile.dart';

void main() {
  runApp(TerapiEvim());
}

class TerapiEvim extends StatefulWidget {
  TerapiEvim({Key? key}) : super(key: key);

  @override
  State<TerapiEvim> createState() => _TerapiEvimState();
}

class _TerapiEvimState extends State<TerapiEvim> {
  MainController _controller = Get.put(MainController());

  List<IconData> icons = <IconData>[
    IconUtility.navHome,
    IconUtility.navActivities,
    IconUtility.navGroup,
    IconUtility.navMessage,
    IconUtility.navProfile
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> Screen = <Widget>[
      HomeScreen(),
      ActivitiesScreen(),
      Group(),
      MessageScreen(),
      ProfileScreen()
    ];
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: Obx(
            () => AnimatedBottomNavigationBar(
              icons: icons,
              activeIndex: _controller.currentScreenIndex.toInt(),
              leftCornerRadius: 20,
              rightCornerRadius: 20,
              iconSize: 30,
              gapLocation: GapLocation.none,
              height: 72,
              backgroundColor: AppColors.white,
              inactiveColor: AppColors.dustyGray,
              activeColor: Colors.black,
              onTap: (int) {
                _controller.ChangeScreen(int);
              },
            ),
          ),
          backgroundColor: AppColors.blueChalk,
          body: Obx(
            () => Container(
              child: Screen[_controller.currentScreenIndex.toInt()],
            ),
          )),
    );
  }
}
