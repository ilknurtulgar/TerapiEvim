import 'package:flutter/material.dart';

class AppColors {
  static const Color blueChalk = Color.fromRGBO(238, 227, 255, 1);
  //uygulamanin genelindeki lila renk
  static const Color cornFlowerBlue = Color.fromRGBO(102, 99, 255, 1);
  //container golgeleri
  static const Color white = Color.fromRGBO(254, 254, 254, 1);
  //duz beyaz
  static const Color melrose = Color.fromRGBO(208, 188, 255, 1);
  //acik renk butonlarin background
  static const Color meteorite = Color.fromRGBO(57, 30, 114, 1);
  //acik renk buton text rengi
  static const Color butterflyBush = Color.fromRGBO(103, 80, 164, 1);
  //koyu renk buton
  static const Color deepCove = Color.fromRGBO(11, 7, 54, 1);
  //Text renkleri
  static const Color dustyGray = Color.fromRGBO(149, 149, 149, 1);
  //navbar
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color coldPurple = Color.fromRGBO(185, 168, 220, 1);
  //mesaj
  static const Color royalBlue = Color.fromRGBO(99, 86, 229, 1);
  //login buton
}

class IconUtility {
  static const Icon visibilityIcon = Icon(Icons.visibility);
  static const Icon visibilityoffIcon = Icon(Icons.visibility_off);
  static const Icon homeIcon = Icon(Icons.home);
  static const Icon activityIcon =
      Icon(Icons.laptop_windows_sharp); //browse_activity yok
  static const Icon groupsIcon = Icon(Icons.groups);
  static const Icon chatIcon = Icon(Icons.chat);
  static const Icon profileIcon = Icon(Icons.account_circle);
  static const Icon windowsIcon = Icon(Icons.desktop_windows);
  static const Icon personIcon = Icon(Icons.person);
  static const Icon clockIcon = Icon(Icons.alarm);
  static const Icon logoutIcon = Icon(Icons.logout);
  static const Icon searchIcon = Icon(Icons.search);
  static const Icon fiterIcon = Icon(Icons.list);
  static const Icon fileIcon = Icon(Icons.description);
  static const Icon micIcon = Icon(Icons.mic);
  static const Icon micoffIcon = Icon(Icons.mic_off);
  static const Icon videcamIcon = Icon(Icons.videocam);
  static const Icon videocammoffIcon = Icon(Icons.videocam_off);
  static const Icon callendIcon = Icon(Icons.call_end);
  static const Icon sendIcon = Icon(Icons.send);
  static const Icon settingIcon = Icon(Icons.settings);
  static const Icon editIcon = Icon(Icons.edit);
  static const Icon deleteIcon = Icon(Icons.delete);
  static const IconData navHome = Icons.home;
  static const IconData navActivities = Icons.desktop_windows;
  static const IconData navMessage = Icons.chat;
  static const IconData navGroup = Icons.groups;
  static const IconData navProfile = Icons.account_circle;
}

class AppTextStyles {
  static TextStyle loginPageTextStyle(bool isTitle, bool isTextFieldExplanation,
          bool isTextButton, bool isButton) =>
      TextStyle(
          fontFamily: 'Inter',
          fontWeight: isButton ? FontWeight.w600 : FontWeight.w400,
          fontSize: isTitle ? 49 : 16,
          color: isButton
              ? AppColors.white
              : isTextFieldExplanation
                  ? AppColors.black
                  : isTextButton
                      ? AppColors.butterflyBush
                      : AppColors.deepCove);
  static TextStyle pagesBoldTitleStyle(bool isBig) => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: isBig ? 24 : 18,
      color: isBig
          ? AppColors.deepCove
          : AppColors //seminer konu başlıkları bu kısımda small olarak
              .black); // baş etme metotları başlığı bu kısımda bulunuyor small olarak
  static TextStyle testPageTextStyle(
          bool isQuestion, bool isOption, bool isButton) =>
      TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: isQuestion
            ? 18
            : isOption
                ? 12
                : 14,
        color: isOption
            ? AppColors.deepCove
            : isButton
                ? AppColors.white
                : AppColors.black,
      );
  static TextStyle appNameTextStyle = const TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    fontSize: 32,
    color: AppColors.deepCove,
  );
  static TextStyle mainPageTextStyle(
          bool isTitle, bool isSubTitle, bool isButton) =>
      TextStyle(
        fontFamily: 'Roboto',
        fontWeight: isButton ? FontWeight.w500 : FontWeight.w400,
        fontSize: isTitle
            ? 16
            : isButton
                ? 14
                : 12,
        color: isButton
            ? AppColors.white
            : isSubTitle
                ? AppColors.dustyGray
                : AppColors.black,
      );
  static TextStyle searchTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.dustyGray,
  );
  static TextStyle informationBoxTextStyle(
          //bu kategoriye etkinlik kutucukları ve grup sayfasındaki katılımcı kutucuğu dahil
          bool isInformationText,
          bool isBold) =>
      TextStyle(
        fontFamily: 'Roboto',
        fontWeight: isBold
            ? FontWeight.w500
            : FontWeight.w400, // katıl butonları için isBold true
        fontSize: isInformationText ? 16 : 14,
        color: isInformationText ? AppColors.black : AppColors.white,
      );
  static TextStyle methodsPageTextStyle(bool isDateText, bool isOrderButton,
          bool isExplanationText, bool isDocument) =>
      TextStyle(
        fontFamily: 'Roboto',
        fontWeight: isDateText ? FontWeight.w400 : FontWeight.w500,
        fontSize: isOrderButton
            ? 12
            : isExplanationText || isDocument
                ? 14
                : 16,
        color: isDocument
            ? AppColors.butterflyBush
            : isOrderButton || isExplanationText
                ? AppColors.black
                : AppColors.deepCove,
      );
  static TextStyle filterPagesTextStyle(
          bool isFilterButton, bool isCategory, bool isPageTitle) =>
      TextStyle(
          fontFamily: isFilterButton ? 'Roboto' : 'Inter',
          fontWeight: isFilterButton ? FontWeight.w500 : FontWeight.w400,
          color: isFilterButton ? AppColors.white : AppColors.black,
          fontSize: isCategory
              ? 24
              : isPageTitle
                  ? 20
                  : 16);
  static TextStyle aboutMeTextStyle(bool isName) => TextStyle(
        //seminer detay sayfasındaki hakkında kısmı
        fontFamily: isName ? 'Inter' : 'Roboto',
        fontWeight: isName ? FontWeight.w400 : FontWeight.w500,
        color: isName ? AppColors.black : AppColors.deepCove,
        fontSize: isName ? 31 : 14,
      );
  static TextStyle messagePageTextStyle(bool isMessage) => TextStyle(
      fontFamily: isMessage ? 'Inter' : 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: isMessage ? 14 : 24,
      color: isMessage ? AppColors.black : AppColors.deepCove);
  static TextStyle heading(bool isMainHeading) => TextStyle(
      //basliklarin hepsi
      color: AppColors.meteorite,
      fontSize: isMainHeading ? 32 : 24,
      fontFamily: "Roboto",
      fontWeight: isMainHeading ? FontWeight.w600 : FontWeight.w500,
      letterSpacing: 0.07);
}
