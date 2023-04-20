import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../service/_participant/profile/i_p_profile_service.dart';
import '../../../service/_participant/profile/p_profile_serice.dart';
import '../../drop_down_controller.dart';

class PLastReviewController extends DropDownController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    pProfileService = PProfileService(vexaFireManager.networkManager);

    final List<TCopingMethodModel?>? fetchedCopingMethods = await pProfileService.getMyViewedCopingMethods();

    if (fetchedCopingMethods != null) {
      listOfCopingMethods.addAll(fetchedCopingMethods);
    }

    super.onInit();
  }

  RxList<TCopingMethodModel?> listOfCopingMethods = <TCopingMethodModel?>[].obs;

  late IPProfileService pProfileService;
}
