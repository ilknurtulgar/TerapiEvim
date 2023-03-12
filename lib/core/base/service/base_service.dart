import '../../managers/firebase/crashlytics_manager.dart';

abstract class BaseService {
  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;
}
