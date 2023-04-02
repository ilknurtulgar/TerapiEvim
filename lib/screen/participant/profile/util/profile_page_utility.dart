import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../../core/base/component/activtiy/drop_down.dart';
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

  static Align profilePagePersonImage(String imagePath, bool isThereEditButton,
          {Function()? onPressed}) =>
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: SizedBox(
            width: 202,
            height: 210,
            child: Stack(
              children: [
                CustomCircleAvatar(
                    imagePath: imagePath, big: true, shadow: true),
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
        ),
      );

  //TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
  static ProfileController profileController = Get.find();
  static CustomDropDown genderDropDown(bool isInProfilePage,
          [TextEditingController? textController]) =>
      CustomDropDown(
        textlist: DemoInformation.genderList,
        widget: textpurpose(profileController.genders.value),
        ontap: () {
          profileController.func(DemoInformation.genderList, textController);
        },
        width: isInProfilePage ? SizeUtil.specialSize : SizeUtil.generalWidth,
        height:
            isInProfilePage ? SizeUtil.lowValueHeight : SizeUtil.generalHeight,
        textController: textController,
      );
}
