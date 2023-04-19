import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/therapist/session/free_date/t_free_date_model.dart';
import 'package:terapievim/product/enum/local_keys_enum.dart';
import 'package:terapievim/service/_participant/session/i_p_session_service.dart';
import 'package:terapievim/service/_participant/session/p_session_service.dart';

import '../../../core/base/util/base_utility.dart';
import '../../base/base_controller_2.dart';

class PDeterminingShortCallController extends BaseController2 {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    pService = PSessionService(vexaFireManager.networkManager);
    participantName.value = localManager.getStringValue(LocalManagerKeys.name);

    await getAvailableHours();
  }

  RxString participantName = ''.obs;

  RxBool isLoading = false.obs;
  late IPSessionService pService;
  RxList<TFreeDateModel> freeDates =
      <TFreeDateModel>[].obs; //datalari vireda gostermen gerek

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
  Future<void> getAvailableHours() async {
    isLoading.value = true;
    final List<TFreeDateModel> availableHours =
        await pService.getAvailableHoursOrdered();
    freeDates.addAll(availableHours);
    isLoading.value = false;
    return;
  }
}
