import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';

import '../../../core/base/component/group/scrollable_time.dart';
import '../../../model/therapist/group/t_group_model.dart';
import '../../../service/_therapist/group/i_t_group_service.dart';
import '../../../service/_therapist/group/t_group_service.dart';

class TGroupController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  @override
  Future<void> onInit() async {
    tGroupService = TGroupService(vexaFireManager.networkManager);

    List<TGroupModel?> groups = await tGroupService.getGroupsOrdered();
    fetchedGroups.addAll(groups);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  late ITGroupService tGroupService;

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

  //lock screen controller
  var isTherapistUploaded = true.obs;
  var isLockedOpen = false.obs;

  void changeIsTherapistLoaded() {
    isTherapistUploaded.value = !isTherapistUploaded.value;
  }

  void changeIsLockOpen() {
    isLockedOpen.value = !isLockedOpen.value;
  }

  var timeListsInController = [].obs;

  // müsait olduğum saatler sayfasında saat ekle kısmında kaydet butonuyla timeListsInController'a saat listesi ekleneceği için bu fonksiyona gerek kalmıyor
  /*void getTimeListToController(List<String> timeList) {
    timeListInControllerList.add(timeList.obs);
  }*/

  void deleteTimeInMainPage(int rowIndex, int listViewIndex) {
    timeListsInController[listViewIndex]
        .remove(timeListsInController[listViewIndex][rowIndex]);
    // print(timeListInControllerList);
  }

  var tempTimes = []
      .obs; // ilknur bu listeye saatleri teker teker ekleyecek ardından kaydet butonuna basınca bu liste timeListInControllerList e eklenecek sonra başka bir tarih için tempList temizlenecek

  void deleteTimeInAddingPage(int rowIndex) {
    tempTimes.remove(tempTimes[rowIndex]);
  }

  RxList<TGroupModel?> fetchedGroups = <TGroupModel?>[].obs;
}
