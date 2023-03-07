import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Color get randomColor => Colors.primaries[Random().nextInt(17)];

  Container get randomColorContainer =>
      Container(height: 20, width: double.infinity, color: randomColor);

  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  double get keyboardPadding => MediaQuery.of(this).viewInsets.bottom;

  Brightness get appBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this)
      .textScaleFactor; //TODO investigate this code and implement
}

//Check device operating system  with context value
extension DeviceOSExtension on BuildContext {
  bool get isAndroidDevice => Platform.isAndroid;

  bool get isIOSDevice => Platform.isIOS;
}

extension MediQueryExtension on BuildContext {

  double get height => mediaQuery.size.height;

  double get width => mediaQuery.size.width;

  double get lowValueHeight => height * 0.01;

  double get normalValueHeight => height * 0.02;

  double get mediumValueHeight => height * 0.04;

  double get highValueHeight => height * 0.1;

  double get lowValueWidth => width * 0.01;

  double get normalValueWidth => width * 0.02;

  double get mediumValueWidth => width * 0.06;

  double get highValueWidth => width * 0.1;

  double get highestValueWidth => width * 0.18;

  double get safeHeight =>
      height - mediaQuery.padding.bottom - mediaQuery.padding.top;

  double dynamicWidth(double val) => width * val;

  double dynamicHeight(double val) => height * val;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextTheme get primaryTextTheme => theme.primaryTextTheme;

  ColorScheme get colorScheme => theme.colorScheme;

}

extension NavigationExtension on BuildContext {
  NavigatorState get navigation => Navigator.of(this);

  NavigatorState get navigationTrueRoot =>
      Navigator.of(this, rootNavigator: true);

  Future<bool> pop() async {
    return await navigation.maybePop();
  }

  Future<T?> pushNamed<T>(String path, {Object? arguments}) async {
    return await navigation.pushNamed<T>(path, arguments: arguments);
  }

  Future<T?> push<T>(Widget widget) async {
    return await navigation
        .push<T>(MaterialPageRoute(builder: (context) => widget));
  }

  Future<T?> pushTrueRootNavigator<T>(Widget widget) async {
    return Navigator.of(this, rootNavigator: true).push(MaterialPageRoute(
      builder: (context) => widget,
    ));
  }

  Future<T?> pushTrueRootNavigatorAndRemove<T>(Widget widget) async {
    return Navigator.of(this, rootNavigator: true).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget, maintainState: false),
            (Route<dynamic> route) => false);
  }

  Future<T?> pushAndRemoveUntil<T>(
    Widget widget,
  ) async {
    return await navigation.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => widget, maintainState: false),
        (Route<dynamic> route) => false);
  }

  Future<T?> pushNamedToReset<T>(String path, {Object? arguments}) async {
    return await navigation.pushNamedAndRemoveUntil(path, (route) => false,
        arguments: arguments);
  }
}

//Device Screen Type By Width(300-600-900)
//Values from https://flutter.dev/docs/development/ui/layout/building-adaptive-apps
extension ContextDeviceTypeExtension on BuildContext {
  // bool get isSmallScreen =>
  //     width >= ResponsibilityConstants.instance.smallScreenSize &&
  //             width < ResponsibilityConstants.instance.mediumScreenSize
  //         ? true
  //         : false;
  //
  // bool get isMediumScreen =>
  //     width >= ResponsibilityConstants.instance.mediumScreenSize &&
  //             width < ResponsibilityConstants.instance.largeScreenSize
  //         ? true
  //         : false;
  //
  // bool get isLargeScreen =>
  //     width >= ResponsibilityConstants.instance.largeScreenSize ? true : false;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValueHeight);

  EdgeInsets get paddingNormal => EdgeInsets.all(normalValueHeight);

  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValueHeight);

  EdgeInsets get paddingHigh => EdgeInsets.all(highValueHeight);

  EdgeInsets get paddingMainHorizontal =>
      EdgeInsets.symmetric(horizontal: width * 0.06);

  EdgeInsets get paddingMainHorizontal2 =>
      EdgeInsets.symmetric(horizontal: width * 0.048);

  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: width * 0.04);

  EdgeInsets get paddingMainHorizontalLeft =>
      EdgeInsets.only(left: width * 0.06);

  EdgeInsets get paddingMainHorizontalRight =>
      EdgeInsets.only(right: width * 0.06);

  EdgeInsets get horizontalPaddingLow =>
      EdgeInsets.symmetric(horizontal: lowValueWidth);

  EdgeInsets get horizontalPaddingNormal =>
      EdgeInsets.symmetric(horizontal: normalValueWidth);

  EdgeInsets get horizontalPaddingMedium =>
      EdgeInsets.symmetric(horizontal: mediumValueWidth);

  EdgeInsets get horizontalPaddingHigh =>
      EdgeInsets.symmetric(horizontal: highValueWidth);

  EdgeInsets get horizontalPaddingHighest =>
      EdgeInsets.symmetric(horizontal: highestValueWidth);

  EdgeInsets get verticalPaddingLow =>
      EdgeInsets.symmetric(vertical: lowValueHeight);

  EdgeInsets get verticalPaddingNormal =>
      EdgeInsets.symmetric(vertical: normalValueHeight);

  EdgeInsets get verticalPaddingMedium =>
      EdgeInsets.symmetric(vertical: mediumValueHeight);

  EdgeInsets get verticalPaddingHigh =>
      EdgeInsets.symmetric(vertical: highValueHeight);

  EdgeInsets get onlyLeftPaddingLow => EdgeInsets.only(left: lowValueHeight);

  EdgeInsets get onlyLeftPaddingNormal =>
      EdgeInsets.only(left: normalValueHeight);

  EdgeInsets get onlyLeftPaddingMedium =>
      EdgeInsets.only(left: mediumValueHeight);

  EdgeInsets get onlyLeftPaddingHigh => EdgeInsets.only(left: highValueHeight);

  EdgeInsets get onlyRightPaddingLow => EdgeInsets.only(right: lowValueHeight);

  EdgeInsets get onlyRightPaddingNormal =>
      EdgeInsets.only(right: normalValueHeight);

  EdgeInsets get onlyRightPaddingMedium =>
      EdgeInsets.only(right: mediumValueHeight);

  EdgeInsets get onlyRightPaddingHigh =>
      EdgeInsets.only(right: highValueHeight);

  EdgeInsets get onlyBottomPaddingLow =>
      EdgeInsets.only(bottom: lowValueHeight);

  EdgeInsets get onlyBottomPaddingNormal =>
      EdgeInsets.only(bottom: normalValueHeight);

  EdgeInsets get onlyBottomPaddingMedium =>
      EdgeInsets.only(bottom: mediumValueHeight);

  EdgeInsets get onlyBottomPaddingHigh =>
      EdgeInsets.only(bottom: highValueHeight);

  EdgeInsets get onlyTopPaddingLow => EdgeInsets.only(top: lowValueHeight);

  EdgeInsets get onlyTopPaddingNormal =>
      EdgeInsets.only(top: normalValueHeight);

  EdgeInsets get onlyTopPaddingMedium =>
      EdgeInsets.only(top: mediumValueHeight);

  EdgeInsets get onlyTopPaddingHigh => EdgeInsets.only(top: highValueHeight);
}

extension DurationExtension on BuildContext {
  Duration get durationLowest => const Duration(milliseconds: 0);

  Duration get durationLow => const Duration(milliseconds: 0);

  Duration get durationNormal => const Duration(milliseconds: 0);

  Duration get durationSlow => const Duration(milliseconds: 0);

  Duration get durationSlowest => const Duration(milliseconds: 0);
}
