import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../../product/enum/local_keys_enum.dart';
import 'i_t_modify_activity_controller.dart';

class TNewActivityViewController extends ITModifyActivityController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void setContext(BuildContext context) => controllerContext = context;

  Future<bool> createActivity() async {
    final bool isValidated = validateActivity();

    if (isValidated == false) return false;

    final TActivityModel activity = TActivityModel(
      title: activityNameController.text.trim(),
      description: activityDescriptionController.text.trim(),
      dateTime: Timestamp.fromDate(DateTime.now()),
      therapistName: localManager.getStringValue(LocalManagerKeys.name),
      participantsId: [],
      isFinished: false,
      isStarted: false,
      recordUrl: '',
      meetingId: '',
    );

    final NavigatorState navigator = Navigator.of(controllerContext);

    final result = await activityService.createActivity(activity);

    if (result == null) {
      ///TODO add error handler
      return false;
    }
    navigationManager.maybePop(navigator);
    return true;
  }
}
