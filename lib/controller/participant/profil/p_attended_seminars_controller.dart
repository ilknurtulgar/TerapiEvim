import 'package:get/get.dart';

class PAttendedSeminarsController extends GetxController {
  List<String> list = <String>['Eskiden Yeniye', 'Yeniden Eskiye'];
  RxString dropdownValue = "Eskiden Yeniye".obs;
  changeDropDown(String value) {
    dropdownValue.value = value;
    notifyChildrens();
  }
}
