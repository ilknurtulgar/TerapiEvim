import 'package:get/get.dart';

class PGroupController extends GetxController {
  var isTrue = true.obs;

  var selectedValue = 2.obs;
  void dropvalue(value) {
    selectedValue.value = value;
  }
}
