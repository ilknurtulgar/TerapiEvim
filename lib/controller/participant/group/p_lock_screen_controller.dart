import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/product/enum/local_keys_enum.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';

import '../../base/base_controller_2.dart';
import '../participant_controller.dart';

class PLockScreenController extends BaseController2 {
  @override
  void setContext(BuildContext context) => controllerContext = context;
  late ParticipantController participantController;
  @override
  void onInit() {
     participantController = Get.find();

    isTestSolved = participantController.isScl90Submitted;

    isTestResultReady = participantController.isTestResultReady;

    super.onInit();
  }

  RxBool isTestSolved = true.obs;

  RxBool isTestResultReady = true.obs;
  void lockScreenFinished(){
    //group id verilecek
    localManager.setStringValue(LocalManagerKeys.pJoinedGroupId, "groupId");
    participantController.joinedGroupId.value="groupId";
    controllerContext.pushAndRemoveUntil(PMyGroupView());
  }


}
