import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

class THomeViewController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  void onInit() {
    textEditingController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  late final TextEditingController textEditingController;
}
