part of '../main_home.dart';

Widget Function(BuildContext, int) _tabBuilder() {
  MainController controller = Get.find();
  RxList<Widget> screens = controller.isTherapist.value
      ? NavigateUtil.therapisty.obs
      : NavigateUtil.screen.obs;
  return (BuildContext context, int index) {
    return CupertinoTabView(builder: (context) {
      return CupertinoPageScaffold(
        child: Obx(() => screens[index]),
      );
    });
  };
}
