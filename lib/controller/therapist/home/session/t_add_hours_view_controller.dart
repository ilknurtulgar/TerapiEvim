import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/therapist/session/free_date/t_free_date_model.dart';
import 'package:terapievim/model/therapist/session/free_date/t_free_hours_model.dart';
import 'package:terapievim/service/_therapist/session/free_dates/i_t_free_dates_service.dart';
import 'package:terapievim/service/_therapist/session/free_dates/t_free_dates_service.dart';

import '../../../../core/base/component/group/scrollable_time.dart';
import '../../../base/base_controller.dart';

class TAddHoursViewController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  @override
  void onInit() {
    freeDateService = TFreeDateService(vexaFireManager.networkManager);

    super.onInit();
  }

  late ITFreeDateService freeDateService;

  final TextEditingController dateAddController = TextEditingController();
  RxString chosenHour = '12'.obs;
  RxString chosenMinutes = '00'.obs;

  Future<void> createFreeDate() async {
    final resultId = await freeDateService.createFreeDate(TFreeDateModel(
      dateTime: Timestamp.now(),
      hours: [TFreeHoursModel(hour: "12.00", isFree: true)],
    ));
  }

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
      ),
      titlePadding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
  }
}
