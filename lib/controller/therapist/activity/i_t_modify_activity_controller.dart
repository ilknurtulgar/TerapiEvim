import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/base/component/group/scrollable_time.dart';
import '../../../core/base/component/toast/toast.dart';
import '../../../service/_therapist/activity/i_t_activity_service.dart';
import '../../../service/_therapist/activity/t_activity_service.dart';
import '../../base/base_controller.dart';

abstract class ITModifyActivityController extends GetxController
    with BaseController {
  @override
  void onInit() {
    activityNameController = TextEditingController();

    activityDescriptionController = TextEditingController();

    activityDateController = TextEditingController();

    activityTimeController = TextEditingController();

    activityService = TActivityService(vexaFireManager.networkManager);

    super.onInit();
  }

  @override
  void dispose() {
    activityNameController.dispose();
    activityDescriptionController.dispose();
    activityDateController.dispose();
    activityTimeController.dispose();
    super.dispose();
  }

  late final ITActivityService activityService;

  late final TextEditingController activityNameController;

  late final TextEditingController activityDescriptionController;

  late final TextEditingController activityDateController;

  late final TextEditingController activityTimeController;

  bool validateActivity() {
    if (activityNameController.text.trim().isEmpty) {
      flutterErrorToast("Event Name  is empty");
      return false;
    }
    if (activityDescriptionController.text.trim().isEmpty) {
      flutterErrorToast("Description is empty");
      return false;
    }
    if (activityDateController.text.trim().isEmpty) {
      flutterErrorToast("Date is empty");
      return false;
    }
    if (activityTimeController.text.trim() ==
        Timestamp.fromDate(DateTime.now())) {
      flutterErrorToast("Time is empty");
      return false;
    }
    return true;
  }

  RxString chosenHour = '12'.obs;

  RxString chosenMinutes = '00'.obs;
  void chooseGroupTherapyTime(bool isHour, int value) {
    String valueAsString = value.toString();
    if (valueAsString.length < 2) {
      valueAsString = '0${value.toString()}';
    }
    if (isHour)
      chosenHour.value = valueAsString;
    else
      chosenMinutes.value = valueAsString;
  }

  void showChoosingTimeDialog() {
    Get.dialog(AlertDialog(
      title: ScrollableTime(
        chooseHourFunction: (value) => chooseGroupTherapyTime(true, value),
        chooseMinuteFunction: (value) => chooseGroupTherapyTime(false, value),
        hourInitialValue: chosenHour.value.turnInt(),
        minuteInitialValue: chosenMinutes.value.turnInt(),
      ),
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
  }
}

extension GettingIntFromString on String {
  int turnInt() {
    int i = 0;
    int j = 0;
    int number = 0;
    for (i = 0; i < length; i++) {
       
       // buna sonradan bakıcam


      //this[i] = int.parse(this[i]) 
      /*for (j = 0; j < integerAsStrings.length; j++) {
        if (this[i] == integerAsStrings[j]) {
          number = number + integers[j] * (10 ^ (length - i - 1));
          print(number);
        }
      }*/
    }

    return number;
  }
}

List<String> integerAsStrings = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9'
];

List<int> integers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
