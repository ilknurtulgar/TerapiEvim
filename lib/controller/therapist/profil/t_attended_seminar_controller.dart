import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/drop_down_controller.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../../service/_therapist/profile/i_t_profile_service.dart';
import '../../../service/_therapist/profile/t_profile_serice.dart';

class TAttendedSeminarsController extends DropDownController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    tProfileService = TProfileService(vexaFireManager.networkManager);

    final List<TActivityModel> fetchedActivities =
        await tProfileService.getMyPastActivitiesOrdered();

    if (fetchedActivities.isNotEmpty) {
      listOfActivities.addAll(fetchedActivities);
    }

    super.onInit();
  }

  RxList<TActivityModel> listOfActivities = <TActivityModel>[].obs;

  late ITProfileService tProfileService;
}
