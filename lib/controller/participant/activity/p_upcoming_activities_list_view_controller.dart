import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../core/extension/context_extension.dart';
import '../../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../../core/managers/videosdk/video_sdk_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../screen/common/video_call/short_call/short_call_view.dart';
import '../../../service/_participant/activity/i_p_activity_service.dart';
import '../../../service/_participant/activity/p_activity_service.dart';
import '../../base/base_controller.dart';

class PUpComingActivitiesListViewController extends GetxController
    with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    activityService = PActivityService(vexaFireManager.networkManager);
    final List<TActivityModel> result =
        await activityService.getRecentActivitiesOrdered(isDescending: true);
    upComingActivities.addAll(result);
    super.onInit();
  }

  RxList<TActivityModel?> upComingActivities = <TActivityModel?>[].obs;

  late IPActivityService activityService;

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
      context.pushTrueRootNavigatorAndRemove(
        ShortCallView(
          videoCallToken: VideoCallTokenModel(
            meetingId: activity.meetingId!,
            token: videoSdkManager.token,
          ),
        ),
      );
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
