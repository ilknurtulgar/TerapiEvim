import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/container_model.dart';

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
  static const Color doveGray = Color.fromRGBO(98, 98, 98, 1);
  //kamera kapandığında gözüken renk
  static const Color mineShaft = Color.fromRGBO(56, 56, 56, 1);
  //videolu görüşmedeki arka plan rengi
  static const Color lightBlack = Color.fromRGBO(0, 0, 0, 0.7);
  //isolated call'daki şeffaf siyah renk
  static const Color red = Colors.red;
  static const Color orange = Colors.orange;
  static const Color transparent = Colors.transparent;
}

class IconUtility {
  static const Icon visibilityIcon = Icon(
    Icons.visibility,
  );
  static const Icon visibilityoffIcon = Icon(Icons.visibility_off);
  static const Icon homeIcon = Icon(Icons.home);
  static const Icon activityIcon =
      Icon(Icons.laptop_windows_sharp); //browse_activity yok
  static const Icon groupsIcon = Icon(Icons.groups);
  static const Icon chatIcon = Icon(Icons.chat);
  static const Icon profileIcon = Icon(Icons.account_circle);
  static const Icon windowsIcon = Icon(Icons.desktop_windows_outlined);
  static const Icon personIcon = Icon(
    Icons.person,
    color: AppColors.black,
  );
  static const Icon clockIcon = Icon(
    Icons.alarm_outlined,
    color: AppColors.black,
  );
  static const Icon logoutIcon = Icon(Icons.logout);
  static const Icon searchIcon = Icon(Icons.search);
  static const Icon fiterIcon = Icon(Icons.list);
  static const Icon fileIcon = Icon(
    Icons.description_outlined,
    color: AppColors.butterflyBush,
  );
  static const Icon fileIconBlack = Icon(
    Icons.description_outlined,
  );

  static Icon micIcon(bool isInCircularContainer) => Icon(
        Icons.mic,
        color: isInCircularContainer ? AppColors.black : AppColors.white,
      );
  static const Icon micoffIcon = Icon(
    Icons.mic_off,
    color: AppColors.red,
  );
  static const Icon videcamIcon = Icon(
    Icons.videocam,
    color: AppColors.black,
  );
  static const Icon videocamoffIcon = Icon(
    Icons.videocam_off,
    color: AppColors.black,
  );
  static const Icon callendIcon = Icon(
    Icons.call_end,
    color: AppColors.white,
  );
  static const Icon sendIcon = Icon(Icons.send);
  static const Icon settingIcon = Icon(Icons.settings);
  static const Icon editIcon = Icon(Icons.edit);
  static const Icon deleteIcon = Icon(Icons.delete);
  static const IconData navHome = Icons.home;
  static const IconData navActivities = Icons.desktop_windows;
  static const IconData navMessage = Icons.chat;
  static const IconData navGroup = Icons.groups;
  static const IconData navProfile = Icons.account_circle;
  static const IconData lock = Icons.lock_outline;
  static const Icon lockIcon = Icon(
    Icons.lock,
    color: AppColors.black,
  );
  static const Icon emailIcon = Icon(
    Icons.mail,
    color: AppColors.black,
  );
  static const IconData lockopen = Icons.lock_open;
  static const Icon calendarIcon = Icon(
    Icons.calendar_month_outlined,
    color: AppColors.black,
  );
  static const IconData checkCircleIcon = Icons.check_circle_outline;
  static const Icon save = Icon(Icons.save, color: AppColors.meteorite);
  static const Icon contactPhoneIcon =
      Icon(Icons.contact_phone_outlined, color: AppColors.black);
  static const arrowForwardIcon = Icon(
    Icons.arrow_forward_ios,
    color: AppColors.black,
  );
}

class AppTextStyles {
  static TextStyle normalTextStyle(String size, bool isGreyText) => TextStyle(
        // sizeları big medium small olarak 3 çeşit aldım
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: size == 'big'
            ? 24
            : size == 'medium'
                ? 16
                : 12,
        color: isGreyText ? AppColors.dustyGray : AppColors.black,
      );
  // small size --> psikolojik test sorularının seçenekleri,psikolog paylaşımlarındaki açıklamalar
  // big size --> Filtreleme sayfasındaki başlıklar
  // medium size --> textfield yazıları,mesajlar,test soruları,test hakkında bilgilendirme yazıları,card'daki titlelar,seminer containerlerı içindeki bold olmayan başlıklar
  //                 profil sayfaları(o sayfadaki yazılar figmada çok küçük durduğu için medium'a aldık),
  // grey text --> arama kısımlarındaki textler 'Ne aramıştınız?' texti gibi

  static TextStyle buttonTextStyle(Color buttonColor) => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      color: buttonColor == AppColors.butterflyBush
          ? AppColors.white
          : AppColors.butterflyBush);
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
  static TextStyle aboutMeTextStyle(bool isName) => TextStyle(
        //seminer detay sayfasındaki hakkında kısmı
        fontFamily: isName ? 'Inter' : 'Roboto',
        fontWeight: isName ? FontWeight.w400 : FontWeight.w500,
        color: isName ? AppColors.black : AppColors.deepCove,
        fontSize: isName ? 31 : 14,
      );
  static TextStyle heading(bool isMainHeading) => TextStyle(
      //basliklarin hepsi

      color: AppColors.meteorite,
      fontSize: isMainHeading ? 32 : 24,
      fontFamily: "Roboto",
      fontWeight: isMainHeading ? FontWeight.w600 : FontWeight.w500,
      letterSpacing: 0.07);
  static const TextStyle loginSignUpBigTitle = TextStyle(
      fontSize: 49,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: AppColors.black);
  static TextStyle groupTextStyle(bool isName) => TextStyle(
      fontFamily: 'Roboto',
      fontSize: isName ? 16 : 18,
      fontWeight: isName ? FontWeight.w400 : FontWeight.w500,
      color: AppColors.black);
}

class AppContainers {
  static ContainerModel classicWhiteContainer = ContainerModel(
      width: 342,
      borderRadius: 8,
      backgroundColor: AppColors
          .white); // bunun height'ı içindeki child'ın uzunluğuna göre değişiyor
  static ContainerModel participantContainer(double height, double width) =>
      ContainerModel(
          height: height, //52,
          width: width, //342,
          borderRadius: 8,
          backgroundColor: AppColors.white);
  static ContainerModel documentContainer = ContainerModel(
      height: 40,
      borderRadius: 360,
      backgroundColor: AppColors.white,
      shadowColor: AppColors
          .dustyGray); // bunun width'i içindeki text'in uzunluğuna göre değişiyor
  static ContainerModel purpleButtonContainer(double? width) => ContainerModel(
        height: 30,
        width: width,
        borderRadius: 100,
        backgroundColor: AppColors.butterflyBush,
      ); // bunun width'i içindeki text'in uzunluğuna göre değişiyor
}

class AppPaddings {
  static EdgeInsets purpleButtonAtRight = const EdgeInsets.fromLTRB(
      0, 15, 20, 15); // sağ alt bütün mor butonlar için geçerli
}

class AppBorderRadius {
  static const BorderRadius generalBorderRadius =
      BorderRadius.all(Radius.circular(8));
}

class AppBoxDecoration {
  static BoxDecoration lockScreenBox = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.generalBorderRadius,
      border: Border.all(color: AppColors.cornFlowerBlue));

  static BoxDecoration lockScreenButton = const BoxDecoration(
      color: AppColors.cornFlowerBlue,
      borderRadius: AppBorderRadius.generalBorderRadius);
}
