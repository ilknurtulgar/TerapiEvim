import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/models/row_model.dart';
import '../core/base/component/group/scrollable_time.dart';

class TherapistGroupController extends GetxController {
  List<bool> isButtonOn = List<bool>.filled(10, false).obs;
  void switchButtonFunction(int index, bool value) {
    isButtonOn[index] = value;
  }

  RxString chosenHour = '12'.obs;
  RxString chosenMinutes = '00'.obs;
  void choosingTimeOfGroupTherapy(bool isHour, String value) {
    if (value.length < 2) value = '0$value';
    if (isHour) {
      chosenHour.value = value;
    } else {
      chosenMinutes.value = value;
    }
  }

  void showChoosingTimeDialog() {
    Get.dialog(AlertDialog(
      title: ScrollableTime(),
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
  }

  //grup eklmee kismi icin controller
  var isSecTherapistElectionOpen = false.obs;
  void ChangeSecTherapistElection() {
    isSecTherapistElectionOpen.value = !isSecTherapistElectionOpen.isTrue;
  }

  var isDayElectionOpen = false.obs;
  void ChangeDayElection() {
    isDayElectionOpen.value = !isDayElectionOpen.isTrue;
  }

  void ChangeChoosenDay(String day) {
    ChoosenDay = RxString(day);
  }

  var ChoosenDay = "Gun Seciniz".obs;
  var ChoosenSecTherapist = "Yok".obs;
}
