import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/controller/group_controller.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/participant/home/main_home.dart';
import 'package:terapievim/screen/participant/login/login_page.dart';

import 'controller/main_controller.dart';
import 'controller/therapist_group_controller.dart';
import 'controller/therapist_profile_controller.dart';
import 'core/init/config/config.dart';
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
  final MainController _controller = Get.put(MainController());
  final ActivityController activityController = Get.put(ActivityController());
  final ProfileController profileController = Get.put(ProfileController());
  final TherapistProfileController therapistProfileController =
      Get.put(TherapistProfileController());
  final TherapistGroupController therapistGroupController =
      Get.put(TherapistGroupController());
  final GroupController groupController = Get.put(GroupController());

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
        home: _controller.isLogged.isTrue
            ? const TerapiEvimLogged()
            : const ParticipantLoginPage());
  }
}

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb == false) {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(kDebugMode ? false : true);
  }

  final Config config = Config.instance;
  if (kIsWeb == false) {
    config.setIsAndroid = Platform.isAndroid;
  }
}
