import 'package:get/get.dart';

class TestController extends GetxController {
  var testPageIndex = 0.obs;
  void nextPage() {
    testPageIndex.value++;
  }

  void previousPage() {
    if (testPageIndex.value != 0) {
      testPageIndex.value--;
    }
  }
}
