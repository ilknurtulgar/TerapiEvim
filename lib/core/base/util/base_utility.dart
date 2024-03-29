import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/group/participant_container.dart';
import 'package:terapievim/core/base/component/home/home_component.dart';
import 'package:terapievim/core/base/ui_models/container_model.dart';
import 'package:terapievim/core/base/util/text_utility.dart';
import 'package:terapievim/screen/therapist/group/t_group_view.dart';
import 'package:terapievim/screen/therapist/profile/t_profile_view.dart';

import '../../../screen/participant/activity/p_activity_view.dart';
import '../../../screen/participant/group/p_group_view.dart';
import '../../../screen/participant/home/p_home_view.dart';
import '../../../screen/participant/profile/p_profile_view.dart';
import '../../../screen/therapist/activity/t_activity_view.dart';
import '../../../screen/therapist/home/t_home_view.dart';
import '../../../screen/therapist/message/t_message_view.dart';
import '../../init/managers/responsiveness_manager.dart';
import '../../managers/converter/date_time_manager.dart';
import '../component/profile/container/two_row_short_container.dart';
import '../component/profile/image/custom_circle_avatar.dart';
import '../ui_models/card_model.dart';
import '../ui_models/group_model.dart';
import '../ui_models/row_model.dart';
import '../ui_models/video_call/person_in_call_model.dart';

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
  static const Icon circleIcon = Icon(Icons.circle_outlined);
  static const Icon visibilityIcon = Icon(Icons.visibility);
  static const Icon addIcon = Icon(
    Icons.add,
    color: AppColors.white,
  );
  static const List<IconData> bottomnavigateIcons = <IconData>[
    IconUtility.navHome,
    IconUtility.navActivities,
    IconUtility.navGroup,
    IconUtility.navMessage,
    IconUtility.navProfile
  ];
  static const Icon visibilityoffIcon = Icon(Icons.visibility_off);
  static const Icon homeIcon = Icon(Icons.home);

  static const Icon activityIcon = Icon(Icons.laptop_windows_sharp);
  static const Icon groupsIcon = Icon(Icons.group_outlined);

  static const Icon chatIcon = Icon(Icons.chat);
  static const Icon emailIcon = Icon(Icons.mail, color: AppColors.black);
  static const Icon messageIcon = Icon(Icons.forum_outlined, size: 35);

  static const Icon addmesaage = Icon(
    Icons.mark_email_read_outlined,
    size: 30,
  );

  static const Icon personIcon = Icon(Icons.person_outlined);

  static const Icon windowsIcon = Icon(Icons.desktop_windows_outlined);
  static const Icon clockIcon =
      Icon(Icons.alarm_outlined, color: AppColors.black);

  static const Icon addcircleIcon = Icon(Icons.add_circle_outline);

  static const Icon notification = Icon(Icons.notifications);
  static const Icon logoutIcon = Icon(Icons.logout);
  static const Icon searchIcon = Icon(
    Icons.search,
    color: AppColors.black,
  );
  static const Icon filterIcon = Icon(Icons.list);

  static const Icon fileIcon = Icon(
    Icons.description_outlined,
    color: AppColors.white,
  );

  static Icon micIcon(bool isInCircularContainer) => Icon(Icons.mic,
      color: isInCircularContainer ? AppColors.black : AppColors.white);
  static const Icon micoffIcon = Icon(Icons.mic_off, color: AppColors.red);
  static const Icon videcamIcon =
      Icon(Icons.videocam_outlined, color: AppColors.black);
  static const Icon videocamoffIcon =
      Icon(Icons.videocam_off_outlined, color: AppColors.black);
  static const Icon callendIcon = Icon(Icons.call_end, color: AppColors.white);
  static const Icon sendIcon = Icon(Icons.send, color: AppColors.black);

  static const Icon settingIcon = Icon(Icons.settings);

  static const Icon deleteIcon = Icon(Icons.delete);
  static const Icon deleteIconOutlined = Icon(Icons.delete_outline_outlined);

  static const Icon calendarIcon =
      Icon(Icons.calendar_month_outlined, color: AppColors.black);

  static const Icon checkCircleIcon = Icon(Icons.check_circle_outline);
  static const Icon save = Icon(Icons.save, color: AppColors.meteorite);

  static const Icon contactPhoneIcon =
      Icon(Icons.contact_phone_outlined, color: AppColors.black);

  static const IconData navHome = Icons.home;
  static const IconData navActivities = Icons.desktop_windows;
  static const IconData navMessage = Icons.chat;
  static const IconData navGroup = Icons.groups;
  static const IconData navProfile = Icons.account_circle;

  static Icon lock(bool isLockScreen) => isLockScreen
      ? const Icon(Icons.lock_outline,
          color: AppColors.white, size: SizeUtil.lockIconSize)
      : const Icon(Icons.lock, color: AppColors.black);

  static const Icon lockSmall =
      Icon(Icons.lock_outline, color: AppColors.black);

  static const Icon lockopen = Icon(Icons.lock_open,
      color: AppColors.white, size: SizeUtil.lockIconSize);

  static const Icon close =
      Icon(Icons.close, size: 24, color: AppColors.meteorite);
  static const Icon closeIcon = Icon(Icons.close);
  static const Icon arrowUp = Icon(Icons.keyboard_arrow_up, size: 30);
  static const Icon arrowDown =
      Icon(Icons.keyboard_arrow_down_rounded, size: 30);
  static const Icon back = Icon(Icons.chevron_left, size: 30);
  static const Icon forward =
      Icon(Icons.keyboard_arrow_right_outlined, size: 30);
  static const Icon editPencil = Icon(Icons.edit_outlined, size: 30);
  static const Icon recordVoiceOver = Icon(
    Icons.record_voice_over,
    color: AppColors.white,
  );
  static const Icon personAddAlt = Icon(
    Icons.person_add_alt,
    color: AppColors.white,
  );
  static const Icon moreHorizontal = Icon(Icons.more_horiz);
  static const Icon handsUp = Icon(Icons.pan_tool_outlined);
  static const Icon handsDown = Icon(Icons.do_not_touch_outlined);
  static const Icon filledCircle = Icon(Icons.radio_button_checked);
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

  static TextStyle buttonTextStyle(Color textColor) => TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 18, // önceki değer 16,
      color: textColor);

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
        fontFamily: 'Roboto',
        fontWeight: isName ? FontWeight.w400 : FontWeight.w500,
        color: isName ? AppColors.black : AppColors.deepCove,
        fontSize: isName ? 31 : 14,
      );

  static TextStyle heading(bool isMainHeading) => TextStyle(
      //basliklarin hepsi

      color: AppColors.meteorite,
      fontSize: isMainHeading ? 32 : 19,
      fontFamily: "Roboto",
      fontWeight: isMainHeading ? FontWeight.w600 : FontWeight.w500,
      letterSpacing: 0.07);
  static const TextStyle loginSignUpBigTitle = TextStyle(
      fontSize: 49,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      color: AppColors.deepCove);

  static TextStyle groupTextStyle(bool isName) => TextStyle(
      fontFamily: 'Roboto',
      fontSize: isName ? 16 : 18,
      fontWeight: isName ? FontWeight.w400 : FontWeight.w500,
      //sor!
      color: isName ? AppColors.black : AppColors.meteorite);

  static TextStyle profileTextStyles(bool isBig, bool isBold) => TextStyle(
        fontFamily: 'Roboto',
        fontSize: isBig ? 20 : 17,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
        color: AppColors.black,
      );
  static TextStyle activityTextStyles() => TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        color: AppColors.meteorite,
        fontSize: 22,
      );
}

