import 'package:flutter/foundation.dart';

import './model/error_model_custom.dart';
import '../../managers/firebase/firestore/firestore_manager.dart';
import '../../managers/firebase/firestore/i_firestore_manager.dart';

class VexaFireManager {
  static VexaFireManager? _instance;
  late IFirestoreManager<ErrorModelCustom> networkManager;
  late String networkManagerConnectivity;

  static VexaFireManager get instance {
    return _instance ??= VexaFireManager._init();
  }

  VexaFireManager._init() {
    networkManager = _getManager();
  }

  FirestoreManager<ErrorModelCustom> _getManager() {
    return FirestoreManager<ErrorModelCustom>(
      errorModel: ErrorModelCustom(),
      isLoggerEnabled: kDebugMode ? true : false,
    );
  }
}
