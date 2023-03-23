import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../../core/base/component/activtiy/drop_down.dart';
import '../../../../core/base/component/login/custom_textfield.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';

class ProfilePageUtility {
  static Container backgroundOfThePage() => Container(
        height: SizeUtil.highValueHeight,
        width: window.physicalSize.width,
        color: AppColors.white,
      );

  static Positioned positionedIconButton(
          IconData icon, Function() onPressed, double top, double right) =>
      Positioned(
          top: top,
          right: right,
          child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: AppColors.black,
                size: 25,
              )));

  static Align profilePagePersonImage(String imagePath) => Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child:
              CustomCircleAvatar(imagePath: imagePath, big: true, shadow: true),
        ),
      );

  //TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),

  static CustomDropDown genderDropDown(bool isInProfilePage,
          [TextEditingController? textController]) =>
      CustomDropDown(
        onTap: () {
          activityController.changeBox();
        },
        isGenderPurpose: true,
        width:
            isInProfilePage ? SizeUtil.mediumValueWidth : SizeUtil.generalWidth,
        height:
            isInProfilePage ? SizeUtil.lowValueHeight : SizeUtil.generalHeight,
        textController: textController,
      );
}
