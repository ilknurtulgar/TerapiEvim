import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../../service/_participant/profile/i_p_profile_service.dart';
import '../../../service/_participant/profile/p_profile_serice.dart';
import '../../drop_down_controller.dart';

class PAttendedSeminarsController extends DropDownController {
  List<String> list = <String>['Eskiden Yeniye', 'Yeniden Eskiye'];
  RxString dropdownValue = "Eskiden Yeniye".obs;
  changeDropDown(String value) {
    dropdownValue.value = value;
    notifyChildrens();
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    pProfileService = PProfileService(vexaFireManager.networkManager);

    final List<TActivityModel> fetchedActivities =
        await pProfileService.getMyJoinedActivities();

    if (fetchedActivities.isNotEmpty) {
      listOfActivities.addAll(fetchedActivities);
    }

    super.onInit();
  }

  RxList<TActivityModel> listOfActivities = <TActivityModel>[].obs;

  late IPProfileService pProfileService;
}
