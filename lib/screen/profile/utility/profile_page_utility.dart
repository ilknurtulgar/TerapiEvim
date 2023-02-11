import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import '../../../core/base/models/container_model.dart';
import '../../../core/base/models/row_model.dart';
import '../component/image/custom_circle_avatar.dart';

class ProfilePageUtility {
  static Column backgroundOfThePage(bool isInProfileSettingsPage) => Column(
        children: [
          Container(
            height: 162,
            width: window.physicalSize.width,
            color: AppColors.white,
          ),
          Container(
            height: isInProfileSettingsPage
                ? window.physicalSize.height - 162
                : 678,
            width: window.physicalSize.width,
            color: AppColors.blueChalk,
          ),
        ],
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

  static RowModel therapistRow(
          String whichTherapistInformationText, String therapistName) =>
      RowModel(
          // ana ve yardımcı terapist için
          text: whichTherapistInformationText,
          textStyle: AppTextStyles.groupTextStyle(false),
          text2: therapistName,
          textStyle2: AppTextStyles.normalTextStyle('medium', false),
          leadingIcon: IconUtility.personIcon,
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
            padding: EdgeInsets.only(
                left: icon == Icons.desktop_windows_outlined ? 60 : 65),
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

  static Padding lineWithOrText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          horizontalLine(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text('Ya da'),
          ),
          horizontalLine()
        ],
      ),
    );
  }

  static Container horizontalLine() {
    return Container(
      color: AppColors.black,
      height: 1,
      width: 150,
    );
  }

  static ContainerModel loginSignUpButtonContainer(
          bool isInLoginPage, bool isLoginButton) =>
      ContainerModel(
          width: 342,
          borderRadius: 8,
          backgroundColor: (isInLoginPage && isLoginButton) ||
                  (isInLoginPage == false && isLoginButton == false)
              ? AppColors.royalBlue
              : AppColors.white,
          height: 43);

  static List<String> informationTitle = [
    'Ad Soyad: ',
    'Doğum Tarihi: ',
    'Cinsiyet: ',
    'Mail: ',
    'Şifre: ',
    'Telefon: '
  ];
}
