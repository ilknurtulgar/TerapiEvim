import 'package:get/get.dart';

class LockScreenController extends GetxController {
  var isTestNotSolved = false.obs;
  var isTestResultReady = false.obs;

  void testSolved() {
    isTestNotSolved.value = false;
  }
}
