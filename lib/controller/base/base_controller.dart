import 'package:flutter/material.dart';

import '../../core/init/cache/local_manager.dart';
import '../../core/init/navigation/navigation_manager.dart';
import '../../core/init/network/vexa_fire_manager.dart';
import '../../core/init/print_dev.dart';
import '../../core/managers/firebase/crashlytics_manager.dart';
abstract class BaseController {

  late BuildContext context;

  void setContext(BuildContext context);

  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;
  final VexaFireManager vexaFireManager = VexaFireManager.instance;
  final NavigationManager navigationManager = NavigationManager.instance;

  final LocalManager localManager = LocalManager.instance;
  final PrintDev printDev = PrintDev.instance;

}
