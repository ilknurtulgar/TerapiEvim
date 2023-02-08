import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  var isChosen = List<bool>.filled(10, false)
      .obs; // 10 değerini öylesine listeyi false ile doldurmak için verdim, fonksiyon içerisinde listenin uzunluğuna göre değişiyor
  var indexInController = (-1)
      .obs; // choosing time for short call container içindeki listViewBuilder indexini controller'a almak için variable
  // ilk başta listview builderın herhangi bir indexiyle değeri aynı olmasın ve ikonlar gözükmesin diye eksili değer verdim 0 verince 0.indexli saatin ikonu yanıyor

  void choosingTime(int timeListLength, int index) {
    // choosing time for short call container içindeki saatleri seçmek için fonksiyon
    indexInController.value = index;
    isChosen = List<bool>.filled(timeListLength, false).obs;
    isChosen[indexInController.value] = !isChosen[indexInController.value];
  }

  var isTrue = true.obs;
  late List<Widget> choice = <Widget>[
    Column(
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
        ),
        Text(
          "hiç",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
        ),
        Text(
          "çok az",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
        ),
        Text(
          "orta",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
        ),
        Text(
          "fazla",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
    Column(
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
        ),
        Text(
          "aşırı",
          style: TextStyle(color: Colors.black),
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
