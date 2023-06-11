import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../core/constants/app_const.dart';
import '../../../core/managers/videosdk/i_video_sdk_manager.dart';
import '../../../core/managers/videosdk/video_sdk_manager.dart';
import '../../../model/common/activity/t_activity_model.dart';
import '../../../model/common/video_call/video_call_token_model.dart';
import '../../../screen/common/video_call/group_call/group_call_view.dart';
import '../../../service/_therapist/activity/i_t_activity_service.dart';
import '../../../service/_therapist/activity/t_activity_service.dart';
import '../../base/base_controller.dart';

class TActivityController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    activityService = TActivityService(vexaFireManager.networkManager);

    TActivityModel? recentActivity =
        await activityService.getMyRecentActivity();
    TActivityModel? myPastActivity =
        await activityService.getMyPastRecentActivity();
    TActivityModel? otherActivity =
        await activityService.getOtherRecentActivity();
    if (myPastActivitieslist.isNotEmpty) {
      myPastActivitieslist.add(myPastActivity);
    }
    if (recentActivity != null) {
      myRecentActivities.add(recentActivity);
    }

    if (otherActivity != null) {
      otherActivitieslist.add(otherActivity);
    }

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    activitynamController.dispose();
    activitydateController.dispose();
    activitydescriptionController.dispose();
    activitytimeController.dispose();
  }

  var isUpdate = false.obs;

  final TextEditingController activitynamController = TextEditingController();

  final TextEditingController activitydescriptionController =
      TextEditingController();

  final TextEditingController activitydateController = TextEditingController();

  final TextEditingController activitytimeController = TextEditingController();

  late ITActivityService activityService;

  RxList<TActivityModel?> myRecentActivities = <TActivityModel?>[].obs;
  RxList<TActivityModel?> myPastActivitieslist = <TActivityModel?>[].obs;
  RxList<TActivityModel?> otherActivitieslist = <TActivityModel?>[].obs;

  void isActivityUpdate(int index) {
    if (index == 0) {
      isUpdate.value = true;
    }
    if (index == 1) {
      isUpdate.value = false;
    }
    //s isUpdate.value = !isUpdate.value;
  }

  Future<TActivityModel?> getRecentActivity() async {
    final TActivityModel? result = await activityService.getMyRecentActivity();
    return result;
  }

  Future<List<TActivityModel?>?> getMyRecentActivities(
      {String lastDocId = ''}) async {
    final List<TActivityModel?> result =
        await activityService.getMyRecentActivitiesOrdered(
      lastDocId: lastDocId,
      isDescending: true,
      orderField: AppConst.dateTime,
    );
    return result;
  }

  Future<void> createMeeting({
    required BuildContext context,
    required TActivityModel? activity,
    required bool isMainTherapist,
  }) async {
    // bool isActive = false;
    // if (isActive == false) {
    //   return;
    // }

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

      final String? isError = await activityService.updateActivity(activity);
      if (isError != null) {
        //TODO extract error string
        flutterErrorToast("An error occurred");
        return;
      }

      VideoCallTokenModel token = VideoCallTokenModel(
        meetingId: activity.meetingId!,
        token: videoSdkManager.token,
        isTherapist: true,
        participantId: userId!,
        isMainTherapist: isMainTherapist,
      );

      navigationManager.pushAndRemoveUntil(
          navigator, GroupCallView(videoCallToken: token));
    } catch (e) {
      await crashlyticsManager.sendACrash(
        error: e.toString(),
        stackTrace: StackTrace.current,
        reason: 'Error t_activity_controller/createMeeting',
      );
    }
  }

  RxBool isMine = false.obs;

  void chnangeMine(int index) {
    if (index == 1) {
      isMine.value = false;
    }
    if (index == 0) {
      //evet aktivitelerim
      isMine.value = true;
    }
  }
}
