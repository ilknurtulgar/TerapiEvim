import 'package:get/get.dart';

class TShortCallController extends GetxController{
  
  void onOffFunction(RxBool variable) {
    variable.value = !variable.value;
  }
}