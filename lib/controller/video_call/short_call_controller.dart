import 'package:get/get.dart';

class ShortCallController extends GetxController{
  
  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }
}