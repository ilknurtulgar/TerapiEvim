import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/service/mainController.dart';

import '../../../../components/buttons/custom_button.dart';
import '../../component/purple_border_text_ccontainer.dart';
import '../../util/lockScreenutility.dart';

class LockScreen extends StatelessWidget {
  LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Text("group and some untrue datas"),
        Container(
          color: Colors.black.withOpacity(0.8),
        ),
        PopUp()
      ],
    );
  }
}

Widget PopUp() {
  MainController _controller = Get.find();
  Widget Shown = _controller.isTestResultReady.isTrue
      ? NoTest()
      : _controller.isLockOpen.isTrue
          ? CheckedTest()
          : UncheckedTest();
  IconData lockicon =
      _controller.isLockOpen.isTrue ? IconUtility.lockopen : IconUtility.lock;
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            lockicon,
            color: AppColors.white,
            size: LockScreenUtil.lockIconSize,
          ),
          Shown
        ]),
  );
  ;
}

Column CheckedTest() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: LockScreenUtil.lockScreenHeight,
      ),
      Container(
        width: LockScreenUtil.lockScreenContainerWidth,
        height: LockScreenUtil.lockScreenContainerHeight,
        child: Text(
          LockScreenUtil.checkedTestString,
          style: AppTextStyles.normalTextStyle("big", false)
              .copyWith(color: AppColors.white),
          textAlign: TextAlign.center,
        ),
      ),
      SizedBox(
        height: LockScreenUtil.lockScreenHeight,
      ),
      CustomButton(
          container: AppContainers.purpleButtonContainer,
          onTap: () {
            //buradan kategori sayfasina yonlendirilecek
          },
          text: "Grup Kategori Sayfasi ")
    ],
  );
}

Column UncheckedTest() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: LockScreenUtil.lockScreenHeight,
      ),
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

Column NoTest() {
  return Column(
    children: [
      SizedBox(
        height: LockScreenUtil.lockScreenHeight2,
      ),
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
      SizedBox(
        height: LockScreenUtil.lockScreenHeight,
      ),
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
