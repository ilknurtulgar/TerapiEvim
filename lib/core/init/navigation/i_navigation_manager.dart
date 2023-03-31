import 'package:flutter/material.dart';

abstract class INavigationManager {
  void pop([bool? value]);

  Future<void> push(NavigatorState navigator, Widget widget);

  Future<void> maybePop(NavigatorState navigator);

  Future<void> pushAndRemoveUntil(NavigatorState navigator, Widget widget);

  Future<void> pushReplacement(NavigatorState navigator, Widget widget);

}
