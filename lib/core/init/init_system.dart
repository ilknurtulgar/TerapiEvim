import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controller/auth/auth_controller.dart';
import '../../controller/main_controller.dart';
import '../../service/firebase_options.dart';
import 'cache/local_manager.dart';
import 'config/config.dart';

class InitSystem {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ); // sadece portre modu

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
    Get.put(MainController());
  }
}
