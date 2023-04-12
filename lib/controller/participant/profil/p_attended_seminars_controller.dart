import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../drop_down_controller.dart';

class PAttendedSeminarsController extends DropDownController {
  List<String> list = <String>['Eskiden Yeniye', 'Yeniden Eskiye'];
  RxString dropdownValue = "Eskiden Yeniye".obs;
  changeDropDown(String value) {
    dropdownValue.value = value;
    notifyChildrens();
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
}
