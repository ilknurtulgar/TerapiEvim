import 'package:flutter/material.dart';
import 'package:terapievim/core/base/models/container_model.dart';
import 'package:terapievim/screen/therapist/group/group.dart';

import '../../../screen/participant/activity/activities.dart';
import '../../../screen/participant/group/group.dart';
import '../../../screen/participant/home/home.dart';
import '../../../screen/participant/message/message.dart';
import '../../../screen/participant/profile/models/group_model.dart';
import '../../../screen/participant/profile/profile_page.dart';
import '../../../screen/participant/video_call/model/person_in_call_model.dart';
import '../../../screen/therapist/activity/activity_screen.dart';
import '../../../screen/therapist/home/home.dart';
import '../../../screen/therapist/message/message.dart';

import '../models/card_model.dart';

import '../component/group/questions_button.dart';
import '../component/profile/image/custom_circle_avatar.dart';

import '../models/row_model.dart';

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
  static const Icon chevronIcon = Icon(Icons.chevron_left);
  static const Icon circleIcon = Icon(Icons.circle);
  static const Icon arrowIcon = Icon(Icons.keyboard_arrow_right_outlined);
  static const Icon visibilityIcon = Icon(
    Icons.visibility,
  );
  static const Icon messageIcon = Icon(
    Icons.forum_outlined,
    size: 35,
  );
  static const Icon addmesaage = Icon(
    Icons.mark_email_read_outlined,
    size: 30,
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
  static const Icon closeIcon = Icon(Icons.close);
  static const Icon activityIcon =
      Icon(Icons.laptop_windows_sharp); //browse_activity yok
  static const Icon groupsIcon = Icon(Icons.groups);
  static const Icon greyGroupsIcon = Icon(
    Icons.group,
    color: AppColors.doveGray,
  );
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
  static const Icon addIcon = Icon(
    Icons.add_circle_outline,
  );
  static const Icon notification = Icon(Icons.notifications);
  static const Icon logoutIcon = Icon(Icons.logout);
  static const Icon searchIcon = Icon(Icons.search);
  static const Icon fiterIcon = Icon(Icons.list);
  static const Icon fileIcon = Icon(
    Icons.description_outlined,
  );
  static const Icon fileIconBlack = Icon(
    Icons.description_outlined,
  );
  static const Icon arrowDownIcon = Icon(Icons.keyboard_arrow_down_outlined);

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
  static const Icon sendIcon = Icon(
    Icons.send,
    color: Colors.black,
  );
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
      //sor!
      color: isName ? AppColors.black : AppColors.deepCove);
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

  static ContainerModel purpleButtonContainer(double? width) => ContainerModel(
        height: 30,
        width: width,
        borderRadius: 65,
        backgroundColor: AppColors.butterflyBush,
      ); // bunun width'i içindeki text'in uzunluğuna göre değişiyor
  static ContainerModel lightPurpleButtonContainer(double? width) =>
      ContainerModel(
        height: 40,
        width: width,
        borderRadius: 65,
        backgroundColor: AppColors.melrose,
      );
  static ContainerModel containerButton(bool bigwidth) {
    return ContainerModel(
        width: bigwidth ? 150 : 97,
        height: 30,
        borderRadius: 100,
        backgroundColor: AppColors.butterflyBush);
  }

  static ContainerModel copingbutton = ContainerModel(
      width: 116,
      height: 42,
      shadowColor: AppColors.cornFlowerBlue,
      borderRadius: 5,
      backgroundColor: AppColors.white);
}

class AppPaddings {
  static const EdgeInsets generalPadding = EdgeInsets.all(8);
  static const EdgeInsets reminderPadding =
      EdgeInsets.symmetric(vertical: 16, horizontal: 16);
  static const EdgeInsets reminderBetweenText =
      EdgeInsets.symmetric(vertical: 16.0);
  static EdgeInsets purpleButtonAtRight = const EdgeInsets.fromLTRB(
      0, 10, 20, 10); // sağ alt bütün mor butonlar için geçerli
  static const EdgeInsets copingButtonPadding =
      EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25);

  static const EdgeInsets appmpadding = EdgeInsets.all(15);
}

