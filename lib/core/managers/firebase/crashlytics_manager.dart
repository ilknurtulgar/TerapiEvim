import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import '../../base/component/toast/toast.dart';
import '../../init/print_dev.dart';

class CrashlyticsManager {
  static CrashlyticsManager? _instance;

  static CrashlyticsManager get instance {
    return _instance ??= CrashlyticsManager._init();
  }

  CrashlyticsManager._init();

  Future<void> sendACrash({
    required dynamic error,
    String? statusCode,
    required StackTrace stackTrace,
    required String reason,
    bool isFatal = false,
  }) async {
    if (kReleaseMode) {
      await FirebaseCrashlytics.instance
          .recordError(error, stackTrace, reason: reason, fatal: isFatal);
    } else if (kDebugMode) {
      flutterInfoToast(reason);
      Print.exception(
          '________________________________ERROR________________________________');
      Print.exception('response.error:\n$error');
      Print.exception('reason:$reason');
      flutterErrorToast("DEBUG: ${error.toString()}");
      Print.exception(
          '||______________________________ERROR______________________________||');
    }
    return;
  }
}
