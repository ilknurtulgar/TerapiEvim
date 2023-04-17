import 'package:get/get.dart';

class PLockScreenController extends GetxController {
  var isTestNotSolved = true.obs;
  var isTestResultReady = false.obs;

  void testSolved() {
    isTestNotSolved.value = false;
  }
}
