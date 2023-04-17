import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_controller_2.dart';
import '../therapist_controller.dart';

class TLockScreenController extends BaseController2 {
  @override
  void setContext(BuildContext context) {}

  @override
  void onInit() {
    therapistController = Get.find();

    isConfirmed = therapistController.isTherapistConfirmed;

    isUploaded = therapistController.isDiplomaUploaded;

    super.onInit();
  }

  late TherapistController therapistController;

  RxBool isConfirmed = false.obs;

  RxBool isUploaded = false.obs;
}
