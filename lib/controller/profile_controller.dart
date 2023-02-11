import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  var birthOfDateController = TextEditingController().obs;
  Future<void> choosingBirthday() async {
    DateTime? pickedDate = await Get.dialog(DatePickerDialog(
        initialDate: DateTime(1990),
        firstDate: DateTime(1923),
        lastDate: DateTime(2004)));
    String? day;
    String? month;
    String? year;
    if (pickedDate != null) {
      day = pickedDate.day.toInt() < 10
          ? '0${pickedDate.day.toString()}'
          : pickedDate.day.toString();
      month = pickedDate.month.toInt() < 10
          ? '0${pickedDate.month.toString()}'
          : pickedDate.month.toString();
      year = pickedDate.year.toString();
      birthOfDateController.value.text = '$day/$month/$year';
    }
  }
}