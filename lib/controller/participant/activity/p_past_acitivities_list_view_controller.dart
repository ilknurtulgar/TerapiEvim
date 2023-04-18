import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/controller/base/base_controller.dart';
import 'package:terapievim/service/_participant/activity/p_activity_service.dart';

import '../../../model/common/activity/t_activity_model.dart';

class PPastActivitiesListViwController extends GetxController
    with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  Future<void> onInit() async {
    activityService = PActivityService(vexaFireManager.networkManager);

    final List<TActivityModel?> result =
        await activityService.getPastActivitiesOrdered();
    fetchedpastActivity.addAll(result);
    super.onInit();
  }

  RxList<TActivityModel?> fetchedpastActivity = <TActivityModel?>[].obs;

  late PActivityService activityService;
}
