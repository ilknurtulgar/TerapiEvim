import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

import '../../../../core/base/component/activtiy/drop_down.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';

class PProfileViewUtility {
  static Container backgroundOfTheView() => Container(
        height: SizeUtil.largeValueHeight,
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

  static Widget profilePagePersonImage(String imagePath, bool isThereEditButton,
          {Function()? onPressed}) =>
      Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(top: 45),
          width: 202,
          height: 210,
          child: Stack(
            children: [
              Positioned.fill(
                  child: CustomCircleAvatar(
                      imagePath: imagePath, big: true, shadow: true)),
              isThereEditButton
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: onPressed,
                        icon: IconUtility.editPencil,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      );

  //TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),

  static CustomDropDown genderDropDown(
    bool isInProfilePage,
    RxBool isBoxSelected,
    RxString selectedText,
    Function() onDropDownTapped,
    Function(int) onValueSelected,
  ) {
    return CustomDropDown(
      width: isInProfilePage ? SizeUtil.specialSize : SizeUtil.generalWidth,
      height:
          isInProfilePage ? SizeUtil.lowValueHeight : SizeUtil.generalHeight,
      isBoxSelected: isBoxSelected,
      selectedText: selectedText,
      textList: DemoInformation.genderList,
      onDropDownTapped: onDropDownTapped,
      onValueSelected: onValueSelected,
    );
  }
}
