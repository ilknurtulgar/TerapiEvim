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

class TerapiEvimLogged extends StatefulWidget {
  const TerapiEvimLogged({Key? key}) : super(key: key);

  @override
  State<TerapiEvimLogged> createState() => _TerapiEvimLoggedState();
}

class _TerapiEvimLoggedState extends State<TerapiEvimLogged> {
  late final MainController _controller=Get.find();

  // main controller burada kalınca hata verdi o yüzden mecburi olarak main dart içerisinde get put ettim

  /*@override
  void initState() {
    _controller = Get.put(MainController());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    Get.delete<MainController>();
    super.dispose();
  }*/

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
