import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/components/button/questions_button.dart';
import 'package:terapievim/components/text/row_text.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import 'Screen/activities.dart';
import 'Screen/group.dart';
import 'Screen/home.dart';
import 'Screen/message.dart';
import 'Screen/profile.dart';

void main() {
  runApp(TerapiEvim());
}

class TerapiEvim extends StatefulWidget {
  TerapiEvim({Key? key}) : super(key: key);

  @override
  State<TerapiEvim> createState() => _TerapiEvimState();
}

class _TerapiEvimState extends State<TerapiEvim> {
  Widget currentScreen = HomeScreen();
  List<IconData> icons = <IconData>[
    IconUtility.navHome,
    IconUtility.navActivities,
    IconUtility.navGroup,
    IconUtility.navMessage,
    IconUtility.navProfile
  ];

  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        activeIndex: currentScreenIndex,
        leftCornerRadius: 12,
        rightCornerRadius: 12,
        iconSize: 30,
        gapLocation: GapLocation.none,
        height: 72,
        backgroundColor: AppColors.white,
        inactiveColor: AppColors.dustyGray,
        activeColor: Colors.black,
        onTap: (int) {
          setState(() {
            switch (int) {
              case 0:
                currentScreen = HomeScreen();
                currentScreenIndex = 0;
                break;
              case 1:
                currentScreen = ActivitiesScreen();
                currentScreenIndex = 1;
                break;
              case 2:
                currentScreen = const GroupScreen();
                currentScreenIndex = 2;
                break;
              case 3:
                currentScreen = const MessageScreen();
                currentScreenIndex = 3;
                break;
              case 4:
                currentScreen = const ProfileScreen();
                currentScreenIndex = 4;
                break;
            }
          });
        },
      ),
      backgroundColor: AppColors.blueChalk,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 50,
              height: 50,
            ),
            RowText(),
            ToggleQuestions(),
            currentScreen,
          ],
        ),
      ),
    ));
  }
}
