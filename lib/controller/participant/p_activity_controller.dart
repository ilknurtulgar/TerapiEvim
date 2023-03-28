import 'package:get/get.dart';

import '../../service/model/common/activity/t_activity_model.dart';
import '../../service/service/_participant/activity/i_p_activity_service.dart';
import '../../service/service/_participant/activity/p_activity_service.dart';
import '../base/base_controller.dart';

class PActivityController extends GetxController with BaseController {
  late IPActivityService activityService;

  RxList<TActivityModel?> recentActivities = <TActivityModel?>[].obs;

  RxList<TActivityModel?> pastActivities = <TActivityModel?>[].obs;

  @override
  Future<void> onInit() async {
    activityService = PActivityService(vexaFireManager.networkManager);

    await fetchRecentActivities();
    await fetchPastActivities();

    super.onInit();
  }

  @override
  void dispose() {
    recentActivities.clear();
    pastActivities.clear();
    super.dispose();
  }

  Future<void> fetchRecentActivities() async {
    List<TActivityModel?> fetchedActivities =
        await activityService.getRecentActivities();

    recentActivities.addAll(fetchedActivities);

    return;
  }

  Future<void> fetchPastActivities() async {
    List<TActivityModel?> fetchedActivities =
        await activityService.getRecentActivities();

    pastActivities.addAll(fetchedActivities);

    return;
  }
}