class AppContainers {
  static ContainerModel classicWhiteContainer = ContainerModel(
      width: SizeUtil.generalWidth,
      borderRadius: 8,
      backgroundColor: AppColors
          .white); // bunun height'ı içindeki child'ın uzunluğuna göre değişiyor

  static ContainerModel smallTimeContainer = ContainerModel(
      borderRadius: 8,
      backgroundColor: AppColors.white,
      height: SizeUtil.smallValueHeight,
      width: SizeUtil.smallValueWidth);

  static ContainerModel beforeLoginButtonContainer = ContainerModel(
    height: SizeUtil.smallValueHeight,
    width: SizeUtil.hugeValueWidth,
    borderRadius: 65,
    backgroundColor: AppColors.butterflyBush,
  );

  static ContainerModel notificationButton = ContainerModel(
      backgroundColor: AppColors.butterflyBush,
      borderRadius: 100,
      height: SizeUtil.lowValueHeight,
      shadowColor: AppColors.butterflyBush,
      width: SizeUtil.mediumValueWidth);

  static ContainerModel copingbutton = ContainerModel(
      width: SizeUtil.smallValueWidth,
      height: SizeUtil.smallValueHeight,
      shadowColor: ButtonColorUtil.copingColor,
      borderRadius: 8,
      backgroundColor: AppColors.white);

