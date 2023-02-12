import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:get/get.dart';
import 'package:terapievim/controller/activity_controller.dart';
import 'package:terapievim/controller/profile_controller.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/home/main_home.dart';
import 'package:terapievim/screen/login/participant_ui/login_page.dart';
import 'controller/main_controller.dart';
import 'service/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb == false) {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(kDebugMode ? false : true);
  }

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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            splashColor: Colors.transparent,
            primarySwatch: Colors.purple,
            scaffoldBackgroundColor: AppColors.blueChalk),
        home: _controller.isLogged.isTrue
            ? const TerapiEvimLogged()
            : ParticipantLoginPage());
  }
}
