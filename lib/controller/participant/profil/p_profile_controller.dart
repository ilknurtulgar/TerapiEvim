import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../product/enum/local_keys_enum.dart';
import '../../base/base_controller.dart';

class PProfileController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {}

  @override
  void onInit() {
    name = localManager.getStringValue(LocalManagerKeys.name);

    birthday = localManager.getStringValue(LocalManagerKeys.birthDate);

    imageUrl.value = localManager.getStringValue(LocalManagerKeys.imageUrl);

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // late IPProfileService pProfileService;

  RxString imageUrl = "".obs;

  String name = '';
  String birthday = '';

}
