import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/drop_down_controller.dart';

import '../../../model/therapist/coping_method/t_coping_method_model.dart';
import '../../../service/_therapist/profile/i_t_profile_service.dart';
import '../../../service/_therapist/profile/t_profile_serice.dart';

class TDealingMethodController extends DropDownController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async{
    tProfileService = TProfileService(vexaFireManager.networkManager);

    final List<TCopingMethodModel?>? fetchedCopingMethods = await tProfileService.getCopingMethodsOrdered();

    if (fetchedCopingMethods != null) {
      listOfCopingMethods.addAll(fetchedCopingMethods);
    }

    super.onInit();
  }

  RxList<TCopingMethodModel?> listOfCopingMethods = <TCopingMethodModel?>[].obs;

  late ITProfileService tProfileService;


}
