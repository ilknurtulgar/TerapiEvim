import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/group/group.dart';
import 'package:terapievim/screen/participant/profile/profile_page.dart';
import '../../../controller/main_controller.dart';
import '../activity/activities.dart';
import '../message/message.dart';
import 'home.dart';

class TerapiEvimLogged extends StatefulWidget {
  const TerapiEvimLogged({Key? key}) : super(key: key);

  @override
  State<TerapiEvimLogged> createState() => _TerapiEvimLoggedState();
}

class _TerapiEvimLoggedState extends State<TerapiEvimLogged> {
  final MainController _controller = Get.find();

  List<IconData> icons = <IconData>[
    IconUtility.navHome,
    IconUtility.navActivities,
    IconUtility.navGroup,
    IconUtility.navMessage,
    IconUtility.navProfile
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = <Widget>[
      const HomeScreen(),
      ActivitiesScreen(),
      GroupScreen(),
      const MessageScreen(),
      ParticipantProfilePage(),
    ];
    return Scaffold(
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
          onTap: (int index) {
            _controller.changeScreen(index);
          },
        ),
      ),
      backgroundColor: AppColors.blueChalk,
      body: Center(
        child: Obx(
          () => Container(
            child: screen[_controller.currentScreenIndex.toInt()],
          ),
        ),
      ),
    );
  }
}