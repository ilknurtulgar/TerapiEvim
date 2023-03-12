import '../../core/init/cache/local_manager.dart';
import '../../core/init/network/vexa_fire_manager.dart';
import '../../core/init/print_dev.dart';
import '../../core/managers/firebase/crashlytics_manager.dart';
abstract class BaseController {
  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;
  final VexaFireManager vexaFireManager = VexaFireManager.instance;

  final LocalManager localManager = LocalManager.instance;
  final PrintDev printDev = PrintDev.instance;
}
