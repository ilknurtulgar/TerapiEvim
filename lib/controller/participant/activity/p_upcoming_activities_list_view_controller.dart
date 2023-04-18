import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/service/_participant/activity/p_activity_service.dart';

import '../../../model/common/activity/t_activity_model.dart';
import '../../base/base_controller.dart';

class PUpComingActivitiesListViewController extends GetxController
    with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    activityService = PActivityService(vexaFireManager.networkManager);
    final List<TActivityModel?> result =
        await activityService.getRecentActivitiesOrdered();
    upComingActivities.addAll(result);
    super.onInit();
  }

  RxList<TActivityModel?> upComingActivities = <TActivityModel?>[].obs;

  late PActivityService activityService;
}
