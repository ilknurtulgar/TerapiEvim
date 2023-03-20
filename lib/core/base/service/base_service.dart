import 'package:firebase_auth/firebase_auth.dart';

import '../../managers/firebase/crashlytics_manager.dart';

abstract class BaseService {
  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;
  final String? userId = FirebaseAuth.instance.currentUser?.uid;
}
