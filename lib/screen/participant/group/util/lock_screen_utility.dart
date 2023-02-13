import 'dart:ui';

import 'package:flutter/material.dart';

class LockScreenUtil {
  static const double lockScreenHeight = 40;
  static const double lockScreenHeight2 = 50;
  static const double lockScreenContainerWidth = 250;
  static const double lockScreenContainerHeight = 100;
  static const double lockScreenBigContainerWidth = 340;
  static const double lockScreenBigContainerHeight = 200;
  static const double lockIconSize = 100;
  static const EdgeInsets lockScreenContainerPadding = EdgeInsets.all(20);

  static const String text =
      "Henüz Grubunuz Belli Olmadığı İçin Burası Kilitli";
  static const String text2 =
      "Henüz Grubunuz Belli Olmadığı İçin Burası Kilitli";
  static const String buttonText = "Testi Cozmek Icin Tiklayiniz";
  static const String checkedTestString =
      "Grup kategorileriniz belirlenmistir. Lutfen ilerleyiniz";

  static ImageFilter imageF = ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0);
}

class Paddings {
  static const EdgeInsets rowViewPadding =
      EdgeInsets.symmetric(vertical: 4, horizontal: 16);
  static const EdgeInsets rowViewProfilePadding =
      EdgeInsets.only(top: 15, left: 24, right: 24);
  static const EdgeInsets participantsPadding =
      EdgeInsets.only(left: 25, right: 25);
}
