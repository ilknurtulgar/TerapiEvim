import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/product/enum/local_keys_enum.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';
import 'package:terapievim/service/_participant/session/p_session_service.dart';

import '../../../model/therapist/session/t_session_model.dart';
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
    if (isTestSolved.value) {
      getShortCallInformation();
    }

    isTestResultReady = participantController.isTestResultReady;

    super.onInit();
  }

  RxString therapistName = "".obs;
  RxString shortCallTime = ''.obs;
  String sessionId = '';

  void getShortCallInformation() async {
    sessionId = participantController.pSessionId.value;
    PSessionService pSessionService =
        PSessionService(vexaFireManager.networkManager);
    TSessionModel? sessionModel = await pSessionService.getASession(sessionId);

    therapistName.value = sessionModel?.therapistName ?? "null";
    Timestamp? ts = sessionModel?.dateTime;
    if (ts.isNull) {
      shortCallTime.value = "null";
    } else {
      DateTime dt =
          DateTime.fromMillisecondsSinceEpoch(ts!.millisecondsSinceEpoch);
      shortCallTime.value = dt.day.toString() +
          "/" +
          dt.month.toString() +
          "/" +
          dt.year.toString() +
          "   " +
          dt.hour.toString() +
          "." +
          dt.minute.toString();
    }

    //buradan session bilgileri alinacak
    //burada therapistname ve short call time bilgileri girilmeli
  }

  RxBool isTestSolved = false.obs;
  RxBool isTestResultReady = false.obs;
  void lockScreenFinished() {
    //group id verilecek
    localManager.setStringValue(LocalManagerKeys.pJoinedGroupId, "groupId");
    participantController.joinedGroupId.value = "groupId";
    controllerContext.pushAndRemoveUntil(PMyGroupView());
  }
}
