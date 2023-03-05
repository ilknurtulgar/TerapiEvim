import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/tactivity_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../controller/main_controller.dart';

class TerapiEvimLogged extends StatefulWidget {
  const TerapiEvimLogged({Key? key}) : super(key: key);

  @override
  State<TerapiEvimLogged> createState() => _TerapiEvimLoggedState();
}

class _TerapiEvimLoggedState extends State<TerapiEvimLogged> {
  final MainController _controller = Get.find();
  late final bool isparticipant = false;
  TherapistActivtyController therapistActivtyController =
      Get.put(TherapistActivtyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          icons: IconUtility.bottomnavigateIcons,
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
      body: Center(
        child: Obx(
          () => Container(
            child: isparticipant
                ? NavigateUtil.screen[_controller.currentScreenIndex.toInt()]
                : NavigateUtil
                    .therapisty[_controller.currentScreenIndex.toInt()],
          ),
        ),
      ),
    );
  }
}
