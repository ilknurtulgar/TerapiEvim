import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';

class ActivityController extends GetxController {
  var activityIcon = false.obs;

  void iconFilter() {
    if (activityIcon == false) {
      activityIcon.value = true;
      IconUtility.activityIcon;
    } else {
      activityIcon.value = false;
    }
  }

  List<String> orderingList = ["yeniden eskiye", "eskiden yeniye"];
  List<String> genderList = ["kadın", "erkek"];
  var gender = "seçiniz".obs;
  late var order = orderingList[0].obs;
  void func(int rowIndex, String purpose) {
    if (purpose == "gender") {
      gender.value = genderList[rowIndex];
    } else {
      order.value = orderingList[rowIndex];
    }
  }

  var selectedBox = false.obs;
  void changeBox() {
    print("ilknur");
    selectedBox.value = !selectedBox.value;
    print(selectedBox.value.toString());
  }

  late RxInt selectedValue;
  void selectedInt(val) {
    selectedValue.value = val;
  }

  var isObsecure = true.obs;

  var yasemin = false.obs;
  void obsecureChange() {
    isObsecure.value = !isObsecure.value;
  }
}