  static ContainerModel containerButton(bool bigwidth) {
    return ContainerModel(
        width: bigwidth ? SizeUtil.normalValueWidth : SizeUtil.smallValueWidth,
        height: SizeUtil.lowValueHeight,
        borderRadius: 16,
        backgroundColor: ButtonColorUtil.generalColor);
  }

  static ContainerModel hugeContainerButton() {
    return ContainerModel(
        width: 170,
        height: SizeUtil.lowValueHeight,
        borderRadius: 16,
        backgroundColor: ButtonColorUtil.generalColor);
  }

  static ContainerModel loginSignUpButtonContainer(
          bool isInLoginPage, bool isLoginButton) =>
      ContainerModel(
          borderRadius: 8,
          backgroundColor: (isInLoginPage && isLoginButton) ||
                  (isInLoginPage == false && isLoginButton == false)
              ? AppColors.royalBlue
              : AppColors.white,
          height: SizeUtil.smallValueHeight);

  static ContainerModel participantContainer(double height, {double? width}) =>
      ContainerModel(
          height: height, //52,
          width: width, //342,
          borderRadius: 8,
          backgroundColor: AppColors.white);

  static ContainerModel purpleButtonContainer(double? width) => ContainerModel(
        height: SizeUtil.lowValueHeight,
        width: width,
        borderRadius: 65,
        backgroundColor: AppColors.butterflyBush,
      ); // bunun width'i içindeki text'in uzunluğuna göre değişiyor
  static ContainerModel lightPurpleButtonContainer(
          double? width, bool isLonger) =>
      ContainerModel(
        height: isLonger ? SizeUtil.smallValueHeight : SizeUtil.lowValueHeight,
        width: width,
        borderRadius: 65,
        backgroundColor: AppColors.melrose,
      );
}

class ButtonColorUtil {
  static const Color generalColor = AppColors.butterflyBush;
  static const Color copingColor = AppColors.cornFlowerBlue;
}

class BorderColorUtil {
  static const Color generalBorderColor = AppColors.cornFlowerBlue;
  static const Color toggleBorderColor = AppColors.transparent;
  static const Color textfieldBorderColor = AppColors.dustyGray;
}

class AppPaddings {
  static const EdgeInsets appBarPadding =
      EdgeInsets.symmetric(vertical: 20, horizontal: 20);
  static const EdgeInsets appBarPaddingNew =
      EdgeInsets.only(top: 20, left: 12, right: 12);

  static const EdgeInsets bottomNavBarIcon = EdgeInsets.only(bottom: 5);

  static const EdgeInsets loginTitlePadding =
      EdgeInsets.only(top: 60, bottom: 40);

  static const EdgeInsets headingTopPadding = EdgeInsets.only(
    top: 80,
  );
  static const EdgeInsets pagePadding =
      EdgeInsets.only(left: 24, right: 24, bottom: 80, top: 15);
  static const EdgeInsets sizedEmpty =
      EdgeInsets.only(left: 24, right: 24, top: 15, bottom: 15);

  static const EdgeInsets pagePaddingHorizontal =
      EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsets componentPadding = EdgeInsets.symmetric(vertical: 8);

  static EdgeInsets miniHeadingPadding(bool isInMiddle) =>
      EdgeInsets.symmetric(vertical: 16, horizontal: isInMiddle ? 10 : 0);
  static const EdgeInsets rowViewPadding =
      //15
      EdgeInsets.symmetric(vertical: 4, horizontal: 12);

  static const EdgeInsets miniTopPadding = EdgeInsets.only(top: 10);
  static const EdgeInsets mediumxPadding = EdgeInsets.only(top: 25, bottom: 15);

  static const EdgeInsets generalPadding = EdgeInsets.all(5);

  //grup
//gruptan bu iki padding kaldi onlari da ben kullanmiyorum
  static EdgeInsets timeChossingBetweenPadding =
      const EdgeInsets.only(top: 26, left: 26, right: 26);
  static const EdgeInsets rowViewProfilePadding =
      EdgeInsets.only(top: 15, left: 24, right: 24);

  static EdgeInsets horizontalListViewPadding(int paddingNo) => EdgeInsets.only(
      bottom: paddingNo != 1 ? 12 : 0, right: paddingNo != 2 ? 12 : 0);

  // 1 numara right , 2 numara bottom , 3 numara bottom ve right
  static EdgeInsets profilePageBigPadding(
          bool isThereLeftPadding, bool isThereRightPadding) =>
      EdgeInsets.only(
          top: 260,
          left: isThereLeftPadding ? 24 : 0,
          right: isThereRightPadding ? 24 : 0);

