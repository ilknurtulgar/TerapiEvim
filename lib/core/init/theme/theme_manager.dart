import 'package:flutter/material.dart';

import '../../base/util/base_utility.dart';

class ThemeManager {
  static ThemeData lightTheme() {
    return ThemeData(
      splashColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.blueChalk,
      useMaterial3: false,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: AppColors.deepCove)),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.dustyGray,
        elevation: 70,
      ),
    );
  }
}
