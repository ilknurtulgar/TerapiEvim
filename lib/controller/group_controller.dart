import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:terapievim/core/base/util/base_utility.dart';
import 'package:terapievim/core/base/util/text_utility.dart';

import 'base/base_controller.dart';

class GroupController extends GetxController with BaseController {
  var isChosen = List<bool>.filled(10, false)
      .obs; // 10 değerini öylesine listeyi false ile doldurmak için verdim, fonksiyon içerisinde listenin uzunluğuna göre değişiyor
  var rowIndexInController = (-1)
      .obs; // choosing time for short call container içindeki listViewBuilder indexini controller'a almak için variable
  // ilk başta listview builderın herhangi bir indexiyle değeri aynı olmasın ve ikonlar gözükmesin diye eksili değer verdim 0 verince 0.indexli saatin ikonu yanıyor
  var listviewIndexInController = (-1).obs;

  void choosingTime(int timeListLength, int rowIndex, int listviewIndex) {
    // choosing time for short call container içindeki saatleri seçmek için fonksiyon
    rowIndexInController.value = rowIndex;
    listviewIndexInController.value = listviewIndex;
    isChosen = List<bool>.filled(timeListLength, false).obs;
    isChosen[rowIndexInController.value] =
        !isChosen[rowIndexInController.value];
  }

  var isTrue = true.obs;
  late List<Widget> choice = <Widget>[
    Column(
      children: [
        IconUtility.checkCircleIcon,
        Text(
          GroupTextUtil.none,
          style: const TextStyle(color: AppColors.black),
        ),
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        Text(
          GroupTextUtil.veryLittle,
          style: const TextStyle(color: AppColors.black),
        ),
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        Text(
          GroupTextUtil.medium,
          style: const TextStyle(color: AppColors.black),
        ),
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        Text(
          GroupTextUtil.more,
          style: const TextStyle(color: AppColors.black),
        ),
      ],
    ),
    Column(
      children: [
        IconUtility.checkCircleIcon,
        Text(
          GroupTextUtil.extreme,
          style: const TextStyle(color: AppColors.black),
        ),
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
