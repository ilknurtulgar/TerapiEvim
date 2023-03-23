import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/service/model/therapist/activity/activity_model.dart';

import '../core/base/component/toast/toast.dart';
import '../service/service/_therapist/activity/activity_service.dart';
import '../service/service/_therapist/activity/i_activity_service.dart';
import 'base/base_controller.dart';

class TherapistActivtyController extends GetxController with BaseController {
  @override
  void onInit() {
    activityService = ActivityService(vexaFireManager.networkManager);

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

  Future<bool> updateActivity() async {
    ///TODO: model should be validated
    final result = await activityService.updateActivity(ActivityModel(
      // date: activitydateController.text.trim(),
      description: activitydescriptionController.text.trim(),
      // hour: activitytimeController.text.trim(),
      title: activitynamController.text.trim(),
    ));

    if (result == null) {
      ///TODO add error handler
      return false;
    }
    return true;
  }

  Future<bool> createActivity() async {
    final result = await activityService.createActivity(ActivityModel(
      // date: activitydateController.text.trim(),
      description: activitydescriptionController.text.trim(),
      // hour: activitytimeController.text.trim(),
      title: activitynamController.text.trim(),
    ));

    if (result == null) {
      ///TODO add error handler
      return false;
    }
    return true;
  }

  final TextEditingController activitynamController = TextEditingController();
  final TextEditingController activitydescriptionController =
      TextEditingController();
  final TextEditingController activitydateController = TextEditingController();
  final TextEditingController activitytimeController = TextEditingController();

  late IActivityService activityService;

  Future<void> activtiyAdd() async {
    final isValidted = _validateAddActivity();
    if (isValidted == false) {
      return;
    }
  }

  bool _validateAddActivity() {
    if (activitynamController.text.trim().isEmpty) {
      flutterErrorToast("EVent Name  is empty");
      return false;
    }
    if (activitydescriptionController.text.trim().isEmpty) {
      flutterErrorToast("Event About is empty");
    }
    if (activitydateController.text.trim().isEmpty) {
      flutterErrorToast("History is empty");
    }
    if (activitytimeController.text.trim().isEmpty) {
      flutterErrorToast(" Time is empty");
    }
    return true;
  }

  var isUpdate = false.obs;

  void updatechnage(int index) {
    if (index == 0) {
      isUpdate.value = true;
    }
    if (index == 1) {
      isUpdate.value = false;
    }
    //s isUpdate.value = !isUpdate.value;
  }
}
