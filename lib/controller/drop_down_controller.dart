import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

abstract class DropDownController extends GetxController with BaseController {
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
