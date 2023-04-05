import 'package:get/get.dart';

class TMessageController extends GetxController {
  var personValue = false.obs;
  void onPersonListChange() {
    personValue.value = !personValue.value;
  }
}
