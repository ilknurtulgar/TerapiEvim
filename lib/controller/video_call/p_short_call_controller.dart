import 'package:get/get.dart';

class PShortCallController extends GetxController{
  
  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }
}