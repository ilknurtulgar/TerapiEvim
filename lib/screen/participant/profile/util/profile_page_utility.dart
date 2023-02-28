import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/therapist_profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import '../../../../core/base/models/row_model.dart';
import '../../../../core/base/component/profile/image/custom_circle_avatar.dart';

class ProfilePageUtility {
  static Container backgroundOfThePage() => Container(
        height: 162,
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
          padding: const EdgeInsets.only(top: 60),
          child:
              CustomCircleAvatar(imagePath: imagePath, big: true, shadow: true),
        ),
      );

  static RowModel doubleTextRow(
          String firstText, String secondText, bool isInParticipantPage) =>
      RowModel(
          // ana ve yardımcı terapist için
          text: firstText,
          textStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          text2: secondText,
          textStyle2: const TextStyle(color: Colors.black, fontSize: 16),
          leadingIcon: Icon(
            isInParticipantPage
                ? Icons.person_outline
                : Icons.account_circle_outlined,
            color: Colors.black,
          ),
          isAlignmentBetween: false);

  static RowModel boldMainTitleRow(
          String text, IconData icon, Function() onTap) =>
      RowModel(
          text: text,
          leadingIcon: Icon(
            icon,
            color: AppColors.black,
            size: 25,
          ),
          textStyle: const TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize:
                  20), // bu apptextstyle'da yoktu, başka yerde kullanıldığını görmedim
          isAlignmentBetween: false,
          trailingIcon: Padding(
            padding: EdgeInsets.only(left: text.length < 15 ? 160 : 80),
            child: IconButton(
                onPressed: onTap,
                alignment: Alignment.centerLeft,
                icon: IconUtility.arrowForwardIcon),
          ));

  static RowModel normalTextRow(
          String text, IconData icon, TextStyle textStyle) =>
      RowModel(
          text: text,
          leadingIcon: Icon(
            icon,
            color: AppColors.black,
          ),
          textStyle: textStyle,
          isAlignmentBetween:
              false); //TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),

  TherapistProfileController controller = Get.find();
  Row acceptionRow(bool isForMakingShortCall) => Row(
          mainAxisAlignment: isForMakingShortCall
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          textDirection:
              isForMakingShortCall ? TextDirection.ltr : TextDirection.rtl,
          children: [
            Obx(() => IconButton(
                onPressed: () => controller.acceptionFunction(isForMakingShortCall),
                icon: Icon(isForMakingShortCall
                    ? controller.isMakingShortCallAccepted.value
                        ? Icons.check_circle_outline
                        : Icons.circle_outlined
                    : controller.isBeingAdvisorAccepted.value
                        ? Icons.check_circle_outline
                        : Icons.circle_outlined))),
            Text(isForMakingShortCall
                ? LoginSignUpTextUtil.therapistAcceptedMakingShortCall
                : ProfileSettingsTextUtil.therapistAcceptedRandomTherapistList)
          ]);
}
