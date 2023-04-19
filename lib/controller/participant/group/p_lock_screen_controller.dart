import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../base/base_controller_2.dart';
import '../participant_controller.dart';

class PLockScreenController extends BaseController2 {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void onInit() {
    ParticipantController participantController = Get.find();

    isTestSolved = participantController.isScl90Submitted;

    isTestResultReady = participantController.isTestResultReady;

    super.onInit();
  }

  RxBool isTestSolved = true.obs;

  RxBool isTestResultReady = true.obs;

  void testSolved() {
    isTestSolved.value = false;
  }
}