  static EdgeInsets customContainerInsidePadding(int paddingNo) =>
      EdgeInsets.symmetric(
          horizontal: paddingNo != 2 ? 16 : 0,
          vertical: paddingNo != 1 ? 16 : 0);

  // 1 numara horizontal, 2 numara vertical, 3 numara horizontal ve vertical
  static EdgeInsets componentOnlyPadding(int paddingNo) => EdgeInsets.only(
      top: paddingNo == 1 ? 8 : 0,
      bottom: paddingNo == 2 ? 8 : 0,
      right: paddingNo == 3 ? 24 : 0,
      left: paddingNo == 4 ? 10 : 0);

  // burada ayrı ayrı olan 4 farklı only paddingini tek paddingte topladım
  static EdgeInsets smallPersonViewPadding =
      const EdgeInsets.only(top: 16, left: 8, right: 8);
  static EdgeInsets smallHorizontalPadding =
      const EdgeInsets.symmetric(horizontal: 8);
}

SizedBox smallSizedBox() => const SizedBox(height: 8);

SizedBox mediumSizedBox() => const SizedBox(height: 16);

SizedBox largeSizedBox() => const SizedBox(height: 32);
SizedBox hugeSizedBox() => const SizedBox(height: 50);
SizedBox huge2xSizedBox() => const SizedBox(height: 100);

class AppBorderRadius {
  static const BorderRadius generalBorderRadius =
      BorderRadius.all(Radius.circular(8));
  static const BorderRadius notificationradius =
      BorderRadius.all(Radius.circular(16));
}

class AppBoxDecoration {
  //aynı neredeyse
  static BoxDecoration purpleBorder = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.generalBorderRadius,
      border: Border.all(color: AppColors.cornFlowerBlue));

  static BoxDecoration sendDecoration = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.generalBorderRadius,
      border: Border.all(color: AppColors.dustyGray));

  static BoxDecoration lockScreenButton = const BoxDecoration(
      color: AppColors.cornFlowerBlue,
      borderRadius: AppBorderRadius.generalBorderRadius);

  static BoxDecoration shadow = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.notificationradius,
      boxShadow: [
        BoxShadow(
            color: AppColors.dustyGray.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(0, 3))
      ]);
  static BoxDecoration shadowGeneralRadius = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: AppColors.white,
      border: Border.all(color: Colors.grey.withOpacity(0.50), width: 1));
  static BoxDecoration noBorder = const BoxDecoration(
    color: AppColors.white,
    borderRadius: AppBorderRadius.generalBorderRadius,
  );
  static BoxDecoration dropDownDecoration = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.generalBorderRadius,
      border:
          Border.all(color: BorderColorUtil.textfieldBorderColor, width: 1));
  static OutlineInputBorder borderColor(bool isBig) {
    return OutlineInputBorder(
        borderRadius: AppBorderRadius.generalBorderRadius,
        borderSide: BorderSide(
          color: isBig
              ? BorderColorUtil.textfieldBorderColor
              : BorderColorUtil.generalBorderColor,
          width: 1,
        ));
  }
//  BoxDecoration(
//       border: Border.all(color: borderColor!.withOpacity(1)),
//       borderRadius: AppBorderRadius.generalBorderRadius,
//       color: AppColors.white)
// static BoxDecoration groupBoxDecoration = BoxDecoration(//widthi gormezden geliyorum daha cok benzer seyler olussun uygulamada diye
//   color: AppColors.white,
//   border: Border.all(color: AppColors.cornFlowerBlue, width: 2),
//   borderRadius: AppBorderRadius.generalBorderRadius,
// );
// BoxDecoration(
//           borderRadius: BorderRadius.circular(16), color: AppColors.white)//group info box deco bunu notificationluyla esletiyorum
}

Padding colon(bool isInAlertDialog) {
  return Padding(
    padding: isInAlertDialog
        ? const EdgeInsets.only(left: 20, right: 20, bottom: 15)
        : const EdgeInsets.symmetric(horizontal: 20),
    child: const Text(
      ':',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.black),
    ),
  );
}

class NavigateUtil {
  static List<Widget> therapisty = <Widget>[
    THomeView(),
    TActivityView(),
    const TGroupView(),
    const TMessageView(),
    TProfileView(),
  ];
  static List<Widget> screen = <Widget>[
    const PHomeView(),
    const PActivityView(),
    PGroupView(),
    // MessageScreen(),
    PProfileView(),
  ];
}

class DemoInformation {
  static HomeComponent demoLAstReviewContainer = HomeComponent(
      isForMethodReading: true,
      cardModel: CardModel(
          imagePath: DemoInformation.imagePath,
          title: DemoInformation.therapistName),
      time: "04/01/2003",
      title: 'başlık',
      explanation: "Kendini bil",
      buttonOnTap: () {},
      buttonText: "Oku");

