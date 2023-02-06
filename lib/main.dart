import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/components/text/custom_text.dart';
import 'package:terapievim/screen/group/component/group_box.dart';
import 'package:terapievim/screen/group/group.dart';
import 'package:terapievim/screen/home/main_home.dart';
import 'package:terapievim/screen/login/login.dart';
import 'package:terapievim/service/mainController.dart';
import 'firebase_options.dart';
import 'screen/activity/activities.dart';
import 'screen/home/home.dart';
import 'screen/message/message.dart';
import 'screen/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb == false) {
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(kDebugMode ? false : true);
  }

  runApp(TerapiEvim());
}

class TerapiEvim extends StatefulWidget {
  TerapiEvim({Key? key}) : super(key: key);

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
            primarySwatch: Colors.purple,
            scaffoldBackgroundColor: AppColors.blueChalk),
        home: _controller.isLogged.isTrue ? TerapiEvimLogged() : Login());
  }
}
