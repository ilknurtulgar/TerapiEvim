import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:terapievim/model/common/activity/t_activity_model.dart';
import 'package:terapievim/service/_therapist/activity/t_activity_service.dart';

import '../../base/base_controller.dart';

class TActivityListViewController extends GetxController with BaseController {
  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Future<void> onInit() async {
    tActivityService = TActivityService(vexaFireManager.networkManager);
    List<TActivityModel?> activities =
        await tActivityService.getOtherRecentActivitiesOrdered();
    activity.addAll(activities);
    super.onInit();
  }

  RxList<TActivityModel?> activity = <TActivityModel?>[].obs;
  late TActivityService tActivityService;
}
