import '../../managers/firebase/crashlytics_manager.dart';
import '../../managers/firebase/firestore/firestore_manager.dart';
import '../../managers/firebase/firestore/i_firestore_manager.dart';

abstract class BaseService{
  final CrashlyticsManager crashlyticsManager = CrashlyticsManager.instance;
  IFirestoreManager firestoreManager = FirestoreManager.instance;
}
