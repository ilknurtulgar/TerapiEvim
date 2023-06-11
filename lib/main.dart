import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth/auth_controller.dart';
import 'core/init/init_system.dart';
import 'core/init/theme/theme_manager.dart';
import 'screen/common/home/main_home.dart';
import 'screen/common/sign_in/sign_in_view.dart';

void main() async {
  await InitSystem().initialize();
  runApp(const TerapiEvim());
}

class TerapiEvim extends StatelessWidget {
  const TerapiEvim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.find();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.lightTheme(),
      home: Obx(
        () => _authController.isLogged.isTrue
            ? const MainHome()
            : const SignInView(),
      ),
    );
  }
}
