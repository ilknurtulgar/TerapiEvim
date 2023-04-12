import 'package:get/get.dart';

class PAttendedSeminarsController extends GetxController {
  List<String> list = <String>['Eskiden Yeniye', 'Yeniden Eskiye'];
  RxString dropdownValue = "Eskiden Yeniye".obs;
  changeDropDown(String value) {
    dropdownValue.value = value;
    notifyChildrens();
  }

  RxString orderValue = "Yeniden eskiye ".obs;

  var isBoxSelected = false.obs;

  void setIsBoxSelected() {
    isBoxSelected.value = !isBoxSelected.value;
  }
}
