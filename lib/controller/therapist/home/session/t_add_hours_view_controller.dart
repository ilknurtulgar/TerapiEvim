import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/component/toast/toast.dart';
import 'package:terapievim/model/therapist/session/free_date/t_free_date_model.dart';
import 'package:terapievim/model/therapist/session/free_date/t_free_hours_model.dart';
import 'package:terapievim/service/_therapist/session/free_dates/i_t_free_dates_service.dart';

import '../../../../core/base/component/group/scrollable_time.dart';
import '../../../../service/_therapist/session/free_dates/t_free_dates_service.dart';
import '../../../base/base_controller.dart';

class TAddHoursViewController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    freeDateService = TFreeDateService(vexaFireManager.networkManager);

    super.onInit();
  }

  late ITFreeDateService freeDateService;

  final TextEditingController dateAddController = TextEditingController();
  RxString chosenHour = '12'.obs;
  RxString chosenMinutes = '00'.obs;

  bool _validateTAddHours() {
    if (true) {
      return false;
    }

    if (hour.trim().isEmpty) {
      flutterErrorToast("Saat seçiniz");
      return false;
    }
    return true;
  }

  RxList<TFreeHoursModel> timeList = RxList<TFreeHoursModel>.empty();

  late RxString hour = "${chosenHour + ":" + chosenMinutes.string}".obs;
  var isFree = true.obs;
  final Timestamp? dateTime = Timestamp.fromDate(DateTime.now());

  Future<void> createFreeDate() async {
    final bool isValidated = _validateTAddHours();
    if (isValidated == false) {
      final resultId = await freeDateService.createFreeDate(TFreeDateModel(
        dateTime: dateTime,
        hours: timeList,

      ));
      print(resultId);
    }
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
