import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/component/toast/toast.dart';
import '../../../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../../../core/managers/videosdk/video_sdk_manager.dart';
import '../../../../model/common/video_call/video_call_token_model.dart';
import '../../../../model/therapist/session/t_session_model.dart';
import '../../../../screen/common/video_call/short_call/short_call_view.dart';
import '../../../../service/_therapist/session/t_session_service.dart';
import '../../../drop_down_controller.dart';

class TSessionController extends DropDownController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  Future<void> onInit() async {
    tSessionService = TSessionService(vexaFireManager.networkManager);
    List<TSessionModel?> sessions = await tSessionService.getSessionsOrdered();
    fetchedSession.addAll(sessions);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> joinShortCall(TSessionModel? session) async {
    if (session == null) {
      flutterErrorToast('session is null');
      return;
    }

    final NavigatorState navigator =
        Navigator.of(controllerContext, rootNavigator: true);

    final IVideoSdkManager videoSdkManager = VideoSdkManager();

    final String? meetingId = await videoSdkManager.createMeeting();

    if (meetingId == null) {
      flutterErrorToast('Could not create a meeting');
      return;
    }

    session.meetingId = meetingId;
    final result = await tSessionService.updateSession(session);
    final VideoCallTokenModel token = VideoCallTokenModel(
      meetingId: meetingId,
      token: videoSdkManager.token,
      isTherapist: true,
      participantId: userId!,
      isMainTherapist: true,
    );

    navigationManager.pushAndRemoveUntil(
        navigator, ShortCallView(videoCallToken: token));
  }

  late TSessionService tSessionService;

  RxList<TSessionModel?> fetchedSession = <TSessionModel?>[].obs;
}
