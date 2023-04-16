import 'package:get/get.dart';

import '../../../core/base/util/base_utility.dart';

class PDeterminingShortCallController extends GetxController {
  var isChosen = List.filled(DemoInformation.tmpCount, false).obs;
  String chosenDate = '';
  String chosenTime = '';

  void callBack(String chosenDateInContainer, String chosenTimeInContainer) {
    chosenDate = chosenDateInContainer;
    chosenTime = chosenTimeInContainer;
    print('DATE $chosenDate TIME $chosenTime');
  }

  void saveButton() {
    //burada save edilmeli
  }
}
