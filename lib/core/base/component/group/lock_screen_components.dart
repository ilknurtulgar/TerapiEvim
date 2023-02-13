import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/purple_border_text_ccontainer.dart';
import 'package:terapievim/screen/participant/group/util/lock_screen_utility.dart';

import '../buttons/custom_button.dart';
import '../../util/base_utility.dart';
import '../../../../controller/main_controller.dart';

class PopUp extends StatelessWidget {
  const PopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    Widget shown = controller.isTestNotSolved.isTrue
        ? noTest()
        : controller.isTestResultReady.isTrue
            ? checkedTest()
            : uncheckedTest();
    IconData lockicon = controller.isTestResultReady.isTrue
        ? IconUtility.lockopen
        : IconUtility.lock;
    return BackdropFilter(
      filter: LockScreenUtil.imageF,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              lockicon,
              color: AppColors.white,
              size: LockScreenUtil.lockIconSize,
            ),
            shown
          ]),
    );
  }
}

Column checkedTest() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      lockedTextContainer(LockScreenUtil.checkedTestString),
      CustomButton(
          container: AppContainers.purpleButtonContainer(null),
          onTap: () {
            //buradan kategori sayfasina yonlendirilecek
          },
          text: "Grup Kategori Sayfasi ")
    ],
  );
}

Column uncheckedTest() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      lockedTextContainer(LockScreenUtil.text),
    ],
  );
}

Column noTest() {
  return Column(
    children: [
      lockedTextContainer(LockScreenUtil.text2),
      const PurpleTextContainer(text: LockScreenUtil.text2),
      testButton()
    ],
  );
}

GestureDetector testButton() {
  return GestureDetector(
      onTap: () {
        //print("Hello bitch");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: LockScreenUtil.lockScreenHeight),
        width: LockScreenUtil.lockScreenContainerWidth,
        height: LockScreenUtil.lockScreenHeight,
        decoration: AppBoxDecoration.lockScreenButton,
        child: Center(
          child: Text(LockScreenUtil.buttonText,
              style: AppTextStyles.buttonTextStyle(AppColors.butterflyBush)),
        ),
      ));
}

Widget lockedTextContainer(String text) {
  return Container(
      margin:
          const EdgeInsets.symmetric(vertical: LockScreenUtil.lockScreenHeight),
      width: LockScreenUtil.lockScreenContainerWidth,
      height: LockScreenUtil.lockScreenContainerHeight,
      color: AppColors.transparent,
      child: Text(
        text,
        style: AppTextStyles.heading(false).copyWith(
          color: AppColors.white,
        ),
        textAlign: TextAlign.center,
      ));
}