  static TwoRowShortContainer demoAttendedSeminars = TwoRowShortContainer(
    row1Text: DemoInformation.therapistName,
    row2Text: "Kendini Bil",
    firstIconData: Icons.person,
    secondIconData: Icons.laptop_windows_sharp,
    purpose: ContainerPurpose.seminar,
    buttonText: "Tekrar Izle",
    firstOnTap: () {},
  );

  //message
  static const List<String> personList = [
    "Canan Karatay",
    "Ecem Kara",
    "Nur Kara",
    "Asya Günay",
    "Rachel Green",
    "Ross Geller",
    "Monica Bing",
  ];

  static const List<String> groupList = [
    "anksiyete",
    "panik atak",
  ];

//activity
  static const String aboutActivtyName = "Grup Terapilerinin Etkisi";
  static RowModel myPastActivities(String title) {
    return RowModel(
        isAlignmentBetween: false,
        text: title,
        textStyle: const TextStyle(),
        leadingIcon: IconUtility.activityIcon);
  }

  static RowModel recentActivityTitle(String title) {
    return RowModel(
        isAlignmentBetween: false,
        text: title,
        textStyle: const TextStyle(),
        leadingIcon: IconUtility.activityIcon);
  }

  static RowModel therapistnameActivityMod(String therapistName) {
    return RowModel(
        isAlignmentBetween: false,
        text: therapistName,
        textStyle: const TextStyle(),
        leadingIcon: IconUtility.personIcon);
  }

  static RowModel titlenameActivityMod(String title) {
    return RowModel(
        isAlignmentBetween: false,
        text: title,
        textStyle: const TextStyle(),
        leadingIcon: IconUtility.activityIcon);
  }

  static RowModel myPastActivitiesTime(Timestamp timestamp) {
    return RowModel(
        isAlignmentBetween: false,
        text: DateTimeManager.getFormattedDateFromFormattedString(
            value: timestamp.toDate().toIso8601String()),
        textStyle: const TextStyle(),
        leadingIcon: IconUtility.clockIcon);
  }

  static RowModel recentActivityTime(Timestamp timestamp) {
    return RowModel(
        isAlignmentBetween: false,
        text: DateTimeManager.getFormattedDateFromFormattedString(
            value: timestamp.toDate().toIso8601String()),
        textStyle: const TextStyle(),
        leadingIcon: IconUtility.clockIcon);
  }

  static const List<String> orderingList = ["yeniden eskiye", "eskiden yeniye"];
  static const List<String> genderList = ["kadın", "erkek"];

  //message
  static const String headingabactivity = "Canan Karatay";
  static const String aboutmeaperson =
      "hepinize merhaba arkadaşlar.kanalıma hoşgeldiniz,Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım  ";

  static const String aboutmeabactivity =
      "Neden Katılmalısın?Potansiyellerini keşfetmek, ihtiyaçlarını doğru şekilde tanımlayabilmek ve hayatta arzu ettiği başarılara ulaşabilmesi için ihtiyaçları ve eksik hissedilen yönleri geliştirmek için katılmalısınKimler Katılmalı?Kişisel gelişimine önem veren ve kendini geliştirmeyi hedefleyen, bölüm farketmeksizin üniversite öğrencileri, çalışma hayatında olan ve çalışma hayatına hazırlanan herkes.";

  static const String japonkadin = 'assets/images/f1.jpg';
  static const String clockabomeactivty = "15.11.2023 20:00";
  static const String date = "15.11.2023";
  static const String groupname = "OKB grubu 2";
  static const String notificationcontenttext =
      "Simay Selli gönderdiğiniz isteği kabul etmedi.";
  static const List<String> copingList = [
    "Simay Kara",
    "İlknur Kara",
    "Gizem Kara"
  ];
  static const String message =
      "Flutter, Google tarafından oluşturulan açık kaynaklı bir UI yazılım geliştirme kitidir. Android, iOS, Windows, Mac, Linux ve web için uygulamalar geliştirmek için kullanılıyor. Flutter'ın ilk sürümü  olarak biliniyordu ve Android işletim sisteminde çalışıyordu.";
  static const List<String> home = [
    "Baş etme metotumu incelemeyi unutmayın",
    "Stres ile ilgili metotlarımı incelemenizi önemli rica ederim",
  ];
  static CardModel cardModelhome = CardModel(
      subtitle: "Uzman Psikolog",
      imagePath: "assets/images/f1.jpg",
      title: "Rümeysa Kara");
  static const String name = "Stres ile Başa Çıkma";
  static const String therpyname = "İçimizdeki Çocuk";

