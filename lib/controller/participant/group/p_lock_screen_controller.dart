import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/extension/context_extension.dart';
import 'package:terapievim/product/enum/local_keys_enum.dart';
import 'package:terapievim/screen/participant/group/p_my_group_view.dart';
import 'package:terapievim/service/_participant/session/p_session_service.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../../core/managers/videosdk/video_sdk_manager.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../model/therapist/session/t_session_model.dart';
import '../../../screen/common/video_call/group_call/group_call_view.dart';
import '../../../service/_participant/session/i_p_session_service.dart';
import '../../base/base_controller_2.dart';
import '../participant_controller.dart';

class PLockScreenController extends BaseController2 {
  @override
  void setContext(BuildContext context) => controllerContext = context;

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

  late ParticipantController participantController;

  late IPSessionService pSessionService;

  RxString therapistName = "".obs;

  RxString shortCallTime = ''.obs;

  String sessionId = '';

  RxBool isTestSolved = false.obs;

  RxBool isTestResultReady = false.obs;

  void getShortCallInformation() async {
    sessionId = participantController.pSessionId.value;

    pSessionService = PSessionService(vexaFireManager.networkManager);

    TSessionModel? sessionModel = await pSessionService.getASession(sessionId);

    therapistName.value = sessionModel?.therapistName ?? "null";

    Timestamp? ts = sessionModel?.dateTime;
    if (ts == null) {
      shortCallTime.value = "null";
    } else {
      DateTime dt =
          DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);
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

  void lockScreenFinished() {
    //group id verilecek
    localManager.setStringValue(LocalManagerKeys.pJoinedGroupId, "groupId");
    participantController.joinedGroupId.value = "groupId";
    controllerContext.pushAndRemoveUntil(PMyGroupView());
  }

  Future<void> onShortCallPressed() async {
    try {
      final IVideoSdkManager videoSdkManager = VideoSdkManager();

      final TSessionModel? session =
          await pSessionService.getASession(sessionId);

      await pSessionService.updateIsSessionComplete();

      if (session?.meetingId == null) return;
      if (session!.meetingId!.isEmpty) {
        flutterInfoToast("Activity is not started");
        return;
      }

      controllerContext.pushTrueRootNavigatorAndRemove(
        GroupCallView(
          videoCallToken: VideoCallTokenModel(
            meetingId: session.meetingId!,
            token: videoSdkManager.token,
            participantId: userId!,
            isTherapist: false,
          ),
        ),
      );
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error onShortCallPressed',
      );
      rethrow;
    }
  }
}