class AppBorderRadius {
  static const BorderRadius generalBorderRadius =
      BorderRadius.all(Radius.circular(8));
  static const BorderRadius notificationradius =
      BorderRadius.all(Radius.circular(16));
}

class AppBoxDecoration {
  static BoxDecoration lockScreenBox = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.generalBorderRadius,
      border: Border.all(color: AppColors.cornFlowerBlue));

  static BoxDecoration lockScreenButton = const BoxDecoration(
      color: AppColors.cornFlowerBlue,
      borderRadius: AppBorderRadius.generalBorderRadius);

  static BoxDecoration sendDecoration = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.generalBorderRadius,
      border: Border.all(color: AppColors.dustyGray));

  static BoxDecoration notificationDec = BoxDecoration(
      color: AppColors.white,
      borderRadius: AppBorderRadius.notificationradius,
      boxShadow: [
        BoxShadow(
            color: AppColors.dustyGray.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(0, 3))
      ]);
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
    const TherapistHome(),
    const TherapistActivityScreen(),
    TherapistGroupPage(),
    const TherapistMessageScreen(),
    const ParticipantProfilePage(),
  ];
  static List<Widget> screen = <Widget>[
    const HomeScreen(),
    const ActivitiesScreen(),
    GroupScreen(),
    MessageScreen(),
    const ParticipantProfilePage(),
  ];
}

class DemoInformation {
  //message
  static const List<String> personList = [
    "İrem Derici",
    "Canan Karatay",
    "Ecem Kara",
    "Nur Kara",
    "Asya Günay",
    "Rachel Green",
    "Ross Geller",
    "Monica Bing",
    "Chandler Bing"
  ];

  static const List<String> groupList = [
    "anksiyete",
    "panik atak",
  ];
//activity
  static const String aboutActivtyName = "Grup Terapilerinin Etkisi";
  static RowModel arowmodel = RowModel(
      isAlignmentBetween: false,
      text: "Grup Terapilerinin Etkisi",
      textStyle: const TextStyle(),
      leadingIcon: IconUtility.activityIcon);

  static RowModel ayrowmodel = RowModel(
      isAlignmentBetween: false,
      text: "Özlem Ulusan",
      textStyle: const TextStyle(),
      leadingIcon: IconUtility.personIcon);
  static RowModel clockmodel = RowModel(
      isAlignmentBetween: false,
      text: "Ocak 15,2023,20:00",
      textStyle: const TextStyle(),
      leadingIcon: IconUtility.clockIcon);
  static const List<String> orderingList = ["yeniden eskiye", "eskiden yeniye"];
  static const List<String> genderList = ["kadın", "erkek"];

