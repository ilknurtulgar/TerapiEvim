import 'package:get/get.dart';

class GroupController extends GetxController{
  var isChosen = List<bool>.filled(10, false).obs; // 10 değerini öylesine listeyi false ile doldurmak için verdim, fonksiyon içerisinde listenin uzunluğuna göre değişiyor
  var indexInController = (-1).obs; // choosing time for short call container içindeki listViewBuilder indexini controller'a almak için variable
                                    // ilk başta listview builderın herhangi bir indexiyle değeri aynı olmasın ve ikonlar gözükmesin diye eksili değer verdim 0 verince 0.indexli saatin ikonu yanıyor

  void choosingTime(int timeListLength, int index) { // choosing time for short call container içindeki saatleri seçmek için fonksiyon
    indexInController.value = index;
    isChosen = List<bool>.filled(timeListLength, false).obs;
    isChosen[indexInController.value] = !isChosen[indexInController.value];
  }
}