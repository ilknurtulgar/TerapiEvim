import 'package:flutter/foundation.dart';

class Print {
  static void debug(dynamic string) {
    if (kDebugMode) {
      print(string);
    }
  }

  static void buildView(String string) {
    if (kDebugMode) {
      print("View: $string");
    }
  }

  static void buildWidget(String string) {
    if (kDebugMode) {
      print("Widget: $string");
    }
  }

  static void initState(String string) {
    if (kDebugMode) {
      print("INIT STATE: $string");
    }
  }

  static void dispose(String string) {
    if (kDebugMode) {
      print("DISPOSE: $string");
    }
  }

  static void exception(Object string) {
    if (kDebugMode) {
      print(string);
    }
  }
}

class PrintDev {
  static PrintDev? _instance;

  static PrintDev get instance {
    return _instance ??= PrintDev._init();
  }

  PrintDev._init();

  void debug(dynamic string) {

    if (kDebugMode) {
      print(string);
    }
  }

  void buildView(String string) {

    if (kDebugMode) {
      print("View: $string");
    }
  }

  void buildWidget(String string) {

    if (kDebugMode) {
      print("Widget: $string");
    }
  }

  void initState(String string) {

    if (kDebugMode) {
      // flutterDebugToast("INIT STATE: $string");
      print("INIT STATE: $string");
    }
  }

  void dispose(String string) {

    if (kDebugMode) {
      // flutterInfoToast("DISPOSE: $string");
      print("DISPOSE: $string");
    }
  }

  void exception(Object string) {
    if (kDebugMode) {
      print(string);
    }
  }
}
