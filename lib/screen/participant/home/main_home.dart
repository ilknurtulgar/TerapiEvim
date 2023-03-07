import 'package:flutter/cupertino.dart'
    hide CupertinoTabBar, CupertinoTabScaffold, CupertinoTabController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/tactivity_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../controller/main_controller.dart';
import '../../../core/base/component/bottom_nav_bar/bottom_nav_bar_custom.dart';
import '../../../core/base/component/bottom_nav_bar/custom_tab_scaffold.dart';
import '../../../core/constants/ui_constant/size_const.dart';
import '../activity/activities.dart';
import '../group/group.dart';
import '../message/message.dart';
import '../profile/profile_page.dart';
import 'home.dart';

part 'modules/bottom_nav_bar_icon.dart';

part 'modules/bottom_nav_bar_items.dart';

part 'modules/bottom_nav_tab_builder.dart';

class TerapiEvimLogged extends StatefulWidget {
  const TerapiEvimLogged({Key? key}) : super(key: key);

  @override
  State<TerapiEvimLogged> createState() => _TerapiEvimLoggedState();
}

class _TerapiEvimLoggedState extends State<TerapiEvimLogged> {
 final  MainController _controller = Get.find();
  late final bool isparticipant = false;
  TherapistActivtyController therapistActivtyController =
      Get.put(TherapistActivtyController());

  @override
  void initState() {
    _controller.onInit();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _controller.onWillPop,
      child: Scaffold(
        bottomNavigationBar: buildCupertinoTabScaffold(context),
        // bottomNavigationBar: Obx(
        //   () => AnimatedBottomNavigationBar(
        //     icons: IconUtility.bottomnavigateIcons,
        //     activeIndex: _controller.currentScreenIndex.toInt(),
        //     leftCornerRadius: 20,
        //     rightCornerRadius: 20,
        //     iconSize: 30,
        //     gapLocation: GapLocation.none,
        //     height: 72,
        //     backgroundColor: AppColors.white,
        //     inactiveColor: AppColors.dustyGray,
        //     activeColor: Colors.black,
        //     onTap: (int index) {
        //       _controller.changeScreen(index);
        //     },
        //   ),
        // ),
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
      ),
    );
  }

  CupertinoTabScaffold buildCupertinoTabScaffold(BuildContext context) {
    return CupertinoTabScaffold(
      controller: _controller.tabController,
      tabBar: CupertinoTabBar(
        backgroundColor: context.theme.bottomNavigationBarTheme.backgroundColor,
        border: Border.all(color: context.theme.scaffoldBackgroundColor),
        height: SizeConst.bnbHeight,
        currentIndex: _controller.currentScreenIndex.toInt(),
        onTap: (int value) {
          _controller.onPageChanged(value);
        },
        items: _bottomNavBarItems(context),
      ),
      tabBuilder: _tabBuilder(),
    );
  }
}
