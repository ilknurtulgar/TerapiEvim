import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base/base_controller.dart';

class TSessionController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  void onInit() {
    sortController.text = orderValue.value;
    super.onInit();
  }

  @override
  void dispose() {
    sortController.dispose();
    super.dispose();
  }

  final TextEditingController sortController = TextEditingController();
  RxString orderValue = "yeniden eskiye ".obs;

  var isBoxSelected = false.obs;

  void setIsBoxSelected() {
    isBoxSelected.value = !isBoxSelected.value;
  }
}
