import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/purple_text_container.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/screen/participant/group/category_determination/group_categories/group_categories.dart';
import 'package:terapievim/screen/participant/group/util/lock_screen_utility.dart';

import '../../../../screen/participant/group/scl90/test_for_users.dart';
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
        ? noTest(context)
        : controller.isTestResultReady.isTrue
            ? checkedTest(context)
            : uncheckedTest();
    Icon lockicon = controller.isTestResultReady.isTrue
        ? IconUtility.lockopen
        : IconUtility.lock;
    return BackdropFilter(
      filter: LockScreenUtil.imageF,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [lockicon, shown]),
    );
  }
}

Column checkedTest(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      lockedTextContainer(LockScreenUtil.checkedTestString),
      CustomButton(
          textColor: Colors.white,
          container: AppContainers.purpleButtonContainer(null),
          onTap: () {
            context.push(const GroupCategories());
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

Column noTest(BuildContext context) {
  return Column(
    children: [
      lockedTextContainer(LockScreenUtil.text2),
      const PurpleTextContainer(text: LockScreenUtil.text2),
      testButton(context)
    ],
  );
}

GestureDetector testButton(BuildContext context) {
  return GestureDetector(
      onTap: () {
        context.push(const Test());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: LockScreenUtil.lockScreenHeight),
        width: LockScreenUtil.lockScreenContainerWidth,
        height: LockScreenUtil.lockScreenHeight,
        decoration: AppBoxDecoration.lockScreenButton,
        child: Center(
          child: Text(LockScreenUtil.buttonText,
              style: AppTextStyles.buttonTextStyle(AppColors.white)),
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
