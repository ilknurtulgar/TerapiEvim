import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/base/component/toast/toast.dart';
import '../core/constants/app_const.dart';
import '../core/init/navigation/navigation_manager.dart';
import '../core/managers/videosdk/i_video_sdk_manager.dart';
import '../core/managers/videosdk/video_sdk_manager.dart';
import '../product/enum/local_keys_enum.dart';
import '../screen/therapist/t_video_call/t_group_call/t_group_call_view.dart';
import '../service/model/common/activity/t_activity_model.dart';
import '../service/service/_therapist/activity/i_t_activity_service.dart';
import '../service/service/_therapist/activity/t_activity_service.dart';
import 'base/base_controller.dart';

class TherapistActivityController extends GetxController with BaseController {

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    activityService = TActivityService(vexaFireManager.networkManager);

    TActivityModel? recentActivity = await activityService.getRecentActivity();

    recentActivities.add(recentActivity);

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

  RxList<TActivityModel?> recentActivities = <TActivityModel?>[].obs;


  void updatechnage(int index) {
    if (index == 0) {
      isUpdate.value = true;
    }
    if (index == 1) {
      isUpdate.value = false;
    }
    //s isUpdate.value = !isUpdate.value;
  }

  Future<bool> createActivity(BuildContext context) async {
    final bool isValidated = _validateActivity();

    if (isValidated == false) return false;

    final TActivityModel activity = TActivityModel(
      title: activitynamController.text.trim(),
      description: activitydescriptionController.text.trim(),
      dateTime: Timestamp.fromDate(DateTime.now()),
      therapistName: localManager.getStringValue(LocalManagerKeys.name),
      participantsId: [],
      isFinished: false,
      isStarted: false,
      recordUrl: '',
      meetingId: '',
    );

    final NavigatorState navigator = Navigator.of(context);

    final result = await activityService.createActivity(activity);

    if (result == null) {
      ///TODO add error handler
      return false;
    }
    navigationManager.maybePop(navigator);
    return true;
  }

  Future<bool> updateActivity(BuildContext context) async {
    final bool isValidated = _validateActivity();

    if (isValidated == false) return false;

    final TActivityModel activity = TActivityModel(
      title: activitynamController.text.trim(),
      description: activitydescriptionController.text.trim(),
      dateTime: Timestamp.fromDate(DateTime.now()),

      // participantsId: [],
      isFinished: false,
      isStarted: false,
      recordUrl: '',
      meetingId: '',
    );
    final NavigatorState navigator = Navigator.of(context);

    final result = await activityService.updateActivity(activity);

    if (result == null) {
      ///TODO add error handler
      return false;
    }
    navigationManager.maybePop(navigator);
    return true;
  }

  Future<TActivityModel?> getRecentActivity() async {
    final TActivityModel? result = await activityService.getRecentActivity();
    return result;
  }

  Future<List<TActivityModel?>?> getMyActivities(
      {String lastDocId = ''}) async {
    final List<TActivityModel?>? result =
        await activityService.getMyActivitiesOrdered(
      lastDocId: lastDocId,
      isDescending: true,
      orderField: AppConst.dateTime,
    );
    return result;
  }

  bool _validateActivity() {
    if (activitynamController.text.trim().isEmpty) {
      flutterErrorToast("Event Name  is empty");
      return false;
    }
    if (activitydescriptionController.text.trim().isEmpty) {
      flutterErrorToast("Description is empty");
      return false;
    }
    if (activitydateController.text.trim().isEmpty) {
      flutterErrorToast("Date is empty");
      return false;
    }
    if (activitytimeController.text.trim().isEmpty) {
      flutterErrorToast("Time is empty");
      return false;
    }
    return true;
  }

  Future<void> createMeeting({
    required BuildContext context,
    required TActivityModel? activity,
  }) async {
    // bool isActive = false;
    // if (isActive == false) {
    //   return;
    // }

    try {
      final IVideoSdkManager videoSdkManager = VideoSdkManager();

      final NavigatorState navigator =
          Navigator.of(context, rootNavigator: true);
      final NavigationManager navigationManager = NavigationManager.instance;

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

      navigationManager.pushAndRemoveUntil(
          navigator,
          TGroupCallView(
            meetingId: meetingId,
            token: videoSdkManager.token,
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
