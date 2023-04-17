import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/drop_down_controller.dart';
import 'package:terapievim/service/_participant/coping_methods/i_p_coping_method_service.dart';

import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../product/enum/local_keys_enum.dart';
import '../../../service/_participant/coping_methods/p_coping_method_service.dart';

class PCopingMethodsController extends DropDownController {
  @override
  void setContext(BuildContext context) {}

  @override
  Future<void> onInit() async {
    pCopingMethodService = PCopingMethodService(vexaFireManager.networkManager);

    final List<TCopingMethodModel?> result =
        await pCopingMethodService.getCopingMethods(
            groupId:
                localManager.getStringValue(LocalManagerKeys.joinedGroupId));
    fetchedCoping.addAll(result);
    super.onInit();
  }

  RxList<TCopingMethodModel?> fetchedCoping = <TCopingMethodModel?>[].obs;
  late IPCopingMethodService pCopingMethodService;
}
