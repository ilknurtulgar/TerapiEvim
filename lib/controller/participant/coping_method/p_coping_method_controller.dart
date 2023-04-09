import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';

class PCopingMethodsController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}
  RxString orderValue = "yeniden eskiye ".obs;
  var isBoxSelected = false.obs;

  void setIsBoxSelected() {
    isBoxSelected.value = !isBoxSelected.value;
  }
}
