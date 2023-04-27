import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/profile/p_public_profile_model.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../core/managers/converter/date_time_manager.dart';
import '../../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../../core/managers/videosdk/video_sdk_manager.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../model/therapist/group/t_group_session_model.dart';
import '../../../screen/common/video_call/group_call/group_call_view.dart';
import '../../../screen/common/video_call/isolated_call/isolated_call_view.dart';
import '../../../service/_therapist/group/i_t_group_service.dart';
import '../../../service/_therapist/group/t_group_service.dart';
import '../../base/base_controller.dart';

class TGroupInformationController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    controllerContext = context;
  }
  @override
  void onInit() {
    tGroupService = TGroupService(vexaFireManager.networkManager);

    ///TODO: tGroupService.getParticipantsList
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setCurrentGroup(TGroupModel? group) {
    currentGroup = group;
    getMeetingInformation();
    getParticipants();

  }

  late final ITGroupService tGroupService;

  TGroupModel? currentGroup;

  TGroupSessionModel? recentSession;

  RxString helperTherapistName = ''.obs;

  RxString meetingTime = ''.obs;



   RxList<PPublicProfile> participants = <PPublicProfile>[].obs;

  void getParticipants() async {
    participants.value = await tGroupService.getParticipantsList(
        participantsId: currentGroup?.participantsId ?? <String>[]);
  }

  Future<void> onGroupSessionStarted() async {
    try {
      final IVideoSdkManager videoSdkManager = VideoSdkManager();
      final NavigatorState navigator =
          Navigator.of(controllerContext, rootNavigator: true);
      if (currentGroup?.id == null) {
        throw Exception('currentGroupModel is null');
      }

      /// If it is therapist helper
      if (recentSession!.therapistId != userId) {
        VideoCallTokenModel token = VideoCallTokenModel(
          meetingId: recentSession!.meetingId!,
          token: videoSdkManager.token,
          isTherapist: true,
          participantId: userId!,
          isMainTherapist: false,
        );

        navigationManager.pushAndRemoveUntil(
            navigator, GroupCallView(videoCallToken: token));

        return;
      }

      final String? meetingId = await videoSdkManager.createMeeting();

      if (meetingId == null) {
        throw Exception('Received meeting Id is null');
      }

      if (recentSession == null) {
        throw Exception('recentSession is null');
      }

      recentSession!.meetingId = meetingId;

      final bool isSuccess =
          await tGroupService.updateGroupSession(recentSession!);

      if (isSuccess == false) {
        flutterErrorToast("An error occurred");
        return;
      }

      VideoCallTokenModel token = VideoCallTokenModel(
        meetingId: meetingId,
        token: videoSdkManager.token,
        isTherapist: true,
        participantId: userId!,
        isMainTherapist: true,
      );

      navigationManager.pushAndRemoveUntil(
          navigator, GroupCallView(videoCallToken: token));
    } catch (e) {
      flutterErrorToast(e.toString());
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'onGroupSessionStarted t_group_information_controller',
      );
    }
  }

  Future<void> startIsolatedCall() async {
    try {
      final IVideoSdkManager videoSdkManager = VideoSdkManager();
      final NavigatorState navigator =
          Navigator.of(controllerContext, rootNavigator: true);
      if (currentGroup?.id == null) {
        throw Exception('currentGroupModel is null');
      }

      final String? meetingId = await videoSdkManager.createMeeting();

      if (meetingId == null) {
        throw Exception('Received meeting Id is null');
      }

      final bool isSuccess = await tGroupService.createIsolatedCall(meetingId);

      if (isSuccess == false) {
        flutterErrorToast("An error occurred");
        return;
      }

      VideoCallTokenModel token = VideoCallTokenModel(
        meetingId: meetingId,
        token: videoSdkManager.token,
        isTherapist: true,
        participantId: userId!,
        isMainTherapist: true,
      );

      navigationManager.pushAndRemoveUntil(
          navigator, IsolatedCallView(videoCallToken: token));
    } catch (e) {
      flutterErrorToast(e.toString());
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'onGroupSessionStarted t_group_information_controller',
      );
    }
  }

  Future<void> getMeetingInformation() async {
    recentSession =
        await tGroupService.getRecentGroupSession(currentGroup?.id ?? "null");

    helperTherapistName.value = recentSession?.therapistHelperName ?? "null";

    Timestamp? ts = recentSession?.dateTime;

    if (ts == null) {
      meetingTime.value = "null";
    } else {
      DateTime dt =
          DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);

      meetingTime.value = DateTimeManager.getFormattedDateFromFormattedString(
          value: dt.toIso8601String());
      // meetingTime.value = dt.day.toString() +
      //     "/" +
      //     dt.month.toString() +
      //     "/" +
      //     dt.year.toString() +
      //     "   " +
      //     dt.hour.toString() +
      //     "." +
      //     dt.minute.toString();
    }
  }

  void deleteGroup() {
    currentGroup!.id = '';
    NavigatorState navigator = Navigator.of(controllerContext);
    navigator.pop();
  }

  //grup eklmee kismi icin controller
  var isParticipantElectionOpen = false.obs;

  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
  }
}
