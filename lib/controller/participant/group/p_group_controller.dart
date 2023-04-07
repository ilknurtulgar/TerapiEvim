import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

class PGroupController extends GetxController {
  var isTrue = true.obs;
  late List<Widget> choice = <Widget>[
    Column(
      children: [
        IconUtility.checkCircleIcon,
        responsivenestext(
            GroupTextUtil.none, const TextStyle(color: AppColors.black))
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        responsivenestext(
            GroupTextUtil.veryLittle, const TextStyle(color: AppColors.black))
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        responsivenestext(
            GroupTextUtil.medium, const TextStyle(color: AppColors.black))
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        responsivenestext(
            GroupTextUtil.more, const TextStyle(color: AppColors.black))
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        responsivenestext(
            GroupTextUtil.extreme, const TextStyle(color: AppColors.black))
      ],
    ),
  ].obs;
  List<bool> selectedchoice = <bool>[true, false, false, false, false].obs;
  void selecttooggle(index) {
    for (int buttonIndex = 0;
        buttonIndex < selectedchoice.length;
        buttonIndex++) {
      if (buttonIndex == index) {
        selectedchoice[buttonIndex] = !selectedchoice[buttonIndex];
      } else {
        selectedchoice[buttonIndex] = false;
      }
    }
  }

  var selectedValue = 2.obs;
  void dropvalue(value) {
    selectedValue.value = value;
  }
}
