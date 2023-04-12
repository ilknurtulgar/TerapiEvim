import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/component/toast/toast.dart';
import '../../../service/_therapist/activity/i_t_activity_service.dart';
import '../../../service/_therapist/activity/t_activity_service.dart';
import '../../base/base_controller.dart';

abstract class ITModifyActivityController extends GetxController
    with BaseController {
  @override
  void onInit() {
    activityNameController = TextEditingController();

    activityDescriptionController = TextEditingController();

    activityDateController = TextEditingController();

    activityTimeController = TextEditingController();

    activityService = TActivityService(vexaFireManager.networkManager);

    super.onInit();
  }

  @override
  void dispose() {
    activityNameController.dispose();
    activityDescriptionController.dispose();
    activityDateController.dispose();
    activityTimeController.dispose();
    super.dispose();
  }

  late final ITActivityService activityService;

  late final TextEditingController activityNameController;

  late final TextEditingController activityDescriptionController;

  late final TextEditingController activityDateController;

  late final TextEditingController activityTimeController;

  bool validateActivity() {
    if (activityNameController.text.trim().isEmpty) {
      flutterErrorToast("Event Name  is empty");
      return false;
    }
    if (activityDescriptionController.text.trim().isEmpty) {
      flutterErrorToast("Description is empty");
      return false;
    }
    if (activityDateController.text.trim().isEmpty) {
      flutterErrorToast("Date is empty");
      return false;
    }
    if (activityTimeController.text.trim().isEmpty) {
      flutterErrorToast("Time is empty");
      return false;
    }
    return true;
  }
}
