import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/common/activity/t_activity_model.dart';
import 'i_t_modify_activity_controller.dart';

class TUpdateActivityViewController extends ITModifyActivityController {
  @override
  void setContext(BuildContext context) => controllerContext = context;

  @override
  void onInit() {
    super.onInit();
  }

  void setActivity(TActivityModel activity) {
    _activity = activity;
    activityNameController.text = _activity!.title ?? '';

    activityDescriptionController.text = _activity!.description ?? '';

    activityDateController.text = _activity!.dateTime.toString();

    activityTimeController.text = _activity!.dateTime.toString();
  }

  TActivityModel? _activity;

  final Rx<Timestamp>? dateTime = Timestamp.fromDate(DateTime.now()).obs;

  Future<bool> updateActivity() async {
    final bool isValidated = validateActivity();

    if (isValidated == false) return false;

    final TActivityModel activity = TActivityModel(
      title: activityNameController.text.trim(),
      description: activityDescriptionController.text.trim(),
      dateTime: dateTime?.value,
      // participantsId: [],
      isFinished: false,
      isStarted: false,
      recordUrl: '',
      meetingId: '',
    );
    final NavigatorState navigator = Navigator.of(controllerContext);

    final result = await activityService.updateActivity(activity);

    if (result == null) {
      ///TODO add error handler
      return false;
    }
    navigationManager.maybePop(navigator);
    return true;
  }
}
