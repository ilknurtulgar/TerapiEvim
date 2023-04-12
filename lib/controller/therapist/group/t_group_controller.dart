import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
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

  RxInt numberOfGroupsTherapistIsAdvisor = 0.obs;

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
