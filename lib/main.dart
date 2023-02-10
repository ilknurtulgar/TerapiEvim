import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/screen/home/main_home.dart';
import 'package:terapievim/screen/login/participant_ui/participant_login_page.dart';
import 'controller/mainController.dart';
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
  MainController _controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    List<Widget> Screen = <Widget>[];
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            splashColor: Colors.transparent,
            primarySwatch: Colors.purple,
            scaffoldBackgroundColor: AppColors.blueChalk),
        home: _controller.isLogged.isTrue ? TerapiEvimLogged() : ParticipantLoginPage());
  }
}
