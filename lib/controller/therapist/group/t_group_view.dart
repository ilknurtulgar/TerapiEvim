import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../base/base_controller_2.dart';

class TGroupViewController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  RxBool isLockedOpen = false.obs;

  void changeisLockedOpen() {
    isLockedOpen.value = !isLockedOpen.value;
  }
}
