import 'package:flutter/cupertino.dart'
    hide CupertinoTabBar, CupertinoTabScaffold, CupertinoTabController;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../controller/main_controller.dart';
import '../../../controller/tactivity_controller.dart';
import '../../../core/base/component/bottom_nav_bar/bottom_nav_bar_custom.dart';
import '../../../core/base/component/bottom_nav_bar/custom_tab_scaffold.dart';
import '../../../core/init/managers/responsiveness_manager.dart';
part 'modules/bottom_nav_bar_icon.dart';
part 'modules/bottom_nav_bar_items.dart';
part 'modules/bottom_nav_tab_builder.dart';

class TerapiEvimLogged extends StatefulWidget {
  const TerapiEvimLogged({Key? key}) : super(key: key);

  @override
  State<TerapiEvimLogged> createState() => _TerapiEvimLoggedState();
}

class _TerapiEvimLoggedState extends State<TerapiEvimLogged> {
  final MainController _controller = Get.find();

  @override
  void initState() {
    _controller.onInit();
    super.initState();
    Get.put(TherapistActivtyController());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ResponsivenessManager.instance.setFactorSize(context);
    return WillPopScope(
      onWillPop: _controller.onWillPop,
      child: Scaffold(
        bottomNavigationBar: buildCupertinoTabScaffold(context),
      ),
    );
  }

  CupertinoTabScaffold buildCupertinoTabScaffold(BuildContext context) {
    return CupertinoTabScaffold(
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
    );
  }
}
