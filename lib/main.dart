import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/controller/group_controller.dart';
import 'controller/auth/auth_controller.dart';
import 'controller/therapist_group_controller.dart';
import 'controller/therapist_profile_controller.dart';
import 'core/base/util/base_utility.dart';
import 'core/init/cache/local_manager.dart';
import 'core/init/config/config.dart';
import 'screen/participant/home/main_home.dart';
import 'screen/participant/login/login_page.dart';
import 'service/firebase_options.dart';

void main() async {
  await initialize();
  runApp(const TerapiEvim());
}

class TerapiEvim extends StatefulWidget {
  const TerapiEvim({Key? key}) : super(key: key);

  @override
  State<TerapiEvim> createState() => _TerapiEvimState();
}

class _TerapiEvimState extends State<TerapiEvim> {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //bu thema baska yere gitmesi lazijm
          splashColor: Colors.transparent,
          scaffoldBackgroundColor: AppColors.blueChalk,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.black,
              unselectedItemColor: AppColors.dustyGray,
              elevation: 70)),
      home: Obx(
        () => _authController.isLogged.isTrue
            ? const TerapiEvimLogged()
            : const ParticipantLoginPage(),
      ),
    );
  }
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Config config = Config.instance;
  if (kIsWeb == false) {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(kDebugMode ? false : true);

    config.setIsAndroid = Platform.isAndroid;
  }

  await LocalManager.preferencesInit();
  _initializeControllers();
}

void _initializeControllers() {
  Get.put(AuthController());
  Get.put(ActivityController());
  Get.put(TherapistProfileController());
  Get.put(TherapistGroupController());
  Get.put(GroupController());
}
