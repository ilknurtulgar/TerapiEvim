import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controller/auth/auth_controller.dart';
import 'controller/main_controller.dart';
import 'core/base/util/base_utility.dart';
import 'core/init/cache/local_manager.dart';
import 'core/init/config/config.dart';
import 'screen/common/home/main_home.dart';
import 'screen/common/sign_in/sign_in_view.dart';
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
          useMaterial3: true,
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
              elevation: 70)),
      home: Obx(
        () => _authController.isLogged.isTrue
            ? const MainHome()
            : const SignInView(),
      ),
    );
  }
}

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
