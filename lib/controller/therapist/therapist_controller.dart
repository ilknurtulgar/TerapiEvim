import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../product/enum/local_keys_enum.dart';
import '../base/base_controller_2.dart';

class TherapistController extends BaseController2 {
  void setContext(BuildContext context) {}

  @override
  void onInit() {
    /// TODO: add a service to get initial data
    isTherapistConfirmed.value =
        localManager.getBoolValue(LocalManagerKeys.isTherapistConfirmed) ??
            true;
    isDiplomaUploaded.value =
        localManager.getBoolValue(LocalManagerKeys.isTDiplomaUploaded) ?? false;
    super.onInit();
  }

  RxBool isTherapistConfirmed = true.obs;

  RxBool isDiplomaUploaded = false.obs;
}
