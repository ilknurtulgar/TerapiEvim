import 'package:get/get.dart';

class TherapistProfileController extends GetxController {
  var isMakingShortCallAccepted = false.obs;
  var isBeingAdvisorAccepted = false.obs;
  var isNumberVisible = false.obs; // yardımcı psikologluk yapılabilecek grup sayısının belli olması

  void acceptionFunction(bool isAcceptionForMakingShortCall) {
    if (isAcceptionForMakingShortCall) {
      isMakingShortCallAccepted.value = !isMakingShortCallAccepted.value;
    } else {
      isBeingAdvisorAccepted.value = !isBeingAdvisorAccepted.value;
      isNumberVisible.value = !isNumberVisible.value;
    }
    print('çalışıyor');
  }

 
}
