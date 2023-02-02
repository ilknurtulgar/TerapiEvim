import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/service/mainController.dart';

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
  Widget Shown =
      _controller.isTestResultReady.isTrue ? NoTest() : UncheckedTest();
  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            IconUtility.lock,
            color: AppColors.white,
            size: LockScreenUtil.lockIconSize,
          ),
          Shown
        ]),
  );
  ;
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
      Container(
        padding: LockScreenUtil.lockScreenContainerPadding,
        child: Text(
          LockScreenUtil.text2,
          textAlign: TextAlign.center,
          style: AppTextStyles.aboutMeTextStyle(false),
        ),
        width: LockScreenUtil.lockScreenBigContainerWidth,
        height: LockScreenUtil.lockScreenBigContainerHeight,
        decoration: AppBoxDecoration.lockScreenBox,
      ),
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
