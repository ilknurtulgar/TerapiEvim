import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/base/component/toast/toast.dart';
import '../../core/extension/context_extension.dart';
import '../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../core/managers/videosdk/video_sdk_manager.dart';
import '../../screen/therapist/t_video_call/t_group_call/t_group_call_view.dart';
import '../../service/model/common/activity/t_activity_model.dart';
import '../../service/service/_participant/activity/i_p_activity_service.dart';
import '../../service/service/_participant/activity/p_activity_service.dart';
import '../base/base_controller.dart';

class PActivityController extends GetxController with BaseController {
  late IPActivityService activityService;

  RxList<TActivityModel?> recentActivities = <TActivityModel?>[].obs;

  RxList<TActivityModel?> pastActivities = <TActivityModel?>[].obs;

  @override
  Future<void> onInit() async {
    activityService = PActivityService(vexaFireManager.networkManager);

    await fetchRecentActivities();
    await fetchPastActivities();

    super.onInit();
  }

  @override
  void dispose() {
    recentActivities.clear();
    pastActivities.clear();
    super.dispose();
  }

  Future<void> fetchRecentActivities() async {
    List<TActivityModel?> fetchedActivities =
        await activityService.getRecentActivities();

    recentActivities.addAll(fetchedActivities);

    return;
  }

  Future<void> fetchPastActivities() async {
    List<TActivityModel?> fetchedActivities =
        await activityService.getRecentActivities();

    pastActivities.addAll(fetchedActivities);

    return;
  }

  Future<void> joinActivity(
    BuildContext context,
    TActivityModel activity,
  ) async {
    try {
      final IVideoSdkManager videoSdkManager = VideoSdkManager();

      if (activity.meetingId == null) return;
      if (activity.meetingId!.isEmpty) {
        flutterInfoToast("Activity is not started");
        // context.pushAndRemoveUntil(TGroupCallView(
        //   meetingId: activity.meetingId!,
        //   token: videoSdkManager.token,
        // ));
        return;
      }
      context.pushTrueRootNavigatorAndRemove(TGroupCallView(
        meetingId: activity.meetingId!,
        token: videoSdkManager.token,
      ));
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error joinActivity',
      );
      rethrow;
    }
  }
}