  RowModel rowModel = RowModel(
      text: "Okb danışan",
      textStyle: AppTextStyles.aboutMeTextStyle(false),
      trailingIcon: const Text("11:20"),
      isAlignmentBetween: false);
  static const String clock = "19:20";

  //group
  static const String aboutme =
      "Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım";
  static const String therapistName2 = "Kerem Engin";
  static RowModel secTherapist = RowModel(
    isAlignmentBetween: true,
    leadingIcon: IconUtility.personIcon,
    text: "Yardimci Psikolog: ",
    textStyle: AppTextStyles.aboutMeTextStyle(false),
    text2: "Simay Odabasi",
    textStyle2: AppTextStyles.groupTextStyle(true),
    trailingIcon: IconUtility.forward,
  );

  static RowModel clockRow(Timestamp timestamp) {
    return RowModel(
      leadingIcon: IconUtility.clockIcon,
      text: DateTimeManager.getFormattedDateFromFormattedString(
          value: timestamp.toDate().toIso8601String()),
      textStyle: AppTextStyles.groupTextStyle(true),
      isAlignmentBetween: false,
    );
  }

  static RowModel clockRow1(String text) {
    return RowModel(
      leadingIcon: IconUtility.clockIcon,
      text: text,
      textStyle: AppTextStyles.groupTextStyle(true),
      isAlignmentBetween: false,
    );
  }

  static RowModel methods = RowModel(
      isAlignmentBetween: true,
      text: "Basetme Metotlari ",
      textStyle: AppTextStyles.aboutMeTextStyle(false),
      trailingIcon: IconUtility.forward,
      leadingIcon: IconUtility.fileIcon);

  //TODO: deprecated. Should be removed
  static RowModel row_1 = RowModel(
      leadingIcon: IconUtility.activityIcon,
      text: "Yeme Bozukluğu Grubu 1",
      textStyle: AppTextStyles.groupTextStyle(false),
      isAlignmentBetween: false);

  static RowModel groupTitle(String text) {
    return RowModel(
        leadingIcon: IconUtility.activityIcon,
        text: text,
        textStyle: AppTextStyles.groupTextStyle(false),
        isAlignmentBetween: false);
  }

  //TODO: deprecated. Should be removed
  static RowModel row_2 = RowModel(
      leadingIcon: IconUtility.personIcon,
      text: "Yardımcı Psikolog  : Bekleniyor.. ",
      textStyle: AppTextStyles.groupTextStyle(true),
      isAlignmentBetween: false);

  static RowModel groupTherapistHelper(String text) {
    return RowModel(
        leadingIcon: IconUtility.personIcon,
        text: text,
        textStyle: AppTextStyles.groupTextStyle(true),
        isAlignmentBetween: false);
  }

  static RowModel row_3 = RowModel(
      leadingIcon: IconUtility.groupsIcon,
      text: "Yeme Bozuklugu",
      textStyle: AppTextStyles.normalTextStyle('small', false),
      isAlignmentBetween: false);
  static var tmpParticipant = participantContainer(
      CardModel(imagePath: DemoInformation.imagePath, title: "Aleyna Tilki"),
      SizeUtil.normalValueHeight);
  static int tmpParticipantNumber = 5;
  static String tmpNewMetotText = "Yeni Yazimda size bla bla anlattim";
  static String tmppdfName = "YeniliklerleBasaCikma.pdf";
  static List<String> groupNames = [
    "Depresyon 1",
    "Depresyon 2",
    "Anksiyete 1",
    "Bulmia 1",
    "Yas 1"
  ];
  static final RowModel grup1 = RowModel(
    text: "Depresyon 1",
    textStyle: AppTextStyles.groupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.groupsIcon,
  );
  static final RowModel grup2 = RowModel(
    text: "Anksiyete 1",
    textStyle: AppTextStyles.groupTextStyle(false),
    isAlignmentBetween: false,
    leadingIcon: IconUtility.groupsIcon,
  );
  static String therapistName = "Yasemin Bebek";
  static String datetime = "27.01.2023";
  static List<String> timelist = ["12.00", "15.00", "20.00"];
  static String userName = "Yasemin";
  static int tmpCount = 5;

