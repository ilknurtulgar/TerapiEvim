import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../../core/managers/videosdk/video_sdk_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../screen/common/video_call/group_call/group_call_view.dart';
import '../../../service/_therapist/activity/t_activity_service.dart';
import '../../base/base_controller_2.dart';

class TMyUpComingListViewController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    tActivityService = TActivityService(vexaFireManager.networkManager);
    List<TActivityModel?> upcComingList =
        await tActivityService.getMyRecentActivitiesOrdered();
    fetchedActivity.addAll(upcComingList);
    super.onInit();
  }

  late TActivityService tActivityService;
  RxList<TActivityModel?> fetchedActivity = <TActivityModel?>[].obs;

  Future<void> createMeeting({
    required BuildContext context,
    required TActivityModel? activity,
  }) async {
    try {
      final IVideoSdkManager videoSdkManager = VideoSdkManager();

      final NavigatorState navigator =
          Navigator.of(context, rootNavigator: true);

      if (activity?.id == null) {
        throw Exception('activity?.id is null');
      }

      final String? meetingId = await videoSdkManager.createMeeting();
      if (meetingId == null) {
        throw Exception('Received meeting Id is null');
      }
      activity!.meetingId = meetingId;
      activity.isStarted = true;

      final String? isError = await tActivityService.updateActivity(activity);
      if (isError != null) {
        flutterErrorToast("An error occurred");
        return;
      }

      VideoCallTokenModel token = VideoCallTokenModel(
        meetingId: activity.meetingId!,
        token: videoSdkManager.token,
        participantId: userId!,
        isTherapist: true,
        isMainTherapist: true,
      );

      // navigationManager.pushAndRemoveUntil(navigator, GroupTherapyCallView());
      navigationManager.pushAndRemoveUntil(
          navigator,
          GroupCallView(
            videoCallToken: token,
          ));
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error t_activity_controller/createMeeting',
      );
    }
  }
}
