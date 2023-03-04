import 'dart:ui';

class LockScreenUtil {
  static const double lockScreenHeight = 40;
  static const double lockScreenHeight2 = 50;
  static const double lockScreenContainerWidth = 250;
  static const double lockScreenContainerHeight = 100;
  static const double lockScreenBigContainerWidth = 340;
  static const double lockScreenBigContainerHeight = 200;
  static const double lockIconSize = 100;

  static const String text =
      "Henüz Grubunuz Belli Olmadığı İçin Burası Kilitli";
  static const String text2 =
      "Henüz Grubunuz Belli Olmadığı İçin Burası Kilitli";
  static const String buttonText = "Testi Cozmek Icin Tiklayiniz";
  static const String checkedTestString =
      "Grup kategorileriniz belirlenmistir. Lutfen ilerleyiniz";

  static ImageFilter imageF = ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0);
}
