import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/service/_participant/coping_methods/i_p_coping_method_service.dart';

import '../../../product/enum/local_keys_enum.dart';
import '../../../service/_participant/coping_methods/p_coping_method_service.dart';
import '../../base/base_controller.dart';

class PCopingMethodsController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  @override
  void onInit() {
    pCopingMethodService = PCopingMethodService(vexaFireManager.networkManager);

    pCopingMethodService.getCopingMethods(
        groupId: localManager.getStringValue(LocalManagerKeys.joinedGroupId));
    super.onInit();
  }

  late IPCopingMethodService pCopingMethodService;

  RxString orderValue = "yeniden eskiye ".obs;
  var isBoxSelected = false.obs;

  void setIsBoxSelected() {
    isBoxSelected.value = !isBoxSelected.value;
  }
}