  static String imagePath = "assets/images/doctorfotosu.jpeg";
  static RowModel row = RowModel(
    isAlignmentBetween: true,
    leadingIcon: IconUtility.personIcon,
    text: "Grup Terapisti : ",
    textStyle: AppTextStyles.groupTextStyle(false),
    text2: "Simay Odabasi",
    textStyle2: AppTextStyles.groupTextStyle(true),
  );
  static RowModel row2 = RowModel(
    isAlignmentBetween: true,
    leadingIcon: IconUtility.personIcon,
    text: GroupTextUtil.secondTherapistText,
    textStyle: AppTextStyles.groupTextStyle(false),
    text2: "Ozlem Ulusan",
    textStyle2: AppTextStyles.groupTextStyle(true),
  );
  static RowModel person = RowModel(
      isAlignmentBetween: true,
      leadingIcon: CustomCircleAvatar(
          big: false, shadow: false, imagePath: DemoInformation.imagePath),
      text: "Aleyna Tilki",
      textStyle: AppTextStyles.groupTextStyle(true));

  static CardModel tmpMainTherapist =
      CardModel(imagePath: DemoInformation.imagePath, title: "Simay Selli");
  static String tmpGroupName = "Anksiyete";
  static int geciciKategoriSayisi = 5;

  static int tmpSessionNumber = 2;

  static List<String> dateList = [
    '07/05/2023',
    '08/05/2023',
    '09/05/2023',
    '10/05/2023',
    '11/05/2023'
  ];

  // video call
  // group therapy call page,isolated call page,short call page

  static PersonInCallModel therapist = PersonInCallModel(
      name: 'Simay',
      surname: 'Selli',
      imagePath: 'assets/images/f1.jpg',
      isMicOn: true.obs,
      isCamOn: true.obs);
  static PersonInCallModel personNo1 = PersonInCallModel(
    name: 'Kerem',
    surname: 'Görkem',
    imagePath: 'assets/images/f2.jpg',
    isMicOn: false.obs,
    isCamOn: true.obs,
  );
  static PersonInCallModel personNo2 = PersonInCallModel(
      name: 'Ali',
      surname: 'Aydın',
      imagePath: 'assets/images/f3.jpg',
      isMicOn: false.obs,
      isCamOn: true.obs);
  static List<PersonInCallModel> participants = [
    personNo1,
    personNo2,
    personNo1,
    personNo2,
    personNo1
  ];

  // participant profile
  static String profileImagePath = 'assets/images/f1.jpg';
  static String nameSurname = 'Emily Jordan';
  static String birthOfDate = '09/07/1995';
  static GroupModelInProfilePage groupInformation = GroupModelInProfilePage(
      groupName: 'Anoreksiya',
      mainTherapistName: 'Kerem Engin',
      methodTitles: ['Başlık 1', 'Başlık 2', 'Başlık 3', 'Başlık 4'],
      secondTherapistName: 'Simay Selli',
      therapyTime: 'Her salı, 20.00');
  static List<SeminarModelInProfileView> lastWatchedSeminars = [
    SeminarModelInProfileView(
        therapistName: 'Kerem Engin', seminarTitle: 'Seminer 1'),
    SeminarModelInProfileView(
        therapistName: 'Mustafa Engin', seminarTitle: 'Seminer 2'),
    SeminarModelInProfileView(
        therapistName: 'Mert Engin', seminarTitle: 'Seminer 3')
  ];

  // profile setting page
  static TextEditingController nameSurnameControllerInSetting =
      TextEditingController(text: "Kerem Engin");
  static TextEditingController mailControllerInSetting =
      TextEditingController(text: "test@gmail.com");
  static TextEditingController birthdayControllerInSetting =
      TextEditingController(text: "25/05/1995");
  static TextEditingController passwordControllerInSetting =
      TextEditingController(text: "asdf");
  static TextEditingController phoneControllerInSetting =
      TextEditingController(text: "5055139645");
  static TextEditingController aboutMeController = TextEditingController(
      text:
          '''Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım.''');

  // therapist profile page
  static List<String> dates = [
    'Her cuma,21.00',
    'Her salı,20.00',
    'Her pazartesi,17.00',
    'Her perşembe,18.00'
  ];

  static List<String> groupNameList =
      List.generate(5, (index) => 'Depresyon ${index + 1}');
  static List<String> methodNames =
      List.generate(5, (index) => 'Kendini Bil ${index + 1}');
  static List<String> seminarNames =
      List.generate(5, (index) => 'Seminar  seminneeerrrrr ${index + 1}');
  static List<String> advisorNames =
      List.generate(5, (index) => 'Yeşim ${index + 1}');

  static CardModel personCardModel =
      CardModel(imagePath: imagePath, title: 'Kerem Görkem');
}

