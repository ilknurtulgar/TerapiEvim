import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


Future<bool?> flutterDarkToast(String msg) {
  return _flutterToast(msg: msg, backgroundColor: Colors.black54);
}

Future<bool?> flutterErrorToast(String msg) {
  return _flutterToast(
      msg: msg,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}

Future<bool?> flutterWarningToast(String msg) {
  return _flutterToast(
    msg: msg,
    // backgroundColor: ColorConst.warningDark,
    length: Toast.LENGTH_LONG,
  );
}

Future<bool?> flutterInfoToast(String msg) {
  return _flutterToast(
    msg: msg,
    // backgroundColor: ColorConst.infoDark,
  );
}

Future<bool?> flutterDebugToast(String msg) {
  return _flutterToast(
    msg: msg,
    // backgroundColor: ColorConst.infoDark,
  );
}

Future<bool?> flutterSuccessToast(String msg) {
  return _flutterToast(msg: msg
      // backgroundColor: ColorConst.successDark,
      );
}

Future<bool?> _flutterToast({
  required String msg,
  Color? backgroundColor,
  Color? textColor,
  double? fontSize,
  Toast? length,
}) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: backgroundColor ?? Colors.black54,
      textColor: textColor ?? Colors.white,
      fontSize: fontSize ?? 12.0,
      // webBgColor: Colors.black45,
      webPosition: "center",
      timeInSecForIosWeb: 2);
}
