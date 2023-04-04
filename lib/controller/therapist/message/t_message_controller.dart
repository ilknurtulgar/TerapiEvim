import 'package:get/get.dart';

class TherapistyMessageController extends GetxController {
  var personvalue = false.obs;
  void personListchange() {
    personvalue.value = !personvalue.value;
  }
}
