import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_controller.dart';

class TGroupVerificationController extends GetxController with BaseController {
  RxBool isTherapistUploaded = true.obs;
  void changeIsTherapistLoaded() {
    isTherapistUploaded.value = !isTherapistUploaded.value;
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
