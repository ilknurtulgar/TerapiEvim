import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/drop_down_controller.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../../service/_therapist/profile/i_t_profile_service.dart';
import '../../../service/_therapist/profile/t_profile_serice.dart';

class TAttendedSeminarsController extends DropDownController {
  @override
  void setContext(BuildContext context) {
    controllerContext = context;
  }

  late final List<TActivityModel> fetchedActivities;

  @override
  Future<void> onInit() async {
    tProfileService = TProfileService(vexaFireManager.networkManager);

    fetchedActivities = await tProfileService.getMyPastActivitiesOrdered();

    if (fetchedActivities.isNotEmpty) {
      listOfActivities.addAll(fetchedActivities);
    }

    super.onInit();
  }

  void watchSeminar(int index) {
    //bu activitenin izlenmesi lazim
    fetchedActivities[index];
  }

  RxList<TActivityModel> listOfActivities = <TActivityModel>[].obs;

  late ITProfileService tProfileService;
}
