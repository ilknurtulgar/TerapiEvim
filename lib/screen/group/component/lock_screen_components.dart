import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/screen/group/component/purple_border_text_ccontainer.dart';

import '../../../core/base/component/buttons/custom_button.dart';
import '../../../core/base/util/base_utility.dart';
import '../../../controller/mainController.dart';
import '../participant_ui/scl90/lock_screen.dart';
import '../util/lockScreenutility.dart';

class PopUp extends StatelessWidget {
  const PopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainController controller = Get.find();
    Widget shown = controller.isTestResultReady.isTrue
        ? noTest()
        : controller.isLockOpen.isTrue
            ? checkedTest()
            : uncheckedTest();
    IconData lockicon =
        controller.isLockOpen.isTrue ? IconUtility.lockopen : IconUtility.lock;
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
      lockScreenPlace(),
      checkedTextContainer(),
      lockScreenPlace(),
      CustomButton(
          container: AppContainers.purpleButtonContainer,
          onTap: () {
            //buradan kategori sayfasina yonlendirilecek
          },
          text: "Grup Kategori Sayfasi ")
    ],
  );
}

Container checkedTextContainer() {
  return Container(
    width: LockScreenUtil.lockScreenContainerWidth,
    height: LockScreenUtil.lockScreenContainerHeight,
    child: Text(
      LockScreenUtil.checkedTestString,
      style: AppTextStyles.normalTextStyle("big", false)
          .copyWith(color: AppColors.white),
      textAlign: TextAlign.center,
    ),
  );
}

Column uncheckedTest() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      lockScreenPlace(),
      Container(
        width: LockScreenUtil.lockScreenContainerWidth,
        height: LockScreenUtil.lockScreenContainerHeight,
        child: Text(
          LockScreenUtil.text,
          style: AppTextStyles.normalTextStyle("big", false)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

Column noTest() {
  return Column(
    children: [
      lockScreenPlace(),
      Container(
          width: LockScreenUtil.lockScreenContainerWidth,
          height: LockScreenUtil.lockScreenContainerHeight,
          color: AppColors.transparent,
          child: Text(
            LockScreenUtil.text2,
            style: AppTextStyles.heading(false).copyWith(
              color: AppColors.white,
            ),
            textAlign: TextAlign.center,
          )),
      lockScreenPlace(),
      PurpleBorderWhiteInsideTextContainer(text: LockScreenUtil.text2),
      SizedBox(
        height: LockScreenUtil.lockScreenHeight,
      ),
      GestureDetector(
          onTap: () {
            print("Hello bitch");
          },
          child: Container(
            width: LockScreenUtil.lockScreenContainerWidth,
            height: LockScreenUtil.lockScreenHeight,
            decoration: AppBoxDecoration.lockScreenButton,
            child: Center(
              child: Text(LockScreenUtil.buttonText,
                  style: AppTextStyles.buttonTextStyle(AppColors.white)),
            ),
          ))
    ],
  );
}

SizedBox lockScreenPlace() {
  return const SizedBox(
    height: LockScreenUtil.lockScreenHeight,
  );
}
