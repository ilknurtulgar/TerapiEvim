import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller_2.dart';

import '../therapist_controller.dart';

class TUploadedController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  @override
  void onInit() {
    therapistController = Get.find();
    super.onInit();
  }

  RxBool isTherapistUploaded = true.obs;
  late TherapistController therapistController;
  void changeIsTherapistLoaded() {
    isTherapistUploaded.value = !isTherapistUploaded.value;

    //birde burdaa diger controllerla baglanti kurup giris yapilmasi lazim
    // therapistController.isTherapistConfirmed bakilmasi lazim
  }
}