Divider divider(bool issearch) {
  return Divider(
    color: issearch ? AppColors.doveGray : AppColors.black,
    height: 5,
    //
    indent: 10,
  );
}

SizedBox sizedBox() {
  return const SizedBox(
    height: 50,
  );
}

class TextFieldSize {
  //52 dateclock
  static const double generalheight = 60;
  static const double minheight = 30;
  static const double generalwidth = 60;
  static const double minwidth = 30;
  static const double dateclockwidth = 150;
}

class SizeUtil {
  static double heightFactor = 1;

  ///Height Factor
  static double widthFactor = 1;

  ///Width Factor
  static const double lockIconSize = 100;

  static const double generalHeight =
      52; //lockScreenHeight2(pdfcontainer aynı),kayıt olma sayfasındaki genderDropDownHeight,acceptionContainerHeight
  static const double generalWidth =
      342; //lockScreenBigContainerWidth,purpleTextContainer,personShortCallViewWidth
  static const double bnbHeight = 60;
  static const double appBarHeight = 70;
  static const double participantContainerWidth = 178;

  // küçükten büyüğe sıralama
  static const double zeroSize = 0;
  static const double specialSize = 160;

  // width
  static const double lowValueWidth =
      40; // profil sayfasındaki mini container ve listwheelscrollview için
  static const double smallValueWidth = 92; // video call person small view
  static const double normalValueWidth =

      /// orderDropDownWidth,horizontalLineWidth,bilgilerimi güncelle width buradan geliyor patladığı için böyle yaptım (170) 150'ydi.
      150;
  static const double mediumValueWidth =
      195; // profil sayfasındaki genderDropDown
  static const double largeValueWidth =
      250; //shortContainerWithButtonWidth,lockScreenContainerWidth,pdf container
  static const double hugeValueWidth =
      320; //electionWidth(eski değeri 300),beforeLoginButtonWidth,terapist profil sayfasındaki GroupContainerWidth
  static const double highestValueWidth =
      350; //danışan sayfasındaki groupContainerWidth
  // height
  static const double specialValueWidth = 370;
  static const double lowValueHeight =
      35; //animatedContainerHeight(listwheelscrollviewdaki),profil sayfasındaki genderDropDownHeight,miniContainerHeight,purpleButtonHeight
  static const double smallValueHeight =
      40; // lockScreenHeight(dropdownheight,filter aynı),loginSignUpButtonHeight,beforeLoginButtonHeight
  static const double normalValueHeight =
      65; // videoCallButtonCircularContainerHeight,sendboxheight
  static const double doubleSmallValueHeight =
      80; // shortContainerWithoutButtonHeight(participantWihtShortCallTime componenti)
  static const double mediumValueHeight =
      100; // lockScreenContainerHeight,terapist profil sayfasındaki 'number of groups' için listWheelScrollHeight,videoCallButtonRowHeight
  // belki mediumValueHeight ile  doubleNormalValueHeight ortak 130 olabilir
  // tGroupContainerHeightve shortContainerWithButtonHeight ne değer verilirse verilsin heightları değişmiyor
  static const double doubleNormalValueHeight =

      ///130
      140; // shortContainerWithButtonHeight(114),groupHeight(seminar max'ta kullanılıyor),tGroupContainerHeight(120),personSmallViewHeight,listViewHeight
  static const double largeValueHeight =
      150; // groupContainerHeight(danışan profil sayfasındaki),homeImageHeight,saat için listWheelScrollHeight
  static const double highValueHeight =
      200; // arka plandaki whiteContainerHeight(eski değeri 191),lockScreenBigContainerHeight
  // lockScreenBigContainerHeight hiçbir yerde kullanılmıyor
  static const double hugeValueHeight =
      281; // personShortCallViewHeight,groupCallBottomContainerHeight
  static const double highestValueHeight = 750; // personBigViewHeight
}

class Filter {
  static ImageFilter blur = ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0);
}

//responsiveness vermemiz gereken textlerde bunu çağırabiliriz.
Widget responsivenestext(String text, TextStyle? style) {
  return Text(
    text,
    style: style,
    textScaleFactor: ResponsivenessManager.instance.widthFactorMax1,
  );
}

class Responsive {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 390);
  }

  static widthForBackIcon(BuildContext context) {
    return MediaQuery.of(context).size.width - 50;
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 844);
  }
}

IconButton backButton(BuildContext context, Function()? onPressed) {
  return IconButton(
      padding: EdgeInsets.zero, onPressed: onPressed, icon: IconUtility.back);
}

IconButton closeIcon(Function()? onPressed) =>
    IconButton(onPressed: onPressed, icon: IconUtility.close);
