import 'package:flutter/material.dart';

import 'i_navigation_manager.dart';

class NavigationManager extends INavigationManager {
  static NavigationManager? _instance;

  static NavigationManager get instance {
    return _instance ??= NavigationManager._init();
  }

  NavigationManager._init();

  @override
  Future<void> push(NavigatorState navigator, Widget widget) async {
    await navigator.push(MaterialPageRoute(
        builder: (BuildContext context) => widget, maintainState: false));
  }

  @override
  Future<void> pushAndRemoveUntil(
      NavigatorState navigator, Widget widget) async {
    await navigator.pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (BuildContext context) => widget, maintainState: false),
        (route) => false);
  }

  @override
  Future<void> pushReplacement(NavigatorState navigator, Widget widget) async {
    await navigator.pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => widget, maintainState: false));
  }

  @override
  Future<void> maybePop(NavigatorState navigator) async {
    await navigator.maybePop();
  }

  @override
  void pop([bool? value]) {
    // TODO: implement pop
  }
}
