import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/base/component/toast/toast.dart';
import '../core/constants/app_const.dart';
import '../service/model/therapist/activity/t_activity_model.dart';
import '../service/service/_therapist/activity/activity_service.dart';
import '../service/service/_therapist/activity/i_activity_service.dart';
import 'base/base_controller.dart';

class TherapistActivtyController extends GetxController with BaseController {
  var isUpdate = false.obs;

  final TextEditingController activitynamController = TextEditingController();

  final TextEditingController activitydescriptionController =
      TextEditingController();

  final TextEditingController activitydateController = TextEditingController();

  final TextEditingController activitytimeController = TextEditingController();

  late IActivityService activityService;

  RxList<TActivityModel?> recentActivities = <TActivityModel?>[].obs;

  @override
  Future<void> onInit() async {
    activityService = ActivityService(vexaFireManager.networkManager);

    TActivityModel? recentActivity = await activityService.getRecentActivity();

    recentActivities.add(await activityService.getRecentActivity());

    print('recentActivity:${recentActivity?.toJson()}');

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    activitynamController.dispose();
    activitydateController.dispose();
    activitydescriptionController.dispose();
    activitytimeController.dispose();
  }

  void updatechnage(int index) {
    if (index == 0) {
      isUpdate.value = true;
    }
    if (index == 1) {
      isUpdate.value = false;
    }
    //s isUpdate.value = !isUpdate.value;
  }

  Future<bool> createActivity() async {
    final bool isValidated = _validateActivity();

    if (isValidated == false) return false;

    final TActivityModel activity = TActivityModel(
      title: activitynamController.text.trim(),
      description: activitydescriptionController.text.trim(),
      dateTime: Timestamp.fromDate(DateTime.now()),
      participantsId: [],
      isFinished: false,
      isStarted: false,
      recordUrl: '',
      roomId: '',
    );

    final result = await activityService.createActivity(activity);

    if (result == null) {
      ///TODO add error handler
      return false;
    }
    return true;
  }

  Future<bool> updateActivity() async {
    final bool isValidated = _validateActivity();

    if (isValidated) return false;
    final TActivityModel activity = TActivityModel(
      title: activitynamController.text.trim(),
      description: activitydescriptionController.text.trim(),
      dateTime: Timestamp.fromDate(DateTime.now()),
      // participantsId: [],
      isFinished: false,
      isStarted: false,
      recordUrl: '',
      roomId: '',
    );

    final result = await activityService.updateActivity(activity);

    if (result == null) {
      ///TODO add error handler
      return false;
    }
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
}
