import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/base/component/group/scrollable_time.dart';

class TherapistGroupController extends GetxController {
  List<bool> isButtonOn = List<bool>.filled(10, false).obs;
  void switchButtonFunction(int index, bool value) {
    isButtonOn[index] = value;
  }

  RxString chosenHour = '12'.obs;
  RxString chosenMinutes = '00'.obs;
  RxInt numberOfGroupsTherapistIsAdvisor = 0.obs;
  void scrollableWidgetFunction(String whichOne, int value) {
    String valueAsString = value.toString();
    if (whichOne != 'number of groups' && valueAsString.length < 2) {
      valueAsString = '0${value.toString()}';
    }
    if (whichOne == 'hour') {
      chosenHour.value = valueAsString;
    } else if (whichOne == 'minutes') {
      chosenMinutes.value = valueAsString;
    } else {
      numberOfGroupsTherapistIsAdvisor.value = value;
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
  void changeSecTherapistElection() {
    isSecTherapistElectionOpen.value = !isSecTherapistElectionOpen.isTrue;
  }

  var isDayElectionOpen = false.obs;
  void changeDayElection() {
    isDayElectionOpen.value = !isDayElectionOpen.isTrue;
  }

  void changeChoosenDay(String day) {
    choosenDay = RxString(day);
  }

  var choosenDay = "Gun Seciniz".obs;
  var choosenSecTherapist = "Yok".obs;
  var isSecTherapistChoosed = false.obs;

  void changeChoosenSecTherapist(String name) {
    isSecTherapistChoosed.value = true;
    choosenSecTherapist.value = name;
  }

  var isParticipantElectionOpen = false.obs;
  void changeParticipantElection() {
    isParticipantElectionOpen.value = !isParticipantElectionOpen.value;
  }

  //lock screen controller
  var isTherapistUploaded = true.obs;
  var isLockedOpen = true.obs;

  RxList<RxList<String>> timeListInControllerList = [
    ['öylesine string'].obs
  ].obs;

  void getTimeListToController(List<String> timeList, int listviewIndex) {
    if (listviewIndex == 0) {
      timeListInControllerList.clear();
    }
    timeListInControllerList.add(timeList.obs);
  }

  void deleteTime(List<String> timeList, int rowIndex, int listViewIndex) {
    timeListInControllerList[listViewIndex]
        .remove(timeListInControllerList[listViewIndex][rowIndex]);
    // print(timeListInControllerList);
  }
}