  //message
  static const String headingabactivity = "Canan Karatay";
  static const String aboutmeaperson =
      "   hepinize merhaba arkadaşlar.kanalıma hoşgeldiniz,Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım  ";

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
    "fdvd",
    "fşdv",
    "fgbng",
    "yasemin",
    "gizem",
    "ilknur",
    "behzat"
  ];
  static CardModel cardModelhome = CardModel(
      subtitle: "Uzman Psikolog",
      imagePath: "assets/images/doctorfotosu.jpeg",
      title: "Günay Kara");
  static const String name = "Yasemin";

  RowModel rowModel = RowModel(
      text: "Okb danışan",
      textStyle: AppTextStyles.aboutMeTextStyle(false),
      trailingIcon: const Text("11:20"),
      isAlignmentBetween: false);
  static const String clock = "19:20";

  //group
  static RowModel secTherapist = RowModel(
    isAlignmentBetween: true,
    leadingIcon: IconUtility.personIcon,
    text: "Yardimci Psikolog: ",
    textStyle: AppTextStyles.aboutMeTextStyle(false),
    text2: "Simay Odabasi",
    textStyle2: AppTextStyles.groupTextStyle(true),
    trailingIcon: IconUtility.arrowForwardIcon,
  );
  static RowModel methods = RowModel(
      isAlignmentBetween: true,
      text: "Basetme Metotlari ",
      textStyle: AppTextStyles.aboutMeTextStyle(false),
      trailingIcon: IconUtility.arrowForwardIcon,
      leadingIcon: IconUtility.fileIcon);
  static RowModel row_1 = RowModel(
      leadingIcon: IconUtility.activityIcon,
      text: "Yeme Bozukluğu Grubu 1",
      textStyle: AppTextStyles.groupTextStyle(false),
      isAlignmentBetween: false);
  static RowModel row_2 = RowModel(
      leadingIcon: IconUtility.personIcon,
      text: "Yardımcı Psikolog  : Bekleniyor.. ",
      textStyle: AppTextStyles.groupTextStyle(true),
      isAlignmentBetween: false);
  static RowModel row_3 = RowModel(
      leadingIcon: IconUtility.greyGroupsIcon,
      text: "Katılımcı Sayısı : 0/20",
      textStyle: AppTextStyles.normalTextStyle('small', false),
      isAlignmentBetween: false);
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
  static List<Widget> questions = [
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview(),
    togglebuttonsview()
  ];
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
    text: "Yardimci Psikolog: ",
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

  // video call
  // group therapy call page,isolated call page,short call page

  static PersonInCallModel therapist = PersonInCallModel(
      name: 'Simay',
      surname: 'Selli',
      imagePath: 'assets/images/f1.jpg',
      isMicOn: true,
      isCamOn: true);
  static PersonInCallModel personNo1 = PersonInCallModel(
      name: 'Kerem',
      surname: 'Görkem',
      imagePath: 'assets/images/f2.jpg',
      isMicOn: false,
      isCamOn: true);
  static PersonInCallModel personNo2 = PersonInCallModel(
      name: 'Ali',
      surname: 'Aydın',
      imagePath: 'assets/images/f3.jpg',
      isMicOn: false,
      isCamOn: true);
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
  static List<SeminarModelInProfilePage> lastWatchedSeminars = [
    SeminarModelInProfilePage(
        therapistName: 'Kerem Engin', seminarTitle: 'Seminer 1'),
    SeminarModelInProfilePage(
        therapistName: 'Mustafa Engin', seminarTitle: 'Seminer 2'),
    SeminarModelInProfilePage(
        therapistName: 'Mert Engin', seminarTitle: 'Seminer 3')
  ];
  // profile setting page
  static TextEditingController nameSurnameControllerInSetting =
      TextEditingController(text: "Kerem Engin");
  static TextEditingController mailControllerInSetting =
      TextEditingController(text: "test@gmail.com");
  static TextEditingController passwordControllerInSetting =
      TextEditingController(text: "asdf");
  static TextEditingController phoneControllerInSetting =
      TextEditingController(text: "5055139645");
  static TextEditingController aboutMeController = TextEditingController(
      text:
          '''Klinik Psikologum. Genelde bilişsel davranışçı bir yaklaşımda çalışıyorum.Olumsuz duyguların ortadan kaldırılması (korku, endişe, depresyon, öfke, kızgınlık, suçluluk duyguları, aşk bağımlılığı, tembellik, erteleme, diğer içsel deneyimler) üzerine çalışmaktayım.''');
  static bool isForParticipant = false;

  // therapist profile page
  static List<String> therapyDates = [
    'Her cuma,21.00',
    'Her salı,20.00',
    'Her pazartesi,17.00',
    'Her perşembe,18.00'
  ];
}

Divider divider() {
  return const Divider(
    color: AppColors.black,
    height: 5,
  );
}

SizedBox sizedbox() {
  return const SizedBox(
    height: 15,
  );
}
