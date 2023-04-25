import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../base/base_controller_2.dart';
import '../therapist_controller.dart';

class TGroupViewController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  late TherapistController therapistController;
  @override
  void onInit() {
    therapistController = Get.find();
    isLockedOpen = therapistController.isTherapistConfirmed;
    super.onInit();
  }

  RxBool isLockedOpen = false.obs;
}
