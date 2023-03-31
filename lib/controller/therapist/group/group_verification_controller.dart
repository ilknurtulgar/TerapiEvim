import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';

class GroupVerificationController extends GetxController with BaseController {
  RxBool isLockedOpen = false.obs;
  RxBool isTherapistUploaded = true.obs;
  void changeIsTherapistLoaded() {
    isTherapistUploaded.value = !isTherapistUploaded.value;
  }

  void changeisLockedOpen() {
    isLockedOpen.value = !isLockedOpen.value;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //TODO: get verification boolean
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
}
