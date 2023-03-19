import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/product/enum/local_keys_enum.dart';
import 'package:terapievim/service/model/therapist/activity/activity_model.dart';

import '../service/service/_therapist/activity/activity_service.dart';
import '../service/service/_therapist/activity/i_activity_service.dart';
import 'base/base_controller.dart';

class TherapistActivtyController extends GetxController with BaseController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final String userId = localManager.getStringValue(LocalManagerKeys.userId);
    activityService = ActivityService(vexaFireManager.networkManager, userId);

    print("thrapist activity init");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    activitynamController.dispose();
  }

  Future<bool> createActivity() async {
    final result = await activityService.createActivity(ActivityModel(
      date: activitydateController.text.trim(),
      description: activitydescriptionController.text.trim(),
      hour: activitytimeController.text.trim(),
      title: activitynamController.text.trim(),
    ));
    print(result?.id);

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
