part of '../main_home.dart';

Widget Function(BuildContext, int) _tabBuilder() {
  MainController controller = Get.find();
  bool isTherapist = controller.isTherapist.value;
  List<Widget> screens =
      isTherapist ? NavigateUtil.therapisty : NavigateUtil.screen;
  return (BuildContext context, int index) {
    return CupertinoTabView(builder: (context) {
      return CupertinoPageScaffold(
        child: screens[index],
      );
    });
  };
}
