import 'package:flutter/cupertino.dart'
    hide CupertinoTabBar, CupertinoTabScaffold, CupertinoTabController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/main_controller.dart';
import '../../../core/base/component/bottom_nav_bar/bottom_nav_bar_custom.dart';
import '../../../core/base/component/bottom_nav_bar/custom_tab_scaffold.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../core/init/managers/responsiveness_manager.dart';

part 'modules/bottom_nav_bar_icon.dart';

part 'modules/bottom_nav_bar_items.dart';

part 'modules/bottom_nav_tab_builder.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  late final MainController _controller;

  @override
  void initState() {
    _controller = Get.put(MainController());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.delete<MainController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsivenessManager.instance.setFactorSize(context);
    return WillPopScope(
      onWillPop: _controller.onWillPop,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: buildCupertinoTabScaffold(context),
        ),
      ),
    );
  }

  Widget buildCupertinoTabScaffold(BuildContext context) {
    return Obx(
      () => CupertinoTabScaffold(
        controller: _controller.tabController,
        tabBar: CupertinoTabBar(
          border: Border.all(color: context.theme.scaffoldBackgroundColor),
          height: SizeUtil.bnbHeight,
          currentIndex: _controller.currentScreenIndex.toInt(),
          onTap: (int value) {
            _controller.onPageChanged(value);
          },
          items: _bottomNavBarItems(context),
        ),
        tabBuilder: _tabBuilder(),
      ),
    );
  }
}
