import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/core/base/component/group/custom_list_wheel_scroll_view.dart';

import '../../../core/base/component/group/scrollable_time.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../service/_therapist/group/i_t_group_service.dart';
import '../../../service/_therapist/group/t_group_service.dart';

class TGroupController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  @override
  Future<void> onInit() async {
    tGroupService = TGroupService(vexaFireManager.networkManager);

    List<TGroupModel?> groups = await tGroupService.getGroupsOrdered();
    fetchedGroups.addAll(groups);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late ITGroupService tGroupService;

  RxString chosenHour = '12'.obs;

  RxString chosenMinutes = '00'.obs;

  RxInt numberOfGroupsTherapistIsAdvisor = 0.obs;

  void chooseGroupTherapyTime(bool isHour, int value) {
    String valueAsString = value.toString();
    if (valueAsString.length < 2) {
      valueAsString = '0${value.toString()}';
    }
    if (isHour) chosenHour.value = valueAsString;
    else chosenMinutes.value = valueAsString;
  }

  void showChoosingTimeDialog() {
    Get.dialog(AlertDialog(
      title: ScrollableTime(
        chooseHourFunction: (value) => chooseGroupTherapyTime(true, value),
        chooseMinuteFunction: (value) => chooseGroupTherapyTime(false, value),
      ),
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
  }

  //lock screen controller
  var isTherapistUploaded = true.obs;
  var isLockedOpen = false.obs;

  void changeIsTherapistLoaded() {
    isTherapistUploaded.value = !isTherapistUploaded.value;
  }

  void changeIsLockOpen() {
    isLockedOpen.value = !isLockedOpen.value;
  }

  RxList<TGroupModel?> fetchedGroups = <TGroupModel?>[].obs;
}
