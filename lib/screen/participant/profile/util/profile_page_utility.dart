import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/component/group/row_view.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../../core/base/component/activtiy/drop_down.dart';
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
          textStyle: AppTextStyles.profileTextStyles(false, true),
          text2: secondText,
          textStyle2: AppTextStyles.normalTextStyle('medium', false),
          leadingIcon: Icon(
            isInParticipantPage
                ? Icons.person_outline
                : Icons.account_circle_outlined,
            color: Colors.black,
          ),
          isAlignmentBetween: false);

  static boldMainTitleRowView(String text, String purpose, Function() onTap) =>
      rowView(
          RowModel(
              text: text,
              leadingIcon: Icon(
                purpose == 'group'
                    ? Icons.group_outlined
                    : purpose == 'method'
                        ? Icons.description_outlined
                        : Icons.desktop_windows_outlined,
                color: AppColors.black,
                size: 25,
              ),
              textStyle: AppTextStyles.profileTextStyles(true, true),
              isAlignmentBetween: false,
              trailingIcon: Padding(
                padding: EdgeInsets.only(left: text.length < 15 ? 160 : 80),
                child: IconButton(
                    onPressed: onTap,
                    alignment: Alignment.centerLeft,
                    icon: IconUtility.arrowForwardIcon),
              )),
          EdgeInsets.zero);

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

  static CustomDropDown genderDropDown(bool isInProfilePage) => CustomDropDown(
        isGenderPurpose: true,
        width: isInProfilePage ? 195 : 342,
        height: isInProfilePage ? 23 : 56,
      );
}
